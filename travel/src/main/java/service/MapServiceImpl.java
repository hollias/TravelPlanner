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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.HotDao;
import dao.LineDao;
import dao.PlannerDao;
import dao.PlannerSAreaDao;
import dao.PlannerSDao;
import dao.ScheduleDao;
import dao.ScheduleHotDao;
@Service
public class MapServiceImpl implements MapService{

	@Autowired
	private LineDao md;
	@Autowired
	private PlannerDao pd;
	@Autowired
	private PlannerSDao psd;
	@Autowired
	private PlannerSAreaDao psad;
	@Autowired
	private HotDao hd;
	@Autowired
	private ScheduleDao sd;
	@Autowired
	private ScheduleHotDao shd;
	
	public int insertLine(Line line) {
		int result = md.insertLine(line);
		return result;
	}

	
	public Boolean confirmLine(String startpoint, String endpoint) {
		return md.confirmLine(startpoint,endpoint);
	}


	@Override
	public int updateLine(String startpoint, String endpoint) {
		return md.updateLine(startpoint, endpoint);
	}


	@Override
	public int createPlanner(Planner planner) {
		return pd.createPlanner(planner);
	}


	@Override
	public int selectPlannerId(Planner planner) {
		return pd.selectPlannerId(planner);
	}


	@Override
	public int selectLineId(String startpoint, String endpoint) {
		return md.selectLineId(startpoint,endpoint);
	}


	@Override
	public int insertPlannerS(PlannerS planners) {
		return psd.insertPlannerS(planners);
	}


	@Override
	public int confirmOngoing(String loginUser) {
		return pd.confirmOngoing(loginUser);
	}


	public int ongoingPlannerId(String loginUser) {
		return pd.ongoingPlannerId(loginUser);
	}


	
	public List<PlannerSArea> selectPlannerSArea(int ongoingPlannerId) {
		return psad.selectPlannerSArea(ongoingPlannerId);
	}


	@Override
	public int ongoingPlannerSCount(int ongoingPlannerId) {
		return psd.ongoingPlannerSCount(ongoingPlannerId);
	}


	@Override
	public String findPlannerName(int ongoingPlannerId) {
		return pd.findPlannerName(ongoingPlannerId);
	}


	@Override
	public List<Area> getArea() {
		return pd.getArea();
	}


	@Override
	public String findPlannerStartdate(int ongoingPlannerId) {
		return psd.findPlannerStartdate(ongoingPlannerId);
	}


	@Override
	public int plannerSCount(int plannerId) {
		return psd.plannerSCount(plannerId);
	}


	@Override
	public List<PlannerS> selectOngoingPlannerS(int plannerId) {
		return psd.selectOngoingPlannerS(plannerId);
	}


	@Override
	public void submitPlannerS(PlannerS plannerS) {
		psd.submitPlannerS(plannerS);		
	}
	@Override
	public void submitPlannerS2(PlannerS plannerS) {
		psd.submitPlannerS2(plannerS);		
	}

	@Override
	public void plannerSAllDelete(int plannerId) {
		psd.plannerSAllDelete(plannerId);
		
	}


	@Override
	public void updatePlannerName(Planner planner) {
		pd.updatePlannerName(planner);
		
	}


	@Override
	public List<Hot> getHot(String local) {
		return hd.getHot(local);
	}


	@Override
	public int scheduleCount(String memberid, String plannerTitle) {
		return sd.scheduleCount(memberid, plannerTitle);
	}


	@Override
	public List<ScheduleHot> getAllSchedule(String memberid, String plannerTitle,String local) {
		return shd.getAllSchedule(memberid,plannerTitle,local);
	}


	@Override
	public int findHotId(Hot hot) {
		return hd.findHotId(hot);
	}


	public int insertSchedule(Schedule schedule) {
		return sd.insertSchedule(schedule);
	}


	@Override
	public List<ScheduleHot> selectDdaySchedule(String dday,
			String plannerName, String memberid,String local) {
		return shd.selectDdaySchedule(dday,plannerName,memberid,local);
	}
	
	public List<Planner> mainMap() {
	      return pd.mainMap();
	   }


	


	@Override
	public PlannerS getLocalBylineorder(String lineorder, int plannerId) {
		return psd.getLocalBylineorder(lineorder,plannerId);
	}


	@Override
	public List<ScheduleHot> getLocalSchedule(String memberid,
			String plannerTitle, String local) {
		return shd.getLocalSchedule(memberid,plannerTitle,local);
	}


	@Override
	public int scheduleLocalCount(String memberid, String plannerTitle,
			String local) {
		return shd.scheduleLocalCount(memberid,plannerTitle,local);
	}


	@Override
	public Date da(int plannerId) {
		return psd.da(plannerId);
	}


	@Override
	public List<Schedule> getTotalSchedule() {
		return sd.getTotalSchedule();
	}


	@Override
	public void deleteSchedule(int inx) {
		sd.deleteSchedule(inx);
		
	}


	@Override
	public ScheduleHot selectScheduleHotInfo(int inx) {
		return shd.selectScheduleHotInfo(inx);
	}


	
}
