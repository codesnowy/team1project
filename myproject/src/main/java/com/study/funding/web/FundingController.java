package com.study.funding.web;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.study.funding.service.IFundingService;
import com.study.funding.vo.FundingSerchVO;
import com.study.funding.vo.FundingVO;
import com.study.like.service.ILikeService;
import com.study.like.vo.LikeVO;

@Controller
public class FundingController {
	
	@Inject
	IFundingService fuService;
	
	@Inject
	ILikeService likeService;
	
	private Logger logger= LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = "funding/fundingList.wow")
	public String fundingList(Model model, @ModelAttribute("searchVO") FundingSerchVO serchVO) {
		List<FundingVO> fundingList = fuService.getFundingList(serchVO);
	   List<String> cateList = Arrays.asList("문구·캐릭터·굿즈", "여행·레저","반려동물","예술·디자인","뷰티"
			   			,"클래스·컨설팅","문화·출판","게임·취미","홈·리빙","테크·가전","스포츠·모빌리티","패션·잡화","푸드");
		model.addAttribute("fundingList", fundingList);		
		model.addAttribute("cateList", cateList);
		return "funding/fungdingList";		
	}
	
	@RequestMapping(value = "funding/fundingView.wow")
	public String fundingdView(Model model, LikeVO like) {
		FundingVO funding = fuService.getfunding(like.getFuNo());
		int checklike = likeService.checkLike(like);

		model.addAttribute("funding", funding);
		model.addAttribute("checklike", checklike);
		return "funding/fundingView";
	}

}
