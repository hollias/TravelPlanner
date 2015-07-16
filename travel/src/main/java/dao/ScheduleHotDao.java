package dao;

import java.util.List;

import model.Schedule;
import model.ScheduleHot;

public interface ScheduleHotDao {
	ScheduleHot stay(String memberid, String plannername);
	ScheduleHot restaurant(String memberid, String plannername);
	ScheduleHot tourist(String memberid, String plannername);
	ScheduleHot total(String memberid, String plannername);
	List<ScheduleHot> schot(String memberid, String plannername);
	public List<ScheduleHot> getAllSchedule(String memberid, String plannerTitle,String local);
	public List<ScheduleHot> selectDdaySchedule(String dday, String plannerName, String memberid, String local);
	public List<ScheduleHot> getLocalSchedule(String memberid,String plannerTitle, String local);
	public int scheduleLocalCount(String memberid, String plannerTitle,String local);
}
