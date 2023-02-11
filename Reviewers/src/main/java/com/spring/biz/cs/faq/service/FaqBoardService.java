package com.spring.biz.cs.faq.service;

import java.util.List;

import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.SearchCriteria;

public interface FaqBoardService {

	public void insertBoard(FaqBoardVO vo);
	
	public void updateBoard(FaqBoardVO vo);
		
	public void deleteBoard(FaqBoardVO vo);

	public FaqBoardVO getBoard(FaqBoardVO vo);
	
	public List<FaqBoardVO> getBoardList(FaqBoardVO vo);

	public int getTotalPages(SearchCriteria cri);

	public List<FaqBoardVO> getBoardListWithPaging(SearchCriteria cri);

	public List<FaqBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri);
}
