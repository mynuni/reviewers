package com.spring.biz.cs.qna.service;

import java.util.List;

import com.spring.biz.cs.qna.domain.QnaBoardVO;
import com.spring.biz.util.Criteria;

public interface QnaBoardService {
	
	public List<QnaBoardVO> list(Criteria cri) throws Exception;
	
	public int listCount() throws Exception;

	public void write(QnaBoardVO qnaBoardVO) throws Exception;
	
	public QnaBoardVO read(int bno) throws Exception;
	
	public void delete(int bno) throws Exception;

	public void update(QnaBoardVO qnaBoardVO) throws Exception;
}
