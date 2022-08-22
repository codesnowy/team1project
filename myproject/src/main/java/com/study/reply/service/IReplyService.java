package com.study.reply.service;

import java.util.List;

import com.study.reply.vo.ReplyPagingVO;
import com.study.reply.vo.ReplyVO;

public interface IReplyService {
	
	public List<ReplyVO> getReplyListByParent(ReplyPagingVO pagingVO);
	public void registReply(ReplyVO reply);
	public void modifyReply(ReplyVO reply);
	public void removeReply(ReplyVO reply);

}
