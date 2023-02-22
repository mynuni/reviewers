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

	// 글 개수 조회
	@Override
	public int countFaqBoardList(SearchCriteria criteria) {
		return sqlSession.selectOne(NAMESPACE + ".countFaqBoardList", criteria);

	}

	// 글 목록 조회
	@Override
	public List<FaqBoardVO> getFaqBoardList(SearchCriteria criteria) {
		return sqlSession.selectList(NAMESPACE + ".getFaqBoardList", criteria);

	}

	// 글 조회
	@Override
	public FaqBoardVO getFaqBoardById(int boardId) {
		return sqlSession.selectOne(NAMESPACE + ".getFaqBoardById", boardId);

	}

	// 글 작성
	@Override
	public void writeFaqBoard(FaqBoardVO faqBoardVO) {
		sqlSession.insert(NAMESPACE + ".writeFaqBoard", faqBoardVO);

	}

	// 글 수정
	@Override
	public void updateFaqBoard(FaqBoardVO faqBoardVO) {
		sqlSession.update(NAMESPACE + ".updateFaqBoard", faqBoardVO);

	}

	// 글 삭제
	@Override
	public void deleteFaqBoardById(int boardId) {
		sqlSession.delete(NAMESPACE + ".deleteFaqBoard", boardId);

	}

}
