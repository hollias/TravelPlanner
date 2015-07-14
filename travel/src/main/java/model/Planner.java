package model;

public class Planner {
	private int plannerid;
	private String plannername;
	private String memberid;
	private int ongoing;
	
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
	
}