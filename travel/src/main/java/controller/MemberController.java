package controller;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PagingBean;
import model.Member;
import model.Planner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.MapService;
import service.RailnoService;
import service.ShopService;
import utils.WebConstants;
@Controller
public class MemberController {
	@Autowired
	private ShopService shopService;
	@Autowired
	private RailnoService rs;
	@Autowired
	private MapService ms;
	
	@RequestMapping(value="user") // 중복체크용
	public String user(HttpServletRequest request, Model model){
		String memberid = request.getParameter("memberid");
		
		String mIdcheck = shopService.getMid(memberid);
		if(mIdcheck ==null){
			model.addAttribute("memberid", memberid);
			model.addAttribute("message", "중복된 아이디가 아님니다.");
		}else{
			model.addAttribute("message","이미 있는 아이디 입니다");
		}
		return "joinus/loginCheck";
	}	
	@RequestMapping(value={"join"}, method=RequestMethod.GET)//별거아님
	public String join(){		
		return "joinus/join";
	}	
	@RequestMapping(value={"join"}, method=RequestMethod.POST)//회원가입
	public String join(Member member , Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		shopService.createMember(member);
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		return "joinus/joinSuccess";
	}	
	@RequestMapping(value={"joinSuccess"}, method=RequestMethod.GET)//회원가입 성공
	public String joinSuccess(String memberid, Model model ){	
		Member member = shopService.getMember(memberid);
		model.addAttribute("member", member);
		return "joinus/joinSuccess";
	}
	@RequestMapping(value={"adminMember"}, method=RequestMethod.GET)//관리자에서 회원정보 보기
	public String adminMember(String memberid, HttpSession session, Model model){		
		Member member = shopService.getMember(memberid);
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		model.addAttribute("member", member);
		return "admin/adminMember";
	}
	@RequestMapping(value={"login"}, method=RequestMethod.GET)
	public String login(){
		return "joinus/login";
	}	
	@RequestMapping(value={"login"}, method=RequestMethod.POST)//로그인 
	public String login(Member mem, Model model, HttpSession session, HttpServletRequest request){
		Member member = shopService.getMemberBymIdAndPassword(mem);
		Member loginUser = member;
		Planner ps = null;
		Date da = null;
		GregorianCalendar gc =  new GregorianCalendar();
		Date date = gc.getTime();
		System.out.println("date="+date);
		if(member == null){
			model.addAttribute("message", "아이디가 없습니다.");
			return "joinus/login";
		}else if(member.getMemberid().matches("master")){
			session.setAttribute(WebConstants.USER_KEY, loginUser);
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("member", member);
			return "admin/adminMain";
			
		}else{
			session.setAttribute(WebConstants.USER_KEY, loginUser);
			ps = rs.plannerOne(loginUser.getMemberid());
			System.out.println(1);
			if(ps==null){
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("member", member);
			return "main";
			}else{
				System.out.println(2);
				da = ms.da(ps.getPlannerid());
				if(date.after(da)){
					System.out.println("3>"+"plannerid="+ps.getPlannerid()+">memberid="+loginUser.getMemberid());
					 rs.plongo(""+ps.getPlannerid(), loginUser.getMemberid());
				}
				model.addAttribute("loginUser", loginUser);
				model.addAttribute("member", member);
			return "main";
			}
		}
	}	
	@RequestMapping(value="mypage")//내정보 페이지
	public String mypage(String memberid, Model model, HttpSession session){
		Member member = shopService.getMember(memberid);
		model.addAttribute("member", member);
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		return "joinus/mypage";
	}	
	@RequestMapping(value="logout")//로그아웃 및 세션 날리기
	public String clear(Model model, HttpSession session){
		session.setAttribute(WebConstants.USER_KEY, null);
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		model.addAttribute("loginUser", loginUser);
		return "main";
	}	
	@RequestMapping(value="memberClear")//회원탈퇴
	public String memberClear(HttpSession session, Model model, String memberid){
		session.setAttribute(WebConstants.USER_KEY, null);
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		shopService.deleteMember(memberid);
		model.addAttribute("loginUser", loginUser);
		return "redirect:main.html";
	}	
	@RequestMapping(value={"editMember"}, method=RequestMethod.GET)//회원 정보 보기
	public String editMember(HttpSession session, Model model, String memberid){
		Member member = shopService.getMember(memberid);
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}
		model.addAttribute("member", member);
		return "joinus/editMember";
	}	
	@RequestMapping(value={"editMember"}, method=RequestMethod.POST) //회원정보 수정
	public String editMember(HttpSession session, Model model, Member member){
		shopService.updateMember(member);
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
		}
		return "joinus/editSuccess";
	}
	@RequestMapping(value="joinList")//관리자 메뉴에서 회원정보 리스트
	public String joinList(Model model, HttpServletRequest request,
			HttpSession session, String currentPage){
		int total = shopService.getTotalRecordMember();
		int start = 1;		
		if (currentPage != null && !currentPage.equals(""))
			start = Integer.parseInt(currentPage);
		List<Member> memberList = shopService.getMemberList(start);
		
		PagingBean pb = new PagingBean(request, total);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pb", pb);
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		return "admin/joinList";	
	}	
	@RequestMapping(value="idFind", method=RequestMethod.GET) //회원아이디 찻기
	public String idFind(){
		return "joinus/idFind";
	}
	@RequestMapping(value="idFind", method=RequestMethod.POST) //회원아이디 찻기
	public String idFindCk(Member member ,Model model,HttpSession session){
		Member mb = rs.idFind(member);
		if(mb == null){
			model.addAttribute("message","이름 or 이메일이 없습니다.");
			return "joinus/idFind";
		}
		model.addAttribute("member",mb);
		return "joinus/idFindSucces";
	}
	@RequestMapping(value="pwFind", method=RequestMethod.GET) //회원 비밀번호 찻기
	public String pwFind(){
		return "joinus/pwFind";
	}
	@RequestMapping(value="pwFind", method=RequestMethod.POST) //회원 비밀번호 찻기
	public String pwFindCk(Member member ,Model model,HttpSession session){
		Member mb = rs.pwFind(member);
		if(mb == null){
			model.addAttribute("message","전화번호가 틀립니다.");
			return "joinus/idFind";
		}
		model.addAttribute("member",mb);
		return "joinus/pwFindSucces";
	}
}