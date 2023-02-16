package com.spring.biz.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.biz.member.dao.MemberDAO;
import com.spring.biz.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDAO memberDAO;
	private final BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MemberServiceImpl(MemberDAO memberDAO, BCryptPasswordEncoder passwordEncoder) {
		this.memberDAO = memberDAO;
		this.passwordEncoder = passwordEncoder;
	}

	// 회원가입
	@Override
	public void signUp(MemberVO memberVO) {
		String encryptedPw = passwordEncoder.encode(memberVO.getUserPw());
		memberVO.setUserPw(encryptedPw);
		memberDAO.signUp(memberVO);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO memberVO) {
		MemberVO loginMember = memberDAO.findMemberById(memberVO.getUserId());
		if (loginMember == null) {
			throw new RuntimeException("아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		if (passwordEncoder.matches(memberVO.getUserPw(), loginMember.getUserPw())) {
			return loginMember;
		} else {
			throw new RuntimeException("아이디 또는 비밀번호가 일치하지 않습니다.");
		}

	}
	
	// 중복 검사
	@Override
	public boolean isNameDuplicate(String userName) {
		return memberDAO.checkNameDuplicate(userName) == 0;

	}

	// 회원 정보 수정
	@Override
	public void memberEdit(MemberVO memberVO) {
		// 비밀번호를 변경하지 않을 경우 현재 비밀번호 유지
		if (memberVO.getUserPw() == null || memberVO.getUserPw() == "") {
			MemberVO memberInfo = memberDAO.findMemberById(memberVO.getUserId());
			memberVO.setUserPw(memberInfo.getUserPw());
		} else {
			String encodedPw = passwordEncoder.encode(memberVO.getUserPw());
			memberVO.setUserPw(encodedPw);
		}
		memberDAO.memberEdit(memberVO);
	}

	// find member by id
	@Override
	public MemberVO findMemberById(String userId) {
		return memberDAO.findMemberById(userId);
	}

	@Override
	public void withdraw(MemberVO memberVO) {
		memberDAO.withdraw(memberVO);
	}

	@Override
	public void memberImgUpload(String userId, String userImg) {
		System.out.println("service - memberImgUpload()");
		memberDAO.memberImgUpload(userId, userImg);
	}
}
