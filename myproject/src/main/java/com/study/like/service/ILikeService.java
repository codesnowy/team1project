package com.study.like.service;

import java.util.List;
import com.study.funding.vo.FundingVO;
import com.study.like.vo.LikeVO;

public interface ILikeService {
	
	public List<FundingVO> getLikeList(String memId);
	public int checkLike(LikeVO like);
	public void insertLike(LikeVO like);
	public void deleteLike(LikeVO like);


}
