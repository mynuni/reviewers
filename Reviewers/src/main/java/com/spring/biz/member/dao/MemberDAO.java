package com.spring.biz.member.dao;

import com.spring.biz.vo.MemberVO;

public interface MemberDAO {
	
	public void signUp(MemberVO memberVO);
	
	public MemberVO login(MemberVO memberVO);
	
	public MemberVO findMemberById(String userId);

	public void memberEdit(MemberVO memberVO);
	
	public void withdraw(MemberVO memberVO);
	
}
