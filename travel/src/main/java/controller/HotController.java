package controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import model.Area;
import model.Hot;
import model.Member;
import model.Planner;
import model.PlannerS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.RailnoService;
import utils.WebConstants;
@Controller
public class HotController {
	@Autowired
	private RailnoService rs;
	@RequestMapping(value="schot")
	public String schot(Model model, HttpSession session, String local, String hotname, String plannername){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		Hot hotone = rs.hotone(local, hotname);
		model.addAttribute("hotone",hotone);
		return "diary/schot";
	}
	@RequestMapping(value="hotrest")
	public String hotrest(Model model, HttpSession session,String plannername, String plannerid
				,String local){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		List<Hot> hotrest = rs.hotrest(local);
		Planner plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
		List<PlannerS> calendar = rs.calendar(plannerid);
		Area areaOne = rs.areaOne(local);
		List<Hot> hotimage = rs.hotimage(local);
		model.addAttribute("hotimage",hotimage);
		model.addAttribute("areaOne",areaOne);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("hotrest",hotrest);
		return "hotarea/hotrest";
	}
	@RequestMapping(value="hottourist")
	public String hottourist(Model model, HttpSession session,String plannername, String plannerid
				,String local){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		List<Hot> hottourist = rs.hottourist(local);
		Planner plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
		List<PlannerS> calendar = rs.calendar(plannerid);
		Area areaOne = rs.areaOne(local);
		List<Hot> hotimage = rs.hotimage(local);
		model.addAttribute("hotimage",hotimage);
		model.addAttribute("areaOne",areaOne);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("hottourist",hottourist);
		return "hotarea/hottourist";
	}
	@RequestMapping(value="hotstay")
	public String hotstay(Model model, HttpSession session,String plannername, String plannerid
				,String local){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		List<Hot> hotstay = rs.hotstay(local);
		Planner plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
		List<PlannerS> calendar = rs.calendar(plannerid);
		Area areaOne = rs.areaOne(local);
		List<Hot> hotimage = rs.hotimage(local);
		model.addAttribute("hotimage",hotimage);
		model.addAttribute("areaOne",areaOne);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("hotstay",hotstay);
		return "hotarea/hotstay";
	}
	@RequestMapping(value="hotajax")
	public String hotajax(Model model, HttpSession session, String hotid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		Hot hotajax = rs.hotajax(hotid);
		rs.hotHitUp(hotid);
		model.addAttribute("hotajax",hotajax);
		return "hotarea/hotajax";
	}

	@RequestMapping(value = "hotwrite", method = RequestMethod.GET)
	public String hotwrite(Model model, Area area , HttpSession session) {
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(loginUser == null){
			return "joinus/login";
		}
		List<Area> areaname = rs.areaname(area);
		model.addAttribute("areaname",areaname);
		return "hotarea/hotwrite";
	}
	@RequestMapping(value = "hotwriteSubmit", method = RequestMethod.POST)
	public String hotwriteSubmit(Model model, Hot hot , HttpSession session){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(-1 == hot.getHotcontent().indexOf("upload/")){
			hot.setHotimage("cc.jpg");
		}else{
			int idx = hot.getHotcontent().indexOf("upload/");
			String localimage= hot.getHotcontent().substring(idx+7,idx+24);
			hot.setHotimage(localimage);
		}
		hot.setMemberId(loginUser.getMemberid());
		hot.setReadcount(0);
		hot.setHotcontent(hot.getHotcontent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		rs.inserthot(hot);
		return "redirect:hotmain.do";
	}
	@RequestMapping(value = "hotupdate")
	public String hotupdate(Model model , Hot hot, HttpSession session,String hotid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		Hot hotajax = rs.hotajax(hotid);
		model.addAttribute("hotajax",hotajax);
		return "hotarea/hotupdate";
	}
	@RequestMapping(value = "hotmodify", method = RequestMethod.POST)
	public String modify(HttpSession session,Model model, String hotid, Area area) {
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		List<Area> areaname = rs.areaname(area);
		model.addAttribute("areaname",areaname);
		model.addAttribute("hotajax",rs.hotajax(hotid));
		model.addAttribute("hotmodify", "true");
		return "hotarea/hotwrite";
	}
	
	@RequestMapping(value = "hotmodifySubmit", method = RequestMethod.POST)
	public String hotmodifySubmit(HttpSession session,Model model, Hot hot) {
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(-1 == hot.getHotcontent().indexOf("upload/")){
			hot.setHotimage("cc.jpg");
		}else{
			int idx = hot.getHotcontent().indexOf("upload/");
			String localimage= hot.getHotcontent().substring(idx+7,idx+24);
			hot.setHotimage(localimage);
		}
		hot.setMemberId(loginUser.getMemberid());
		hot.setHotcontent(hot.getHotcontent().replaceAll("\n", "").replaceAll("\t", "").replaceAll("\r", "").replaceAll("'", "&apos;"));
		rs.updatehot(hot);
		return "redirect:hotupdate.do?hotid="+hot.getHotid();
	}
	@RequestMapping(value = "hotDel" ,  method = RequestMethod.POST)
	public String boardDel(HttpSession session,Model model, String hotid){
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		rs.deletehot(hotid);
		return "redirect:hotmain.do";
	}
	@RequestMapping(value = "hotmain")
	public String hotmain(Model model, Hot hot){
		List<Hot> hotlist = rs.hotlist(hot);
		model.addAttribute("hotlist",hotlist);
		return "hot/hotmain";
	}
	@RequestMapping(value = "htrest")
	public String htrest(Model model, Hot hot){
		List<Hot> htrest = rs.htrest(hot);
		model.addAttribute("htrest",htrest);
		return "hot/htrest";
	}
	@RequestMapping(value = "httourist")
	public String httourist(Model model, Hot hot){
		List<Hot> httourist = rs.httourist(hot);
		model.addAttribute("httourist",httourist);
		return "hot/httourist";
	}
	@RequestMapping(value = "htstay")
	public String htstay(Model model, Hot hot){
		List<Hot> htstay = rs.htstay(hot);
		model.addAttribute("htstay",htstay);
		return "hot/htstay";
	}
	@RequestMapping(value="hotajax2", method = RequestMethod.POST)
	public String hotajax2(Model model, String hotname, String x){
		Hot hotajax2 = rs.hotajax2(hotname, x);
		model.addAttribute("hotajax2",hotajax2);
		return "hotarea/hotajax2";
	}		
}