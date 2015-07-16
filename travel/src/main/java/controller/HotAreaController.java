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

import service.RailnoService;
import utils.WebConstants;

@Controller
public class HotAreaController {
	@Autowired
	private RailnoService rs;
	@RequestMapping(value="hotarea")
	public String hotarea(Model model, HttpSession session,String plannername, String plannerid
				,String local,String memberid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		Planner plannerName = null;
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(memberid==null){
			plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
			memberid = loginUser.getMemberid();
		}else{
			plannerName = rs.plannerName(memberid, plannername);
		}
		List<PlannerS> calendar = rs.calendar(plannerid);
		Area areaOne = rs.areaOne(local);
		List<Hot> hotimage = rs.hotimage(local);
		model.addAttribute("hotimage",hotimage);
		model.addAttribute("areaOne",areaOne);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("memberid",memberid);
		return "hotarea/hotarea";
	}
	@RequestMapping(value="hacontent")
	public String haOne(Model model, HttpSession session,String plannername, String plannerid
				,String local,String memberid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		Planner plannerName = null;
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(memberid==null){
			plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
			memberid = loginUser.getMemberid();
		}else{
			plannerName = rs.plannerName(memberid, plannername);
		}
		List<PlannerS> calendar = rs.calendar(plannerid);
		Area areaOne = rs.areaOne(local);
		List<Hot> hotimage = rs.hotimage(local);
		model.addAttribute("hotimage",hotimage);
		model.addAttribute("areaOne",areaOne);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("memberid",memberid);
		return "hotarea/hacontent";
	}
	@RequestMapping(value="hotmap")
	public String hotmap(Model model, HttpSession session,String plannername, String plannerid
				,String local, Hot hot,String memberid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		Planner plannerName = null;
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(memberid==null){
			plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
			memberid = loginUser.getMemberid();
		}else{
			plannerName = rs.plannerName(memberid, plannername);
		}
		List<Hot> hotlist = rs.hotlist(hot);
		Area areaOne = rs.areaOne(local);
		List<PlannerS> calendar = rs.calendar(plannerid);
		model.addAttribute("areaOne",areaOne);
		model.addAttribute("hotlist",hotlist);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("memberid",memberid);
		return "hotarea/hotmap";
	}
}