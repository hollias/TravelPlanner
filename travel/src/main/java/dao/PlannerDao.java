package dao;

import java.util.List;

import model.Area;
import model.Planner;

public interface PlannerDao {
	public int createPlanner(Planner planner);
	public int selectPlannerId(Planner planner);
	public int confirmOngoing(String loginUser);
	public int ongoingPlannerId(String loginUser);
	public String findPlannerName(int ongoingPlannerId);
	public List<Area> getArea();
	Planner plannerOne(String memberid);
	List<Planner> list(String memberid);
	Planner plannerName(String memberid, String plannername);
	public void updatePlannerName(Planner planner);
	public List<Planner> mainMap();
	public int plongo(String plannerid,String memberid); 	// 현재 플레너 ->지난플레너로 변경
}
