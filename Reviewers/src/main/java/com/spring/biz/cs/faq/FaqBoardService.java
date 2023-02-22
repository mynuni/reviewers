package com.spring.biz.cs.faq;

import java.util.List;

import com.spring.biz.util.SearchCriteria;

public interface FaqBoardService {

	public List<FaqBoardVO> getFaqBoardList(SearchCriteria criteria);
	
	public int countFaqBoardList(SearchCriteria criteria);
	
}