package model;

public class Schedule {
	private int scheduleid;
	private String plannername;
	private String memberid;
	private int hotid;
	private int dday;
	
	public int getScheduleid() {
		return scheduleid;
	}
	public void setScheduleid(int scheduleid) {
		this.scheduleid = scheduleid;
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
	public int getHotid() {
		return hotid;
	}
	public void setHotid(int hotid) {
		this.hotid = hotid;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	
}
