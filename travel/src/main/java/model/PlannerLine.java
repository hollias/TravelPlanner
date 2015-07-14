package model;

import java.util.Date;

public class PlannerLine {
	private int plannerid;
	private String plannername;
	private String memberid;
	private int lineid;
	private Date regdate;			
	private int ongoing;		
	private int lineorder;
	//line 연결용
	private String startpoint;
	private String endpoint;
	private int readcount;

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
	public int getLineid() {
		return lineid;
	}
	public void setLineid(int lineid) {
		this.lineid = lineid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getOngoing() {
		return ongoing;
	}
	public void setOngoing(int ongoing) {
		this.ongoing = ongoing;
	}
	public int getLineorder() {
		return lineorder;
	}
	public void setLineorder(int lineorder) {
		this.lineorder = lineorder;
	}
	public String getStartpoint() {
		return startpoint;
	}
	public void setStartpoint(String startpoint) {
		this.startpoint = startpoint;
	}
	public String getEndpoint() {
		return endpoint;
	}
	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
