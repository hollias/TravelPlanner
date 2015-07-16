package dao;

import java.util.HashMap;
import java.util.Map;

import model.Area;
import model.Line;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class LineDaoImpl implements LineDao{
	@Autowired
	private SqlSession session;
	
	public int insertLine(Line line) {
		return session.insert("insertLine", line);		
	}

	
	public Boolean confirmLine(String startpoint, String endpoint) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("startpoint", startpoint);
		map.put("endpoint", endpoint);
		Line line = session.selectOne("confirm",map);
		if(line == null)
			return true;
		else
			return false;
	}


	@Override
	public int updateLine(String startpoint, String endpoint) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("startpoint", startpoint);
		map.put("endpoint", endpoint);		
		return session.update("updateLine",map);
	}


	@Override
	public int selectLineId(String startpoint, String endpoint) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("startpoint", startpoint);
		map.put("endpoint", endpoint);
		return session.selectOne("selectLineId", map);
	}


	@Override
	public Line findNextLocal(String local) {
		
		return session.selectOne("findNextLocal", local);
	}

}
