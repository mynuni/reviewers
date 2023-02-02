package com.spring.biz.cs.qna.service;

import java.util.List;

import com.spring.biz.cs.qna.domain.QnaBoardVO;

public interface QnaBoardService {

	public void write(QnaBoardVO qnaBoardVO) throws Exception;
	
	public List<QnaBoardVO> list() throws Exception;
	
	public QnaBoardVO read(int bno) throws Exception;
	
	public void delete(int bno) throws Exception;

	public void update(QnaBoardVO qnaBoardVO) throws Exception;
}
