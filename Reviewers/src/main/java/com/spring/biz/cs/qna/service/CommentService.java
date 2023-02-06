package com.spring.biz.cs.qna.service;

import java.util.List;

import com.spring.biz.cs.qna.vo.CommentVO;

public interface CommentService {
	
	public List<CommentVO> readComment(int b_no) throws Exception;

}
