package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import model.Area;
import model.Member;
import model.Planner;
import model.PlannerS;
import model.PlannerSJoin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.MapService;
import service.RailnoService;
import utils.WebConstants;
@Controller
public class PlannerController {
   @Autowired
   private RailnoService rs;
   @Autowired
   private MapService ms;
   
   @RequestMapping(value="diary")   
   public String diary(Model model, HttpSession session){
      List<Area> al = (List<Area>) ms.getArea();
      model.addAttribute("area", al);
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      if(loginUser != null){
         model.addAttribute("loginUser", loginUser);
      }
      if (loginUser == null) {
         return "joinus/login";
      }
      List<Planner> list = rs.list(loginUser.getMemberid());
      List<PlannerSJoin> diary = rs.diary(loginUser.getMemberid());
      Planner plannerOne = rs.plannerOne(loginUser.getMemberid());
      model.addAttribute("plannerOne",plannerOne);
      model.addAttribute("diary",diary);
      model.addAttribute("list",list);
      return "diary/diary";
   }
   @RequestMapping(value="diarycheck" , method=RequestMethod.POST)
   public String diarycheck(Model model , String plannername, HttpSession session){
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      if(loginUser != null){
         model.addAttribute("loginUser", loginUser);
      }
      List<Planner> list = rs.list(loginUser.getMemberid());
      List<PlannerSJoin> diarycheck = rs.diarycheck(plannername);
      model.addAttribute("list",list);
      model.addAttribute("diarycheck",diarycheck);
      return "diary/diarycheck";
   }
   @RequestMapping(value="sccal")
   public String sccal(Model model, HttpSession session , String plannerid, String plannername){
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      if(loginUser != null){
         model.addAttribute("loginUser", loginUser);
      }
      List<PlannerS> calendar = rs.calendar(plannerid);
      Planner plannerName = rs.plannerName(loginUser.getMemberid(), plannername);
      model.addAttribute("plannerName",plannerName);
      System.out.println(calendar.get(1).getDay());
      model.addAttribute("calendar",calendar);
      return "diary/sccal";
   }
}