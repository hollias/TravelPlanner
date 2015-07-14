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
}
