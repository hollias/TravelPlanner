package service;
import java.util.List;

import model.Member;

public interface ShopService {

	//Member
	public List<Member> getMemberList(int start);
	public Member getMemberBymIdAndPassword(Member mem);	
	public Member getMember(String memberid);
	public String getMid(String memberid);
	public int createMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String memberid);	
	public int getTotalRecordMember();

}