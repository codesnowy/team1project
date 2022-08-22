package com.study.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.reply.vo.ReplyPagingVO;
import com.study.reply.vo.ReplyVO;

@Mapper
public interface IReplyDao {
	
	public int getReplyCountByParent(ReplyPagingVO pagingVO);
	public List<ReplyVO> getReplyListByParent(ReplyPagingVO pagingVO);
	
	public ReplyVO getReply(int reNo);
	public int updateReply(ReplyVO reply);
	public int deleteReply(ReplyVO reply);
	public int insertReply(ReplyVO reply);

}
