package com.study.member.service;

import java.util.List;

import com.study.member.vo.MemberVO;

public interface IMemberService {
	
	public List<MemberVO> getMemberList();
	public MemberVO getMember(String memId);
	public void registMember(MemberVO member);
	public void modifyMember(MemberVO member);
	public void removeMember(MemberVO member);

}
