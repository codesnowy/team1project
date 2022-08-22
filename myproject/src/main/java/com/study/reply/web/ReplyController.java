package com.study.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.reply.service.IReplyService;
import com.study.reply.vo.ReplyPagingVO;
import com.study.reply.vo.ReplyVO;

@RestController
public class ReplyController {

	@Inject
	IReplyService service;
	
	@RequestMapping(value = "reply/replyList.wow")
	public Map<String,Object> replyList(ReplyPagingVO searchVO){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReplyVO> replyList = service.getReplyListByParent(searchVO);
		map.put("success", true);
		map.put("result", replyList);		
		return map;
	}
	
	@RequestMapping(value = "reply/replyRegist.wow")
	public Map<String,Object> replyRegist(ReplyVO reply){
		service.registReply(reply);
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("success", true);			
		return map;
	}
	
	@RequestMapping(value = "reply/replyModify.wow")
	public Map<String,Object> replyModify(ReplyVO reply){
		System.out.println(reply);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		map.put("result", "수정성공");
		return map;
	}
	
	@RequestMapping(value = "reply/replyDelete.wow")
	public Map<String,Object> replyDelete(ReplyVO reply) {
		System.out.println(reply);
		service.removeReply(reply);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		map.put("result", "삭제성공");		
		return map;
	}
	
	
}
