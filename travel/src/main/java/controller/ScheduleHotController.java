package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import model.Member;
import model.Planner;
import model.PlannerS;
import model.ScheduleHot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.RailnoService;
import utils.WebConstants;

@Controller
public class ScheduleHotController {
	@Autowired
	private RailnoService rs;
	@RequestMapping(value="home")
	public String total(ScheduleHot schedulehot, Model model, 
			HttpSession session,String plannername, String plannerid,String memberid){
		Planner plannerName = null;
		ScheduleHot stay = null;
		ScheduleHot restaurant = null;
		ScheduleHot tourist = null;
		ScheduleHot total = null;
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(memberid!=null){
			 stay = rs.stay(memberid, plannername);
			 restaurant = rs.restaurant(memberid, plannername);
			 tourist = rs.tourist(memberid, plannername);
			 total = rs.total(memberid, plannername);
			 plannerName = rs.plannerName(memberid, plannername);
		}else{
			stay = rs.stay(loginUser.getMemberid(), plannername);
			restaurant = rs.restaurant(loginUser.getMemberid(), plannername);
			tourist = rs.tourist(loginUser.getMemberid(), plannername);
			total = rs.total(loginUser.getMemberid(), plannername);
			plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
			memberid = loginUser.getMemberid();
		}
		List<PlannerS> calendar = rs.calendar(plannerid);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("restaurant",restaurant);
		model.addAttribute("stay",stay);
		model.addAttribute("tourist",tourist);
		model.addAttribute("total",total);
		model.addAttribute("memberid",memberid);
		return "diary/home";
	}
	@RequestMapping(value="schedule")
	public String schedule(Model model, HttpSession session,String plannername, String plannerid,String memberid){
		Member loginUser = (Member)session.getAttribute(WebConstants.USER_KEY);
		List<ScheduleHot> schot = null;
		Planner plannerName = null; 
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		if(memberid != null){
			schot = rs.schot(memberid, plannername);
			plannerName = rs.plannerName(memberid, plannername);
		}else{
			schot = rs.schot(loginUser.getMemberid(), plannername);
			plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
		}
		List<PlannerS> calendar = rs.calendar(plannerid);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("schot",schot);
		return "diary/schedule";
	}
}