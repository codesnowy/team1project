package com.study.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IBoardDao {
	
	public int getTotalRowCount(BoardSerchVO searchVO);
	public List<BoardVO> getBoardList(BoardSerchVO searchVO);
	public BoardVO getBoard(int boNo);  
	public List<BoardVO> getmyBoard(String boMemId);  
	public int addHit(int boNo); 
	public int updateBoard(BoardVO board);
	public int deleteBoard(int boNo);
	public int insertBoard(BoardVO board);	

}
