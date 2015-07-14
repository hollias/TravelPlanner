package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Area;
import model.Hot;
import model.HotArea;
import model.MapJoin;
import model.Member;
import model.Planner;
import model.PlannerSJoin;
import model.PlannerS;
import model.ScheduleHot;
import dao.AreaDao;
import dao.HotAreaDao;
import dao.HotDao;
import dao.MemberDao;
import dao.PlannerDao;
import dao.PlannerSAreaDao;
import dao.PlannerSJoinDao;
import dao.PlannerSDao;
import dao.ScheduleHotDao;
@Service
public class RailnoServiceImpl implements RailnoService{
	@Autowired
	private ScheduleHotDao schedulehotDao;
	@Autowired
	private PlannerDao plannerDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PlannerSJoinDao PlannerSJoinDao;
	@Autowired
	private PlannerSDao PlannerSDao;
	@Autowired
	private HotDao hotDao;
	@Autowired
	private HotAreaDao hotareaDao;
	@Autowired
	private AreaDao areaDao;
	@Autowired
	private PlannerSAreaDao psd;
	
	//ScheduleHot
	public ScheduleHot stay(String memberid, String plannername) {
		return schedulehotDao.stay(memberid, plannername);
	}
	public ScheduleHot restaurant(String memberid, String plannername) {
		return schedulehotDao.restaurant(memberid, plannername);
	}
	public ScheduleHot tourist(String memberid, String plannername) {
		return schedulehotDao.tourist(memberid, plannername);
	}
	public ScheduleHot total(String memberid, String plannername) {
		return schedulehotDao.total(memberid, plannername);
	}
	public List<ScheduleHot> schot(String memberid, String plannername) {
		return schedulehotDao.schot(memberid, plannername);
	}
	
	//planner
	public Planner plannerOne(String memberid) {
		return plannerDao.plannerOne(memberid);
	}
	public List<Planner> list(String memberid) {
		return plannerDao.list(memberid);
	}
	public Planner plannerName(String memberid, String plannername) {
		return plannerDao.plannerName(memberid, plannername);
	}
	
	//MemberImpl
	public Member getMemberBymIdAndPassword(Member mem) {
		return this.memberDao.getMemberBymIdAndPassword(mem);
	}
	public int createMember(Member member) {
		return this.memberDao.createMember(member);
	}
	public int updateMember(Member member) {
		return this.memberDao.updateMember(member);
	}
	public int deleteMember(String memberid) {
		return this.memberDao.deleteMember(memberid);
	}
	public String getMid(String memberid) {
		return this.memberDao.getMid(memberid);
	}
	public int getTotalRecordMember() {
		return this.memberDao.getTotalRecordMember();
	}
	public Member getMember(String memberid) {
		return this.memberDao.getMember(memberid);
	}
	//아이디 찻기 7월14일
	public Member idFind(Member member) {
		return this.memberDao.idFind(member);
	}
	//비밀번호 찻기 7월 14일
	public Member pwFind(Member member) {
		return this.memberDao.pwFind(member);
	}
	//PlannerLine
	public List<PlannerSJoin> diary(String memberid) {
		return PlannerSJoinDao.diary(memberid);
	}
	public List<PlannerSJoin> diarycheck(String plannername) {
		return PlannerSJoinDao.diarycheck(plannername);
	}
	//plannerSLine
	public List<PlannerS> calendar(String plannerid) {
		return PlannerSDao.calendar(plannerid);
	}

	//Hot
	public Hot hotone(String local, String hotname) {
		return hotDao.hotone(local, hotname);
	}
	public List<Hot> hotrest(String local) {
		return hotDao.hotrest(local);
	}
	public List<Hot> hottourist(String local) {
		return hotDao.hottourist(local);
	}
	public List<Hot> hotstay(String local) {
		return hotDao.hotstay(local);
	}
	public Hot hotajax(String hotid) {
		return hotDao.hotajax(hotid);
	}
	public List<Hot> hotimage(String local) {
		return hotDao.hotimage(local);
	}
	public int inserthot(Hot hot) {
		return hotDao.inserthot(hot);
	}
	public int updatehot(Hot hot) {
		return hotDao.updatehot(hot);
	}
	public int deletehot(String hotid) {
		return hotDao.deletehot(hotid);
	}
	public List<Hot> hotlist(Hot hot) {
		return hotDao.hotlist(hot);
	}
	public List<Hot> htrest(Hot hot) {
		return hotDao.htrest(hot);
	}
	public List<Hot> httourist(Hot hot) {
		return hotDao.httourist(hot);
	}
	public List<Hot> htstay(Hot hot) {
		return hotDao.htstay(hot);
	}
	public Hot hotajax2(String hotname, String x) {
		return hotDao.hotajax2(hotname, x);
	}
	// hot 아이템 리드카운터
		public int hotHitUp(String hotid){
			return hotDao.hotHitUp(hotid);
		}
		
	//HotArea
	public List<HotArea> hotarealist(String local) {
		return hotareaDao.hotarealist(local);
	}
	public List<MapJoin> mapjoin(String memberid, String plannername) {
		return psd.mapjoin(memberid, plannername);
	}
	
	//Area
	public Area areaOne(String local){
		return areaDao.areaOne(local);
	}
	public List<Area> areaname(Area area) {
		return areaDao.areaname(area);
	}
}