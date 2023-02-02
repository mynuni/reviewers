package com.spring.biz.cs.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.cs.qna.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	private static String namespace = "commentMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CommentVO> readComment(int b_no) throws Exception {
		return sqlSession.selectList(namespace + ".readComment", b_no);
	}

}
