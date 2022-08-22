package com.study.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.login.vo.UserVO;
import com.study.member.dao.MemberDao;
import com.study.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements ILoginService {
	
	@Inject
	MemberDao memberDao;
	
	@Override
	public UserVO getUser(String userId) {
		MemberVO member = memberDao.getMember(userId);
		if(member == null) {
			return null;
		}
		UserVO user = new UserVO();
		user.setUserId(member.getMemId());
		user.setUserPass(member.getMemPw()); 
		user.setUserName(member.getMemName());  
		
		return user;
	}
	
}
