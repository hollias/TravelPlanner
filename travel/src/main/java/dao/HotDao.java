package dao;

import java.util.List;

import model.Hot;

public interface HotDao {
	Hot hotone(String local, String hotname);
	List<Hot> hotrest(String local);
	List<Hot>hottourist(String local);
	List<Hot> hotstay(String local);
	Hot hotajax(String hotid);
	List<Hot> hotimage(String local);
	public int inserthot(Hot hot);
	public int updatehot(Hot hot);
	public int deletehot(String hotid);
	List<Hot> hotlist(Hot hot);
	List<Hot> htrest(Hot hot);
	List<Hot> httourist(Hot hot);
	List<Hot> htstay(Hot hot);
	Hot hotajax2(String hotname, String x);
	public List<Hot> getHot(String local);
	public int findHotId(Hot hot);
	public int hotHitUp(String hotid); // hot 아이템 리드카운터
}
