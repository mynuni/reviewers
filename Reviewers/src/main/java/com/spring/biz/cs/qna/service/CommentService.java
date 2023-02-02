package com.spring.biz.cs.qna.service;

import java.util.List;

import com.spring.biz.cs.qna.domain.CommentVO;

public interface CommentService {
	
	public List<CommentVO> readComment(int b_no) throws Exception;

}
