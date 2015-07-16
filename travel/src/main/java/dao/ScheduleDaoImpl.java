package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int scheduleCount(String memberid, String plannerTitle) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("plannerTitle", plannerTitle);
		
		return session.selectOne("scheduleCount", map);
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return session.insert("insertSchedule", schedule);
	}

	@Override
	public List<Schedule> getTotalSchedule() {
		return session.selectList("getTotalSchedule");
	}

	@Override
	public void deleteSchedule(int inx) {
		session.delete("deleteSchedule",inx);
		
	}

	
	
}
