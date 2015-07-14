package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Hot;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotDaoImpl implements HotDao{
	@Autowired
	private SqlSession session;
	
	public Hot hotone(String local, String hotname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		map.put("hotname", hotname);
		return session.selectOne("hotone",map);
	}
	public List<Hot> hotrest(String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		return session.selectList("hotrest",map);
	}
	public List<Hot> hottourist(String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		return session.selectList("hottourist",map);
	}
	public List<Hot> hotstay(String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		return session.selectList("hotstay",map);
	}
	public Hot hotajax(String hotid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hotid", hotid);
		return session.selectOne("hotajax",map);
	}
	public List<Hot> hotimage(String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		return session.selectList("hotimage",map);
	}
	public int inserthot(Hot hot) {
		return session.insert("inserthot",hot);
	}
	public int updatehot(Hot hot) {
		return session.update("updatehot",hot);
	}
	public int deletehot(String hotid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("hotid", hotid);
		return session.delete("deletehot",map);
	}
	public List<Hot> hotlist(Hot hot) {
		return session.selectList("hotlist",hot);
	}
	public List<Hot> htrest(Hot hot) {
		return session.selectList("htrest",hot);
	}
	public List<Hot> httourist(Hot hot) {
		return session.selectList("httourist",hot);
	}
	public List<Hot> htstay(Hot hot) {
		return session.selectList("htstay",hot);
	}
	public Hot hotajax2(String hotname, String x) {
		Map<String,String> map =new HashMap<String,String>();
		map.put("hotname", hotname);
		map.put("x",x);
		return session.selectOne("hotajax2",map);
	}
	public List<Hot> getHot(String local) {
		return session.selectList("getHot", local);
	}	
	
	public int hotHitUp(String hotid){  // hot 아이템 리드카운터
		return session.update("hotHitUp", hotid);
	}

	
	public int findHotId(Hot hot) {				
		return session.selectOne("findHotId", hot);
	}

}
