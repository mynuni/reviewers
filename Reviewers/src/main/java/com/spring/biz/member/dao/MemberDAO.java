package com.spring.biz.member.dao;

import com.spring.biz.member.vo.MemberVO;

public interface MemberDAO {
	
	public void signUp(MemberVO memberVO);
	
	public int checkNameDuplicate(String userName);
	
	public MemberVO login(MemberVO memberVO);
	
	public MemberVO findMemberById(String userId);

	public void memberEdit(MemberVO memberVO);
	
	public void withdraw(MemberVO memberVO);
	
	public void memberImgUpload(String userId, String userImg);
	
}
