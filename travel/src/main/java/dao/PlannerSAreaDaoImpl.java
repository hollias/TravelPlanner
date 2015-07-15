package dao;

import java.util.HashMap;
import java.util.List;





import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MapJoin;
import model.PlannerSArea;
@Repository
public class PlannerSAreaDaoImpl implements PlannerSAreaDao{
	@Autowired
	private SqlSession session;
	
	public List<PlannerSArea> selectPlannerSArea(int ongoingPlannerId) {
		return session.selectList("selectPlannerSArea", ongoingPlannerId);
	}
	public List<MapJoin> mapjoin(String memberid, String plannername) {
		Map<String ,String> map = new HashMap<String,String>();
		map.put("memberid",memberid);
		map.put("plannername",plannername);
		return session.selectList("mj",map);
	}
}
