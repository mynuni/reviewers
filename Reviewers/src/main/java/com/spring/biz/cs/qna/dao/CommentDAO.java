package com.spring.biz.cs.qna.dao;

import java.util.List;

import com.spring.biz.cs.qna.vo.CommentVO;

public interface CommentDAO {

	public List<CommentVO> readComment(int b_no) throws Exception;
	
}
