package dao;

import model.Line;

public interface LineDao {
	public int insertLine(Line line);
	public int updateLine(String startpoint,String endpoint);
	public Boolean confirmLine(String startpoint,String endpoint);
	public int selectLineId(String startpoint,String endpoint);
	
}

