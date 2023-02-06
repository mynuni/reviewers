package com.spring.biz.cs.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.cs.qna.dao.CommentDAO;
import com.spring.biz.cs.qna.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public List<CommentVO> readComment(int b_no) throws Exception {
		return commentDAO.readComment(b_no);
	}

}
