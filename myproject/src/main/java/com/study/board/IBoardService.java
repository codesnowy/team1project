package com.study.board;

import java.util.List;

public interface IBoardService {
	
	public List<BoardVO> getBoardList(BoardSerchVO searchVO);
	public BoardVO getBoard(int boNo); 
	public List<BoardVO> getmyBoard(String boMemId);  
	public void addHit(int boNo); 
	public void updateBoard(BoardVO board);
	public void deleteBoard(int boNo);
	public void insertBoard(BoardVO board);	

}
