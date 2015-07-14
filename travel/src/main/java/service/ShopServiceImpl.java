package service;
import java.util.List;

import model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;

@Service
public class ShopServiceImpl implements ShopService{	
	@Autowired
	private MemberDao memberDao;
	//MemberImpl
	public Member getMemberBymIdAndPassword(Member mem) {
		return this.memberDao.getMemberBymIdAndPassword(mem);
	}
	public int createMember(Member member) {
		return this.memberDao.createMember(member);
	}
	public int updateMember(Member member) {
		return this.memberDao.updateMember(member);
	}
	public int deleteMember(String memberid) {
		return this.memberDao.deleteMember(memberid);
	}
	public String getMid(String memberid) {
		return this.memberDao.getMid(memberid);
	}
	public int getTotalRecordMember() {
		return this.memberDao.getTotalRecordMember();
	}
	public Member getMember(String memberid) {
		return this.memberDao.getMember(memberid);
	}
	public List<Member> getMemberList(int start) {
		return this.memberDao.getMemberList(start);
	}
}