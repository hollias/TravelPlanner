package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import model.Board;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao bd;
	
	public Board getBoardItem(Board board) {
		return bd.getBoardItem(board);
	}

	public List<Board> getBoardList(Board board) {
		return bd.getBoardList(board);
	}

	public int insertBoardItem(Board board) {
		return bd.insertBoardItem(board);
	}

	public int updateBoardItem(Board board) {
		return bd.updateBoardItem(board);
	}

	public int deleteBoardItem(Board board) {
		return bd.deleteBoardItem(board);
	
	}

	public Integer countBoardList(Board board) {
		return bd.countBoardList(board);
	}

	public Integer hitUpdateBoard(Integer boardid) {	
		return bd.hitUpdateBoard(boardid);
	}
}
