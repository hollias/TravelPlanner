package dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Member;
@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession session;	
	
	public Member getMemberBymIdAndPassword(Member mem) {
		Member member = session.selectOne("selectMemberBymIdandPassword" , mem );
		return member;
	}
	public int createMember(Member member) {
		return session.insert("createMember", member);
	}
	public int updateMember(Member member) {
		return session.update("updateMember", member);
	}
	public int deleteMember(String memberid) {
		return session.delete("deleteMember", memberid);
	}
	public int getTotalRecordMember() {
		return session.selectOne("getTotalMember");
	}
	public Member getMember(String memberid) {
		return session.selectOne("selectMember", memberid);
	}
	public String getMid(String memberid) {
		return session.selectOne("selectmId", memberid);
	}
	public List<Member> getMemberList(int start) {
		return session.selectList("memberList",start);
	}
	//아이디 찻기 7월 14일
	public Member idFind(Member member) {
		return session.selectOne("idFind", member);
	}
	//비밀번호 찻기 7월 14일
	public Member pwFind(Member member) {
		return session.selectOne("pwFind", member);
	}
}