package com.spring.biz.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	private final SqlSession sqlSession;
	private final String NAMESPACE = "member";
	
	@Autowired
	public MemberDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void signUp(MemberVO memberVO) {
		sqlSession.insert(NAMESPACE + ".signUp", memberVO);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne(NAMESPACE + ".login", memberVO);
		
	}
	
	@Override
	public MemberVO findMemberById(String userId) {
		return sqlSession.selectOne(NAMESPACE + ".findMemberById", userId);
	}
	
	@Override
	public void memberEdit(MemberVO memberVO) {
		sqlSession.update(NAMESPACE + ".memberEdit", memberVO);
		
	}
	
	@Override
	public void withdraw(MemberVO memberVO) {
		sqlSession.delete(NAMESPACE + ".withdraw", memberVO.getUserId());
		
	}
	
}
