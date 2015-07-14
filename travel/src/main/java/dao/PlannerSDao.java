package dao;

import java.util.Date;
import java.util.List;

import model.PlannerS;

public interface PlannerSDao {
	public int insertPlannerS(PlannerS planners);
	public int ongoingPlannerSCount(int ongoingPlannerId);
	public List<PlannerS> calendar(String plannerid);
	public String findPlannerStartdate(int ongoingPlannerId);
	public int plannerSCount(int plannerId);
	public List<PlannerS> selectOngoingPlannerS(int plannerId);
	public void submitPlannerS(PlannerS plannerS);
	public void plannerSAllDelete(int plannerId);
	public PlannerS getLocalBylineorder(String lineorder,int plannerId);
}
