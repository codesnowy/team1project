package com.study.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements IBoardService {
	
	@Inject
	IBoardDao boardDao;
		
	@Override
	public List<BoardVO> getBoardList(BoardSerchVO searchVO){
		int totalRowCount = boardDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return boardDao.getBoardList(searchVO);
	}
	
	@Override
	public BoardVO getBoard(int boNo) {
		return boardDao.getBoard(boNo);
	}
	
	@Override
	public List<BoardVO> getmyBoard(String boMemId) {
		return boardDao.getmyBoard(boMemId);
	}
	
	@Override
	public void addHit(int boNo) {
		int cnt = boardDao.addHit(boNo);
	}
	
	@Override
	public void updateBoard( BoardVO board) {
		BoardVO vo = boardDao.getBoard(board.getBoNo());
		int cnt = boardDao.updateBoard(board);
	}
	
	@Override
	public void deleteBoard( int boNo) {
		BoardVO vo = boardDao.getBoard(boNo);
		int cnt = boardDao.deleteBoard(boNo);
	}
	
	@Override
	public void insertBoard(BoardVO board) {
		int cnt= boardDao.insertBoard(board);
	}

}
