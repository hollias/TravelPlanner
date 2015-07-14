package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board;
@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSession session;
	
	public Board getBoardItem(Board board) {
		return session.selectOne("getBoardItem", board);
	}
	public List<Board> getBoardList(Board board) {
		return session.selectList("getBoardList", board);
	}
	
	public int insertBoardItem(Board board) {
		return session.insert("insertBoardItem",board);
	}
	
	public int updateBoardItem(Board board) {
		return session.update("updateBoardItem",board);
	}
	
	public int deleteBoardItem(Board board) {
		return session.delete("deleteBoardItem",board);
	}

	public Integer countBoardList(Board board) {
		return session.selectOne("countBoardList", board);
	}

	public Integer hitUpdateBoard(Integer boardid) {
		return session.update("hitUpdateBoard", boardid);
	}
	@Override
	   public void boardList() {
	      for(int i=0;i<100;i++){
	         Board b = new Board();
	         b.setBoardid(1);
	         b.setContent("메롱");
	         b.setMemberid("a");
	         b.setReadcount(0);
	         b.setTitle("title");
	         session.insert("insertBoardItem", b);
	      }
	      return;
	   }
}
