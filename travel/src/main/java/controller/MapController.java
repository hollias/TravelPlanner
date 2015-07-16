package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Area;
import model.Hot;
import model.Line;
import model.MapJoin;
import model.Member;
import model.Planner;
import model.PlannerS;
import model.PlannerSArea;
import model.Schedule;
import model.ScheduleHot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MapService;
import service.RailnoService;
import service.ShopService;
import utils.WebConstants;

@Controller
public class MapController {
   @Autowired
   private MapService ms;
   @Autowired
   private RailnoService rs;

   @RequestMapping(value = "introMap")
   public String introMap(Model model, String plannername, HttpSession session) {
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      if (loginUser != null) {
         model.addAttribute("loginUser", loginUser);
      }

      List<Area> al = (List<Area>) ms.getArea();
      if (loginUser == null) {
         loginUser = new Member();
         loginUser.setMemberid("null");
      }
      List<MapJoin> mj = rs.mapjoin(loginUser.getMemberid(), plannername);
      model.addAttribute("mj", mj);
      model.addAttribute("area", al);
      return "introMap";
   }

   @RequestMapping(value = "diaryMap")
   public String dairyMap(Model model, String plannername,
         HttpSession session, String memberid) {
      List<MapJoin> mj = null;
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      if (loginUser != null) {
         model.addAttribute("loginUser", loginUser);
      }
      if (memberid == null) {
         memberid = loginUser.getMemberid();
         mj = rs.mapjoin(memberid, plannername);
      } else {
         mj = rs.mapjoin(memberid, plannername);
      }
      List<Area> al = (List<Area>) ms.getArea();
      model.addAttribute("mj", mj);
      model.addAttribute("area", al);
      return "diary/diaryMap";
   }

   @RequestMapping(value = "planner")
   public String map(HttpSession session, Model model) {

      List<Area> al = (List<Area>) ms.getArea();
      model.addAttribute("area", al);
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      if (loginUser != null) {
         model.addAttribute("loginUser", loginUser);
      }
      if (loginUser == null) {
         return "/joinus/login";
      } else {
         int ongoingPlanner = ms.confirmOngoing(loginUser.getMemberid());
         if (ongoingPlanner == 1) {

            int ongoingPlannerId = ms.ongoingPlannerId(loginUser
                  .getMemberid());
            String plannername = ms.findPlannerName(ongoingPlannerId);
            List<PlannerSArea> list = ms.selectPlannerSArea(ongoingPlannerId);
            String startdate = ms.findPlannerStartdate(ongoingPlannerId);

            model.addAttribute("list", list);
            model.addAttribute("plannername", plannername);
            model.addAttribute("startdate", startdate);
            model.addAttribute("plannerId", ongoingPlannerId);
            return "planner/ongoingPlanner";
         } else {

            // 처음 만드는 플래너
            Planner planner = new Planner();
            planner.setMemberid(loginUser.getMemberid());
            planner.setOngoing(0);
            ms.createPlanner(planner);
            int pid = ms.selectPlannerId(planner);
            model.addAttribute("plannerId", pid);
            return "planner/planner";
         }

      }

   }

   @RequestMapping(value = "line")
   public String line(String local, String plannerId, Model model) {
      int pid = Integer.parseInt(plannerId);
      int plannerSCount = ms.plannerSCount(pid);
      PlannerS planners = new PlannerS();
      planners.setPlannerid(pid);
      planners.setLocal(local);
      int result = ms.insertPlannerS(planners);
      List<PlannerS> list = ms.selectOngoingPlannerS(pid);
      model.addAttribute("list", list);
      return "planner/line";
   }

   @RequestMapping(value = "addSchedule")
   public String lineDetail(String dday, String local, String plannerId,
         Model model, HttpSession session, String x, String y) {
	   
      double x1 = Double.parseDouble(x);
      int pid = Integer.parseInt(plannerId);
      int dday1 = Integer.parseInt(dday);
      String plannerName = ms.findPlannerName(pid);
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      Schedule schedule = new Schedule();
      schedule.setPlannername(plannerName);
      schedule.setMemberid(loginUser.getMemberid());
      schedule.setDday(dday1);
      Hot hot = new Hot();
      hot.setX(x1);
      int hotId = ms.findHotId(hot);
      schedule.setHotid(hotId);
      
      int result = ms.insertSchedule(schedule);
      
      List<ScheduleHot> list = ms.selectDdaySchedule(dday, plannerName,
            loginUser.getMemberid(),local);
      
      model.addAttribute("list", list);

      return "planner/scheduleLine";
   }

   @RequestMapping(value = "detailSubmit")
   public String detailSubmit(Model model, HttpSession session) {

      return "redirect:planner.do";
   }

   @RequestMapping(value = "deletePlannerS")
   public String deletePlannerS(String index, Model model, HttpSession session) {
      int inx = Integer.parseInt(index) - 1;
      
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      // planner 정보 저장
      Planner planner = new Planner();
      planner.setMemberid(loginUser.getMemberid());

      int plannerId = ms.selectPlannerId(planner);
      List<PlannerS> list = ms.selectOngoingPlannerS(plannerId);
      
      ms.plannerSAllDelete(plannerId);      
      list.remove(inx);
      
      for (int i = 0; i < list.size(); i++) {
    	 list.get(i).setLineorder(i+1);
         ms.submitPlannerS2(list.get(i));
      }
      List<PlannerS> list1 = ms.selectOngoingPlannerS(plannerId);
      model.addAttribute("list", list1);

      return "planner/line";
   }
   
   @RequestMapping(value = "deleteSchedule")
   public String deleteSchedule(String index, Model model, HttpSession session) {
	   
      int inx = Integer.parseInt(index);
      ScheduleHot sch = ms.selectScheduleHotInfo(inx);
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);      
      ms.deleteSchedule(inx);       
      
     String dday = sch.getDday()+"";
     String plannerName = sch.getPlannername();
     String local = sch.getLocal();
     List<ScheduleHot> list = ms.selectDdaySchedule(dday, plannerName,loginUser.getMemberid(),local);
     model.addAttribute("list", list);
     for(int i=0;i<list.size();i++)
    	 System.out.println(list.get(i).getScheduleid()+list.get(i).getHotname());
      return "planner/scheduleLine";
   }
   @RequestMapping(value = "MapSubmit")
   public String MapSubmit(String startdate, String plannerTitle, String day,
         Model model, HttpSession session) {
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      // planner 정보 저장
      Planner planner = new Planner();

      planner.setMemberid(loginUser.getMemberid());
      int plannerId = ms.selectPlannerId(planner);
      planner.setPlannername(plannerTitle);
      planner.setPlannerid(plannerId);

      ms.updatePlannerName(planner);

      // 플래너s정보를 리스트에 저장후 삭제
      List<PlannerS> list = ms.selectOngoingPlannerS(plannerId);   	  
      ms.plannerSAllDelete(plannerId);

      // 경로 만드는 부분
      Line line;
      for (int i = 0; i < list.size() - 1; i++) {
         line = new Line();
         if (ms.confirmLine(list.get(i).getLocal(), list.get(i + 1)
               .getLocal())) {
            line.setStartpoint(list.get(i).getLocal());
            line.setEndpoint(list.get(i + 1).getLocal());
            int result = ms.insertLine(line);
         } else {
            ms.updateLine(list.get(i).getLocal(), list.get(i + 1)
                  .getLocal());
         }
      }

      // 플래너 일정 만드는 부분
      PlannerS planners = new PlannerS();
      String[] day1 = day.split(",");
      /*
       * String[] day2 = new String[day1.length+1]; System.arraycopy(day1, 0,
       * day2, 1, day1.length); day2[0]= "0";
       * System.out.println("day = "+day2[0]);
       */
      Date da = null;
      for (int i = 0; i < list.size(); i++) {

         planners.setPlannerid(list.get(i).getPlannerid());
         planners.setLocal(list.get(i).getLocal());
         planners.setLineorder(i+1);
         // planners.setDd(day2[i]);
         planners.setDay(day1[i]);
         
         if (da == null) {
            SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
            try {
               da = (Date) transFormat.parse(startdate);               
            } catch (ParseException e) {             
               e.printStackTrace();
            }

            planners.setDa(da);
         } else {
            da = ms.da(list.get(i).getPlannerid());

            planners.setDa(da);
         }
         ms.submitPlannerS(planners);

      }

      // 상세 일정페이지로 보낼 데이터들
      model.addAttribute("plannerTitle", plannerTitle);
      model.addAttribute("startDate", startdate);
      
      List<PlannerS> ps = ms.selectOngoingPlannerS(plannerId);
      model.addAttribute("plannerS", ps);

      String local = ps.get(0).getLocal();
      int sc = ms.scheduleCount(loginUser.getMemberid(), plannerTitle);

      if (sc == 0) {
         String slist = "";
         model.addAttribute("slist", slist);

      } else {
    	  
         List<ScheduleHot> slist = ms.getAllSchedule(loginUser.getMemberid(), plannerTitle,local);
         model.addAttribute("slist", slist);
      }
      
      int lineorder = ps.get(0).getLineorder();
      Area area = rs.areaOne(local);
      model.addAttribute("x", area.getX());
      model.addAttribute("y", area.getY());
      
      List<Hot> al = ms.getHot(local);
      
      model.addAttribute("lineorder", lineorder);
      model.addAttribute("dday", 1);      
      model.addAttribute("local1", local);
      model.addAttribute("hot", al);
      model.addAttribute("plannerId", planner.getPlannerid());
      model.addAttribute("day", day1[0]);

      return "planner/detailPlanner";
   }

   @RequestMapping(value = "selectDday")
   public String selectDday(String dday, String plannerTitle,String local,String lineorder,
         String startDate, Model model, HttpSession session) {
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);
      int dday1 = Integer.parseInt(dday);
      int lineorder1 = Integer.parseInt(lineorder);
      
      Planner planner = new Planner();
      planner.setMemberid(loginUser.getMemberid());

      int plannerId = ms.selectPlannerId(planner);

      model.addAttribute("plannerTitle", plannerTitle);
      model.addAttribute("startDate", startDate);

      List<ScheduleHot> slist = ms.selectDdaySchedule(dday, plannerTitle,
            loginUser.getMemberid(),local);
      model.addAttribute("slist", slist);

      List<PlannerS> ps = ms.selectOngoingPlannerS(plannerId);
      
      
      Area area = rs.areaOne(local);
      
      model.addAttribute("x", area.getX());
      model.addAttribute("y", area.getY());

      List<Hot> al = ms.getHot(local);
      
      List<PlannerS> ps1 = ms.selectOngoingPlannerS(plannerId);
      model.addAttribute("plannerS", ps1);
      String dd = ps1.get(lineorder1-1).getDay();
      
      model.addAttribute("lineorder",lineorder);      		
      model.addAttribute("day",dd);
      model.addAttribute("hot", al);
      model.addAttribute("plannerId", plannerId);
      model.addAttribute("local1",local);
      model.addAttribute("dday", dday);

      return "planner/detailPlanner";
   }

   @RequestMapping(value = "selectLocal")
   public String selectLocal(String lineorder, String plannerTitle,
         String startDate, Model model, HttpSession session) {
      Member loginUser = (Member) session.getAttribute(WebConstants.USER_KEY);

      Planner planner = new Planner();
      planner.setMemberid(loginUser.getMemberid());

      int plannerId = ms.selectPlannerId(planner);

      // lineorder과 plannerId로 local가져오는것
      PlannerS planners = ms.getLocalBylineorder(lineorder, plannerId);
      String local = planners.getLocal();
      model.addAttribute("plannerTitle", plannerTitle);
      model.addAttribute("startDate", startDate);

      int sc = ms.scheduleLocalCount(loginUser.getMemberid(), plannerTitle,
            local);

      if (sc == 0) {
         String slist = "";
         model.addAttribute("slist", slist);

      } else {
         List<ScheduleHot> slist = ms.getLocalSchedule(
               loginUser.getMemberid(), plannerTitle, local);
         
         model.addAttribute("slist", slist);

      }

      List<PlannerS> ps = ms.selectOngoingPlannerS(plannerId);
      model.addAttribute("plannerS", ps);

      Area area = rs.areaOne(local);
      model.addAttribute("x", area.getX());
      model.addAttribute("y", area.getY());

      List<Hot> al = ms.getHot(local);
      
      model.addAttribute("lineorder",lineorder);
      model.addAttribute("local1",local);
      model.addAttribute("dday",1);
      model.addAttribute("hot", al);
      model.addAttribute("plannerId", plannerId);
      model.addAttribute("day", planners.getDay());

      return "planner/detailPlanner";
   }

}