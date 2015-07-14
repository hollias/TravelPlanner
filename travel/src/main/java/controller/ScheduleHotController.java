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
			HttpSession session,String plannername, String plannerid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		ScheduleHot stay = rs.stay(loginUser.getMemberid(), plannername);
		ScheduleHot restaurant = rs.restaurant(loginUser.getMemberid(), plannername);
		ScheduleHot tourist = rs.tourist(loginUser.getMemberid(), plannername);
		ScheduleHot total = rs.total(loginUser.getMemberid(), plannername);
		Planner plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
		List<PlannerS> calendar = rs.calendar(plannerid);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("restaurant",restaurant);
		model.addAttribute("stay",stay);
		model.addAttribute("tourist",tourist);
		model.addAttribute("total",total);
		return "diary/home";
	}
	@RequestMapping(value="schedule")
	public String schedule(Model model, HttpSession session,String plannername, String plannerid){
		Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
		if(loginUser != null){
			model.addAttribute("loginUser", loginUser);
		}
		List<ScheduleHot> schot = rs.schot(loginUser.getMemberid(), plannername);
		Planner plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
		List<PlannerS> calendar = rs.calendar(plannerid);
		model.addAttribute("calendar",calendar);
		model.addAttribute("plannerName",plannerName);
		model.addAttribute("schot",schot);
		return "diary/schedule";
	}
}