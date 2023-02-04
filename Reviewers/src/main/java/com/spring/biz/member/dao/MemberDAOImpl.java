package com.spring.biz.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static String namespace = "memberMapper";

	@Autowired
	SqlSession sqlSession;

	@Override
	public void signUp(MemberVO memberVO) throws Exception {
		sqlSession.insert(namespace + ".signUp", memberVO);

	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne(namespace + ".login", memberVO);
	}
	
	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		sqlSession.update(namespace + ".memberUpdate", memberVO);
		
	}

	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		sqlSession.delete(namespace + ".memberDelete", memberVO);
		
	}
}
