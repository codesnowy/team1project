package com.study.funding.service;

import java.util.List;

import com.study.funding.vo.FundingSerchVO;
import com.study.funding.vo.FundingVO;

public interface IFundingService {
	public List<FundingVO> getFundingList(FundingSerchVO searchVO);
	public FundingVO getfunding(int fuNo);
	public void addLike(int fuNo);
	public void subLike(int fuNo);
}
