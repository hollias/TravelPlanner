package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Area;
@Repository
public class AreaDaoImpl implements AreaDao{
	@Autowired
	SqlSession session;
	public Area areaOne(String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		return session.selectOne("areaOne",map);
	}
	public List<Area> areaname(Area area) {
		return session.selectList("areaname",area);
	}
	
}
