package com.spring.biz.cs.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.util.SearchCriteria;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {

	private final FaqBoardDAO faqBoardDAO;

	@Autowired
	public FaqBoardServiceImpl(FaqBoardDAO faqBoardDAO) {
		this.faqBoardDAO = faqBoardDAO;
	}

	@Override
	public int countFaqBoardList(SearchCriteria criteria) {
		return faqBoardDAO.countFaqBoardList(criteria);

	}

	@Override
	public List<FaqBoardVO> getFaqBoardList(SearchCriteria criteria) {
		return faqBoardDAO.getFaqBoardList(criteria);
	}
}
