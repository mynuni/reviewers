package com.spring.biz.cs.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.cs.qna.domain.QnaBoardVO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {
	
	private static String namespace = "qnaBoardMapper";

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(QnaBoardVO qnaBoardVO) throws Exception {
		sqlSession.insert(namespace + ".write", qnaBoardVO);
		
	}
	
	@Override
	public List<QnaBoardVO> list() throws Exception {
		return sqlSession.selectList(namespace + ".list");

	}
	
	@Override
	public QnaBoardVO read(int bno) throws Exception {
		return sqlSession.selectOne(namespace + ".read", bno);
	}
	
	@Override
	public void update(QnaBoardVO qnaBoardVO) throws Exception {
		sqlSession.update(namespace + ".update", qnaBoardVO);
	}
	
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete(namespace + ".delete", bno);
	}
}
