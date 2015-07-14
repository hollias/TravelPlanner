package dao;

import java.util.List;



import model.MapJoin;
import model.PlannerSArea;

public interface PlannerSAreaDao {
	public List<PlannerSArea> selectPlannerSArea(int ongoingPlannerId);
	public List<MapJoin> mapjoin(String memberid, String plannername);
}
