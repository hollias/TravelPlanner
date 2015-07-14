package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Area;
import model.Planner;
@Repository
public class PlannerDaoImpl implements PlannerDao{
	@Autowired
	private SqlSession session;
	
	public int createPlanner(Planner planner) {
		return session.insert("createPlanner", planner);
	}

	@Override
	public int selectPlannerId(Planner planner) {
		return session.selectOne("selectPlannerId",	planner);
	}

	@Override
	public int confirmOngoing(String loginUser) {
		return session.selectOne("confirmOngoing",loginUser);
	}

	public int ongoingPlannerId(String loginUser) {
		return session.selectOne("ongoingPlannerId",loginUser);
	}

	@Override
	public String findPlannerName(int ongoingPlannerId) {
		return session.selectOne("findPlannerName", ongoingPlannerId);
	}

	@Override
	public List<Area> getArea() {
		return session.selectList("getArea");
	}
	public Planner plannerOne(String memberid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		return session.selectOne("plannerOne", map);
	}
	public List<Planner> list(String memberid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		return session.selectList("list",map);
	}
	public Planner plannerName(String memberid, String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("plannername", plannername);
		return session.selectOne("plannerName",map);
	}

	public void updatePlannerName(Planner planner) {		
		session.update("updatePlannerName", planner);
	}
	
	public List<Planner> mainMap() {
	      return session.selectList("mainList");
	}
}
