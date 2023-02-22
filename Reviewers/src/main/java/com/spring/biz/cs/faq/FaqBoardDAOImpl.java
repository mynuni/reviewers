package com.spring.biz.cs.faq;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.util.SearchCriteria;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "FaqBoardMapper";

	@Autowired
	public FaqBoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int countFaqBoardList(SearchCriteria criteria) {
		return sqlSession.selectOne(NAMESPACE + ".countFaqBoardList", criteria);

	}

	@Override
	public List<FaqBoardVO> getFaqBoardList(SearchCriteria criteria) {
		return sqlSession.selectList(NAMESPACE + ".getFaqBoardList", criteria);

	}

}
