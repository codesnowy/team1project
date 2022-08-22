package com.study.like.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.swing.Spring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.funding.service.IFundingService;
import com.study.funding.vo.FundingSerchVO;
import com.study.funding.vo.FundingVO;
import com.study.like.service.ILikeService;
import com.study.like.vo.LikeVO;

@Controller
public class LikeController {
	
	@Inject
	ILikeService likeservice;
	
	@Inject
	IFundingService fundingService;
	
	private Logger logger= LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "member/myfunding.wow")
	public String myfunding(Model model, String memId) {
		List<FundingVO> myfundingList = likeservice.getLikeList(memId);
		model.addAttribute("fundingList", myfundingList);	
		return "member/myfunding";	
	}
	
	@RequestMapping(value = "member/myfundingget.wow")
	@ResponseBody
	public Map<String,Object> myfundingget(String memId) {
		System.out.println("");
		Map<String, Object> map = new HashMap<String, Object>();
		List<FundingVO> myfundingList = likeservice.getLikeList(memId);
		map.put("success", true);
		map.put("result", myfundingList);		
		return map;	
	}
	
	@RequestMapping(value = "like/saveLike.wow")
	@ResponseBody
	public int saveLike(Model model, LikeVO like) {
		int likecheck = likeservice.checkLike(like);
		if(likecheck == 0) {
			likeservice.insertLike(like);
			fundingService.addLike(like.getFuNo());
			return 0;		
		}else if(likecheck == 1) {
			likeservice.deleteLike(like);
			fundingService.subLike(like.getFuNo());
			return 1;
		}else {
			return 2;
		}
	}
	
	
}
