package com.study.like.service;

import java.util.List;

import javax.inject.Inject;
import com.study.like.dao.ILikeDao;
import org.springframework.stereotype.Service;
import com.study.funding.vo.FundingVO;
import com.study.like.vo.LikeVO;

@Service
public class LikeServiceImpl implements ILikeService {
	
	@Inject
	ILikeDao likeDao;


	@Override
	public List<FundingVO> getLikeList(String memId) {
		return likeDao.getLikeList(memId);
	}

	@Override
	public int checkLike(LikeVO like) {
		return likeDao.checkLike(like);
	}
	
	@Override
	public void insertLike(LikeVO like) {
		int cnt = likeDao.insertLike(like);		
	}

	@Override
	public void deleteLike(LikeVO like) {
		int cnt = likeDao.deleteLike(like);
		
	}

}
