package model;

public class Hot {
	private int hotid;
	private String hotname; 
	private int hotprice;
	private String hotcontent;	
	private String hotimage; 	
	private int hotkind;		
	private double x;				
	private double y;			
	private String local;	
	private int readcount;
	private String memberid;
	
	
	public String getMemberId() {
		return memberid;
	}
	public void setMemberId(String memberid) {
		this.memberid = memberid;
	}
	public int getHotid() {
		return hotid;
	}
	public void setHotid(int hotid) {
		this.hotid = hotid;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}