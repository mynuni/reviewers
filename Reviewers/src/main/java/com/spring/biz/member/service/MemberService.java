package com.spring.biz.member.service;

import com.spring.biz.vo.MemberVO;

public interface MemberService {
	
	public void signUp(MemberVO memberVO);
	
	public MemberVO login(MemberVO memberVO);
	
	public void memberEdit(MemberVO memberVO);
	
	public void withdraw(MemberVO memberVO);
	
	public MemberVO findMemberById(String userId);
	
}
