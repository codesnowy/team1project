package com.study.member.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.study.common.valid.join;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;
import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.MemberVO;

@SessionAttributes("member") 

@Controller
public class MemberController {
	
	@Inject
	IMemberService service;
	
	@ModelAttribute("member")
	public MemberVO member() {
		return new MemberVO();
	}
	
	@RequestMapping("join/join.wow")
	public String memberForm(@ModelAttribute("member") MemberVO member) {		
		return "join/join";
	}
		
	//회원 가입
	@RequestMapping("join/memberRegist.wow")
	public ModelAndView memberRegist(ModelAndView mav
			, @ModelAttribute("member") MemberVO member
			, SessionStatus sessionStatus) {		

		mav.setViewName("redirect:/login/login.wow");
		mav.addObject("message", "joinsucess");
		service.registMember(member);		
		sessionStatus.setComplete();
		return mav;
	}
	
	//중복 확인 
	@RequestMapping(value = "join/getLoginIdDup.wow")
	@ResponseBody
	public String getLoginIdDup(String memId) {	
		MemberVO member = service.getMember(memId);
		String code = null;	
		if(member == null) {
			code = "ok";			
		}
		if(member != null){
			code = "isdupl";
		}
		return code;	
	}
	
	
	// 나의 정보
	@RequestMapping("member/mypage.wow")
	public String mypage(Model model, HttpSession session,HttpServletRequest req) {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		MemberVO member = service.getMember(user.getUserId());
		model.addAttribute("member", member);
		return "/member/mypage";
	}
	
	//회원 수정
	@RequestMapping("member/memberEdit.wow")
	public ModelAndView memberEdit(Model model, @ModelAttribute("member") MemberVO member) {	
		
		ModelAndView mav = new ModelAndView("redirect:/funding/funding.wow");
		service.modifyMember(member);		
		return mav;
	}

}
