package com.spring.biz.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.dao.MemberDAO;
import com.spring.biz.member.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public void signUp(MemberVO memberVO) throws Exception {
		memberDAO.signUp(memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.login(memberVO);
	}

	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		memberDAO.memberUpdate(memberVO);
	}
	
	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		memberDAO.memberDelete(memberVO);
	}
}
