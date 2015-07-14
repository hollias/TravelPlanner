package model;

public class Line {
	private int lineid;
	private String startpoint;
	private String endpoint;
	private int readcount;
	private int day;
	public int getLineid() {
		return lineid;
	}
	public void setLineid(int lineid) {
		this.lineid = lineid;
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
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
}
