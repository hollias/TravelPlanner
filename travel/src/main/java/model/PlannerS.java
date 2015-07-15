package model;

import java.util.Date;


public class PlannerS {
	private int plannerid;
	private String local;
	private String regdate;
	private int lineorder;
	private String day;
	private String dd;
	private String mm;
	private Date da;
	
	public Date getDa() {
		return da;
	}
	public void setDa(Date da) {
		this.da = da;
	}
	public int getPlannerid() {
		return plannerid;
	}
	public void setPlannerid(int plannerid) {
		this.plannerid = plannerid;
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	
}
