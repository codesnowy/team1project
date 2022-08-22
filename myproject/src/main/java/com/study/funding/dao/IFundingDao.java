package com.study.funding.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.funding.vo.FundingSerchVO;
import com.study.funding.vo.FundingVO;

@Mapper
public interface IFundingDao {
	public int getTotalRowCount(FundingSerchVO searchVO);
	public List<FundingVO> getFundingList(FundingSerchVO searchVO);
	public FundingVO getfunding(int fuNo);
	public int addLike(int fuNo);
	public int subLike(int fuNo);
}
