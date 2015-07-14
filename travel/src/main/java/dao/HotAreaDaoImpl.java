package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.HotArea;
@Repository
public class HotAreaDaoImpl implements HotAreaDao{
	@Autowired
	SqlSession session;
	public List<HotArea> hotarealist(String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		return session.selectList("hotarealist",map);
	}
}