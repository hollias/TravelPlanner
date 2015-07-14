package dao;

import java.util.List;

import model.Board;

public interface BoardDao {

	public Board getBoardItem(Board board);

	public List<Board> getBoardList(Board board);

	public int insertBoardItem(Board board);

	public int updateBoardItem(Board board);

	public int deleteBoardItem(Board board);

	public Integer countBoardList(Board board);
	
	public Integer hitUpdateBoard(Integer boardid);
	
	public void boardList();
}
