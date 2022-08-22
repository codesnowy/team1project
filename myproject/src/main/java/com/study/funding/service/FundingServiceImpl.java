package com.study.funding.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.funding.dao.IFundingDao;
import com.study.funding.vo.FundingSerchVO;
import com.study.funding.vo.FundingVO;

@Service
public class FundingServiceImpl implements IFundingService {
	
	@Inject
	IFundingDao fundingDao;	

	@Override
	public List<FundingVO> getFundingList(FundingSerchVO searchVO) {
		int totalRowCount = fundingDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return fundingDao.getFundingList(searchVO);
	}

	@Override
	public FundingVO getfunding(int fuNo) {
		return fundingDao.getfunding(fuNo);
	}

	@Override
	public void addLike(int fuNo) {
		int cnt = fundingDao.addLike(fuNo);
	}

	@Override
	public void subLike(int fuNo) {
		int cnt = fundingDao.subLike(fuNo);
	}
	

}
