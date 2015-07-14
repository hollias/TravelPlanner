package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.PlannerLine;
@Repository
public class PlannerLineDaoImpl implements PlannerLineDao{
	@Autowired
	SqlSession session;
	public List<PlannerLine> diary(String memberid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		return session.selectList("diary",memberid);
	}

}
