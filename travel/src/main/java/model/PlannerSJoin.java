package model;


public class PlannerSJoin {
	private int plannerid;
	private String plannername;
	private String memberid;
	private int ongoing;
	//planners 조인용
	private String local;
	private String regdate;
	private int lineorder;
	private int day;
	
	public int getPlannerid() {
		return plannerid;
	}
	public void setPlannerid(int plannerid) {
		this.plannerid = plannerid;
	}
	public String getPlannername() {
		return plannername;
	}
	public void setPlannername(String plannername) {
		this.plannername = plannername;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getOngoing() {
		return ongoing;
	}
	public void setOngoing(int ongoing) {
		this.ongoing = ongoing;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getLineorder() {
		return lineorder;
	}
	public void setLineorder(int lineorder) {
		this.lineorder = lineorder;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
}