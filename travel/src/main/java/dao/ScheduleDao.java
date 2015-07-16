package dao;

import java.util.List;

import model.Schedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


public interface ScheduleDao {
	public int scheduleCount(String memberid, String plannerTitle);
	public int insertSchedule(Schedule schedule);
	public List<Schedule> getTotalSchedule();
	public void deleteSchedule(int inx);
}
