package com.spring.biz.cs.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.biz.cs.vo.QnaBoardVO;
import com.spring.biz.util.SearchCriteria;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	private final SqlSession sqlSession;
	private final String NAMESPACE = "QnaBoardMapper";

	public QnaBoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(NAMESPACE + ".getBoardCount");
	}

	@Override
	public int getMyBoardCount(SearchCriteria criteria, String userId) {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("searchType", criteria.getSearchType());
	    paramMap.put("keyword", criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".getMyBoardCount", paramMap);
	}

	@Override
	public List<QnaBoardVO> getBoardList(SearchCriteria criteria) {
		return sqlSession.selectList(NAMESPACE + ".getBoardList", criteria);
	}

	@Override
	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId) {

		if (criteria.getSearchType() == null) {
			criteria.setSearchType("");
		}

		if (criteria.getKeyword() == null) {
			criteria.setKeyword("");
		}
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("criteria", criteria);
		paramMap.put("userId", userId);
		paramMap.put("searchType", criteria.getSearchType());
		paramMap.put("keyword", criteria.getKeyword());

		return sqlSession.selectList(NAMESPACE + ".getMyBoardList", paramMap);
	}
	
	@Override
	public void writeQnaBoard(QnaBoardVO qnaBoardVO) {
		sqlSession.insert(NAMESPACE + ".writeQnaBoard", qnaBoardVO);
	}

}
