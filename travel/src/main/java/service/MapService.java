package service;

import java.util.Date;
import java.util.List;

import model.Area;
import model.Hot;
import model.Line;
import model.Planner;
import model.PlannerS;
import model.PlannerSArea;
import model.Schedule;
import model.ScheduleHot;

public interface MapService {
	public int insertLine(Line line);
	public int updateLine(String startpoint,String endpoint);
	public Boolean confirmLine(String startpoint,String endpoint);
	public int createPlanner(Planner planner);
	public int selectPlannerId(Planner planner);
	public int selectLineId(String startpoint,String endpoint);
	public int insertPlannerS(PlannerS planners);
	public int confirmOngoing(String loginUser);
	public int ongoingPlannerId(String loginUser);
	public List<PlannerSArea> selectPlannerSArea(int ongoingPlannerId);
	public int ongoingPlannerSCount(int ongoingPlannerId);
	//플래너 아이디를 통해 플래너 내임을 찾는것
	public String findPlannerName(int ongoingPlannerId);
	public List<Area> getArea();
	public String findPlannerStartdate(int ongoingPlannerId);
	public int plannerSCount(int plannerId);
	//진행중인 플래너S를 아이디를 통해 가져오는것
	public List<PlannerS> selectOngoingPlannerS(int plannerId);
	public void submitPlannerS(PlannerS plannerS);
	public void submitPlannerS2(PlannerS plannerS);
	public void plannerSAllDelete(int plannerId);
	public void updatePlannerName(Planner planner);
	//local의 hot을 가져오는것
	public List<Hot> getHot(String local);
	//멤버아이디와 플래너 이름을 통해 일정 갯수 가져오는것
	public int scheduleCount(String memberid, String plannerTitle);
	//멤버아이디와 플러너 이름을 통해 모든 일정가져오기
	public List<ScheduleHot> getAllSchedule(String memberid, String plannerTitle,String local);
	//x,y좌표를 이용하여 hot의 id를 찾는 것
	public int findHotId(Hot hot);
	//일정표를 삽입하는 부분
	public int insertSchedule(Schedule schedule);
	//dday와 memberid와 plannername을 통해 schedule을 가져오는것
	public List<ScheduleHot> selectDdaySchedule(String dday, String plannerName, String memberid,String local);
	//매인페이지 새로만들어진 플레너 경로 및 순서 가지고 오는 것
	public List<Planner> mainMap();
	//스케쥴상세페이지에서 지역을 눌렀을때 지역 스케쥴을 가져오는것
	public List<ScheduleHot> getLocalSchedule(String memberid, String plannerTitle, String local);
	//lineorder로 local가져오는것
	public PlannerS getLocalBylineorder(String lineorder, int plannerId);
	//지역에 해당하는 스케쥴의 갯수를 가져옴
	public int scheduleLocalCount(String memberid,String plannerTitle,String local);
	// Date 검색해서 day 더해서 가져오기
	public Date da(int plannerId);
	//모든 스케쥴을 가져옴
	public List<Schedule> getTotalSchedule();
	//모든 스케쥴 지움
	public void deleteSchedule(int inx);
	//해당 인텍스의 스케쥴정보를 가져오는것
	public ScheduleHot selectScheduleHotInfo(int inx);
	//추천 지역 검색
	public Line findNextLocal(String local);
	
}
