package com.spring.biz.cs.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.Criteria;

@Repository
public class FaqBoardDAOImpl implements FaqBoardDAO {

	private static String namespace = "faqBoardMapper";
	private final SqlSession sqlSession;

	@Autowired
	public FaqBoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FaqBoardVO> list(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".list", cri);
	}

	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne(namespace + ".listCount");
	}

	@Override
	public void write(FaqBoardVO FaqBoardVO) throws Exception {
		sqlSession.insert(namespace + ".write", FaqBoardVO);

	}

	@Override
	public FaqBoardVO read(int bno) throws Exception {
		return sqlSession.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(FaqBoardVO FaqBoardVO) throws Exception {
		sqlSession.update(namespace + ".update", FaqBoardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete(namespace + ".delete", bno);
	}
}
