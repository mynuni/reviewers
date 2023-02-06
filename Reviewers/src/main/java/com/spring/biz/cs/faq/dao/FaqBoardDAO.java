package com.spring.biz.cs.faq.dao;

import java.util.List;

import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.Criteria;

public interface FaqBoardDAO {

	public List<FaqBoardVO> list(Criteria cri) throws Exception;

	public int listCount() throws Exception;

	public void write(FaqBoardVO faqBoardVO) throws Exception;

	public FaqBoardVO read(int bno) throws Exception;

	public void update(FaqBoardVO faqBoardVO) throws Exception;

	public void delete(int bno) throws Exception;

}