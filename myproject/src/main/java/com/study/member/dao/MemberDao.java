package com.study.member.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.study.member.vo.MemberVO;

@Mapper
public interface MemberDao {
	
	public List<MemberVO> getMemberList();
	public MemberVO getMember(String memId);
	public int insertMember(MemberVO member); 
	public int updateMember(MemberVO member); 
	public int deleteMember(MemberVO member); 

}
