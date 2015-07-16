package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Schedule;
import model.ScheduleHot;


@Repository
public class ScheduleHotDaoImpl implements ScheduleHotDao{
	@Autowired
	private SqlSession session;
	public ScheduleHot restaurant(String memberid, String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannername", plannername);
		map.put("memberid", memberid);
		return session.selectOne("restaurant",map);
	}
	public ScheduleHot tourist(String memberid, String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannername", plannername);
		map.put("memberid", memberid);
		return session.selectOne("tourist",map);
	}
	public ScheduleHot total(String memberid, String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannername", plannername);
		map.put("memberid", memberid);
		return session.selectOne("total",map);
	}
	public ScheduleHot stay(String memberid, String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannername", plannername);
		map.put("memberid", memberid);
		return session.selectOne("stay",map);
	}
	public List<ScheduleHot> schot(String memberid, String plannername) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("plannername", plannername);
		map.put("memberid", memberid);
		return session.selectList("schot",map);
	}
	@Override
	public List<ScheduleHot> getAllSchedule(String memberid, String plannerTitle) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("plannername", plannerTitle);
		
		return session.selectList("getAllSchedule", map);
	}
	@Override
	public List<ScheduleHot> selectDdaySchedule(String dday,
			String plannerName, String memberid,String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("local", local);
		map.put("dday", dday);
		map.put("plannerName", plannerName);
		map.put("memberid", memberid);
		return session.selectList("selectDdaySchedule", map);
	}
	@Override
	public List<ScheduleHot> getLocalSchedule(String memberid,
			String plannerTitle, String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("plannerName", plannerTitle);
		map.put("local", local);
		
		return session.selectList("getLocalSchedule",map);
	}
	@Override
	public int scheduleLocalCount(String memberid, String plannerTitle,
			String local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("plannerName", plannerTitle);
		map.put("local", local);
		return session.selectOne("scheduleLocalCount", map);
	}
	
}