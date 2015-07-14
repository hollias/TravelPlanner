package service;

import java.util.List;

import model.Area;
import model.Hot;
import model.HotArea;
import model.MapJoin;
import model.Member;
import model.Planner;
import model.PlannerSJoin;
import model.PlannerS;
import model.ScheduleHot;

public interface RailnoService {
	//ScheduleHot
	ScheduleHot stay(String memberid, String plannername);
	ScheduleHot restaurant(String memberid, String plannername);
	ScheduleHot tourist(String memberid, String plannername);
	ScheduleHot total(String memberid, String plannername);
	List<ScheduleHot> schot(String memberid, String plannername);
	
	//planner
	Planner plannerOne(String memberid);
	List<Planner> list(String memberid);
	Planner plannerName(String memberid, String plannername);
	
	//Member
	public Member getMemberBymIdAndPassword(Member mem);	
	public Member getMember(String memberid);
	public String getMid(String memberid);
	public int createMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String memberid);	
	public int getTotalRecordMember();
	public Member idFind(Member member); //아이디 찻기 7월14일
	public Member pwFind(Member member); //비밀번호 찻기 7월 14일
	
	//PlannerSJoin
	List<PlannerSJoin> diary(String memberid);
	List<PlannerSJoin> diarycheck(String plannername);
	
	//PlannerS
	List<PlannerS> calendar(String plannerid);
	
	//Hot
	Hot hotone(String local, String hotname);
	List<Hot> hotrest(String local);
	List<Hot> hottourist(String local);
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
	public int hotHitUp(String hotid); // hot 아이템 리드카운터
	
	//HotArea
	List<HotArea> hotarealist(String local);
	public List<MapJoin> mapjoin(String memberid, String plannername);
	
	//Area
	Area areaOne(String local);
	List<Area> areaname(Area area);
}
