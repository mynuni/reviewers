package com.spring.biz.cs.faq;

import java.util.List;

import com.spring.biz.util.SearchCriteria;

public interface FaqBoardService {

	// 목록 조회
	public List<FaqBoardVO> getFaqBoardList(SearchCriteria criteria);
	
	// 목록 개수 조회
	public int countFaqBoardList(SearchCriteria criteria);
	
	// 글 조회
    public FaqBoardVO getFaqBoardById(int boardId);
	
	// 글 작성
	public void writeFaqBoard(FaqBoardVO faqBoardVO);

	// 글 수정
	public void updateFaqBoard(FaqBoardVO faqBoardVO);

	// 글 삭제
	public void deleteFaqBoardById(int boardid);
	
}
