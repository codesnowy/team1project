package com.study.login.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.study.login.service.ILoginService;
import com.study.login.vo.UserVO;
import com.study.member.service.IMemberService;

@Controller
public class LoginController {
	
	@Inject
	ILoginService loginService;
	
	@Inject
	IMemberService memberService;
	
	@RequestMapping("/login/login.wow")
	public String login(HttpServletRequest req, HttpSession session) {	
		String msg = req.getParameter("message");
		if(msg == null) {
			session.setAttribute("PREPAGE", req.getHeader("referer"));
			return "/login/login";
		}else { //한 번 틀린 다음 로그인 시도시
			return "/login/login";
		}
	}
	
	@RequestMapping("/login/login_check.wow")
	public ModelAndView login_check(HttpServletRequest req, HttpSession session, ModelAndView mav) throws Exception {
 
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPass");		

		if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
			mav.setViewName("redirect:/login/login.wow");
			mav.addObject("message", "idorpwempty");
			return mav;
		} else {
			UserVO user = loginService.getUser(id);
			if (user == null) { //아이디 틀렸을 때
				mav.setViewName("redirect:/login/login.wow");
				mav.addObject("message", "idorpwnotcorrect");
				return mav;
			} else //로그인 되었을 때
				if (user.getUserPass().equals(pw)) { 
					session.setAttribute("USER_INFO", user);
					String referer = (String) session.getAttribute("PREPAGE");
					if(referer!=null) {
						mav.setViewName("redirect:"+referer);
						return mav;
					}
					mav.setViewName("redirect:/funding/fundingList.wow");
					return mav;				
				} else { // 비번 틀렸을 때
					mav.setViewName("redirect:/login/login.wow");
					mav.addObject("message", "idorpwnotcorrect");
					return mav;
				}
			}
		
		}
	
	@RequestMapping("/login/logout.wow")
	public String logout(HttpSession session) {
			session.removeAttribute("USER_INFO");
			return "redirect:"+"/";  
	}
	

}