package com.study.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.reply.dao.IReplyDao;
import com.study.reply.vo.ReplyPagingVO;
import com.study.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements IReplyService{
	
	@Inject
	IReplyDao replyDao;

	@Override
	public List<ReplyVO> getReplyListByParent(ReplyPagingVO pagingVO) {
		int totalRowCount = replyDao.getReplyCountByParent(pagingVO);
		pagingVO.setTotalRowCount(totalRowCount);
		pagingVO.pageSetting();
		
		return replyDao.getReplyListByParent(pagingVO);
		
	}

	@Override
	public void registReply(ReplyVO reply) {
		replyDao.insertReply(reply);
	}

	@Override
	public void modifyReply(ReplyVO reply) {
		replyDao.updateReply(reply);
	}

	@Override
	public void removeReply(ReplyVO reply) {
		replyDao.deleteReply(reply);
	}

}
