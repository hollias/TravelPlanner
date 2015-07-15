package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.PlannerS;
@Repository
public class PlannerSDaoImpl implements PlannerSDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertPlannerS(PlannerS planners) {
		return session.insert("insertPlannerS", planners);
	}

	@Override
	public int ongoingPlannerSCount(int ongoingPlannerId) {
		return session.selectOne("ongoingPlannerSCount", ongoingPlannerId);
	}
	
	public List<PlannerS> calendar(String plannerid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannerid", plannerid);
		return session.selectList("calendar",map);
	}

	@Override
	public String findPlannerStartdate(int ongoingPlannerId) {
		return session.selectOne("findPlannerStartdate", ongoingPlannerId);
	}

	@Override
	public int plannerSCount(int plannerId) {
		return session.selectOne("plannerSCount",plannerId);
	}

	@Override
	public List<PlannerS> selectOngoingPlannerS(int plannerId) {
		return session.selectList("selectOngoingPlannerS", plannerId);
	}

	@Override
	public void submitPlannerS(PlannerS plannerS) {
		session.insert("submitPlannerS", plannerS);
		
	}
	@Override
	public void submitPlannerS2(PlannerS plannerS) {
		session.insert("submitPlannerS2", plannerS);
		
	}

	@Override
	public void plannerSAllDelete(int plannerId) {
		session.delete("plannerSAllDelete", plannerId);
		
	}

	@Override
	public PlannerS getLocalBylineorder(String lineorder, int plannerId) {
		String plannerId1 = plannerId+"";
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("lineorder", lineorder);
		map.put("plannerId", plannerId1);
		return session.selectOne("getLocalBylineorder", map);
	}

	@Override
	public Date da(int plannerId) {
		return session.selectOne("reda", plannerId);
	}
	

}
