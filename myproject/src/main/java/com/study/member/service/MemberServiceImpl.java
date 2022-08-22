package com.study.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.study.member.dao.MemberDao;
import com.study.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	MemberDao memberDao;
	
	@Override
	public List<MemberVO> getMemberList() {
		return memberDao.getMemberList();
	}
	
	@Override
	public MemberVO getMember(String memId) {
	MemberVO member = memberDao.getMember(memId);
		return member;
	}
	
	@Override
	public void registMember(MemberVO member) {
		int cnt = memberDao.insertMember(member);		
	}
	
	@Override
	public void modifyMember(MemberVO member) {
		int cnt = memberDao.updateMember(member);		
	}
	
	@Override
	public void removeMember(MemberVO member) {
		int cnt = memberDao.deleteMember(member);	
	}
	
}
