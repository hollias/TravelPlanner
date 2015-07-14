package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.PlannerSJoin;
@Repository
public class PlannerSJoinDaoImpl implements PlannerSJoinDao{
	@Autowired
	SqlSession session;
	public List<PlannerSJoin> diary(String memberid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		return session.selectList("diary",memberid);
	}
	public List<PlannerSJoin> diarycheck(String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannername", plannername);
		return session.selectList("diarycheck", plannername);
	}

}
