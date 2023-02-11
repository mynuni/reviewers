package com.spring.biz.cs.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.SearchCriteria;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {

	private static String namespace = "faqBoardMapper.";
	private final SqlSession sqlSession;

	@Autowired
	public FaqBoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insertBoard(FaqBoardVO vo) {
		sqlSession.insert(namespace + "insertBoard", vo);
	}

	public void updateBoard(FaqBoardVO vo) {
		sqlSession.update(namespace + "updateBoard", vo);
	}

	public void deleteBoard(FaqBoardVO vo) {
		sqlSession.delete(namespace + "deleteBoard", vo);
	}

	public FaqBoardVO getBoard(FaqBoardVO vo) {
		return (FaqBoardVO) sqlSession.selectOne(namespace + "getBoard", vo);
	}

	public List<FaqBoardVO> getBoardList(FaqBoardVO vo) {
		return sqlSession.selectList(namespace + "getBoardList", vo);
	}

	public int getTotalPages(SearchCriteria cri) {
		return sqlSession.selectOne(namespace + "getTotalPages", cri);
	}

	public List<FaqBoardVO> getBoardListWithPaging(SearchCriteria cri) {
		return sqlSession.selectList(namespace + "getBoardListWithPaging", cri);
	}

	public List<FaqBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		return sqlSession.selectList(namespace + "getBoardListWithDynamicPaging", cri);
	}
}
