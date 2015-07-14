package dao;

import java.util.List;

import model.PlannerLine;

public interface PlannerLineDao {
	List<PlannerLine> diary(String memberid);
}
