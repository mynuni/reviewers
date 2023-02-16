package com.spring.biz.member.service;

import com.spring.biz.member.vo.MemberVO;

public interface MemberService {
	
	public void signUp(MemberVO memberVO);
	
	public boolean isNameDuplicate(String userName);
	
	public MemberVO login(MemberVO memberVO);
	
	public void memberEdit(MemberVO memberVO);
	
	public void withdraw(MemberVO memberVO);
	
	public MemberVO findMemberById(String userId);
	
	public void memberImgUpload(String userId, String userImg);
	
}
