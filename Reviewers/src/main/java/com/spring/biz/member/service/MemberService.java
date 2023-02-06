package com.spring.biz.member.service;

import com.spring.biz.member.vo.MemberVO;

public interface MemberService {

	public void signUp(MemberVO memberVO) throws Exception;

	public MemberVO login(MemberVO memberVO) throws Exception;

	public void memberUpdate(MemberVO memberVO) throws Exception;
	
	public void memberDelete(MemberVO memberVO) throws Exception;
	
}
