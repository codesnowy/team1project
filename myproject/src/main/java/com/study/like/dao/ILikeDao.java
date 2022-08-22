package com.study.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.funding.vo.FundingVO;
import com.study.like.vo.LikeVO;


@Mapper
public interface ILikeDao {
	
	public int getTotalRowCount();
	public List<FundingVO> getLikeList(String memId);
	public int checkLike(LikeVO like);	
	public int insertLike(LikeVO like);
	public int deleteLike(LikeVO like);
	
}
