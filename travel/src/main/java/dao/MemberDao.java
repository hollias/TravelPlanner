package dao;
import java.util.List;

import model.Member;
public interface MemberDao {	
	public Member getMemberBymIdAndPassword(Member mem);
	public Member getMember(String memberid);
	public String getMid(String memberid);
	public int createMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String memberid);
	public int getTotalRecordMember();
	public List<Member> getMemberList(int start);
	public Member idFind(Member member); //아이디 찻기 7월 14일
	public Member pwFind(Member member); //비밀번호 찻기 7월 14일
}
