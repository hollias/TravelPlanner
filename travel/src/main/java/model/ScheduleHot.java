package model;

public class ScheduleHot {
	private int scheduleid;
	private String plannername;
	private String memberid;
	private int hotid;
	private int dday;
	//hot(추천) 이랑 join 용
	private String hotname; 
	private int hotprice;
	private String hotcontent;	
	private String hotimage; 	
	private int hotkind;		
	private double x;				
	private double y;			
	private String local;		
	private int readcount;
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
	public String getHotname() {
		return hotname;
	}
	public void setHotname(String hotname) {
		this.hotname = hotname;
	}
	public int getHotprice() {
		return hotprice;
	}
	public void setHotprice(int hotprice) {
		this.hotprice = hotprice;
	}
	public String getHotcontent() {
		return hotcontent;
	}
	public void setHotcontent(String hotcontent) {
		this.hotcontent = hotcontent;
	}
	public String getHotimage() {
		return hotimage;
	}
	public void setHotimage(String hotimage) {
		this.hotimage = hotimage;
	}
	public int getHotkind() {
		return hotkind;
	}
	public void setHotkind(int hotkind) {
		this.hotkind = hotkind;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	
	
}
