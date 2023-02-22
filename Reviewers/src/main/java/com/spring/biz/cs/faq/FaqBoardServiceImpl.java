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
	
	// 목록 조회
	@Override
	public List<FaqBoardVO> getFaqBoardList(SearchCriteria criteria) {
		return faqBoardDAO.getFaqBoardList(criteria);
	}

	// 목록 개수 조회
	@Override
	public int countFaqBoardList(SearchCriteria criteria) {
		return faqBoardDAO.countFaqBoardList(criteria);

	}
	
	//글 조회
	@Override
	public FaqBoardVO getFaqBoardById(int boardId) {
		return faqBoardDAO.getFaqBoardById(boardId);
	}
	
	// 글 작성
	@Override
	public void writeFaqBoard(FaqBoardVO faqBoardVO) {
		faqBoardDAO.writeFaqBoard(faqBoardVO);

	}

	// 글 수정
	@Override
	public void updateFaqBoard(FaqBoardVO faqBoardVO) {
		faqBoardDAO.updateFaqBoard(faqBoardVO);

	}

	// 글 삭제
	@Override
	public void deleteFaqBoardById(int boardId) {
		faqBoardDAO.deleteFaqBoardById(boardId);

	}
}
