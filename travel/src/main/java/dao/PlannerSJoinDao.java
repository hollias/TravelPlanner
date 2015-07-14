package dao;

import java.util.List;
import model.PlannerSJoin;

public interface PlannerSJoinDao {
	List<PlannerSJoin> diary(String memberid);
	List<PlannerSJoin> diarycheck(String plannername);
}
