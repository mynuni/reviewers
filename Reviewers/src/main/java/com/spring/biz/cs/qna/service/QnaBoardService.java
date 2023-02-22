package com.spring.biz.cs.qna.service;

import java.util.List;

import com.spring.biz.cs.vo.QnaBoardVO;
import com.spring.biz.util.SearchCriteria;

public interface QnaBoardService {

	// 글 개수
	public int getBoardCount();

	public int getMyBoardCount(SearchCriteria criteria, String userId);

	// 글 목록
	public List<QnaBoardVO> getBoardList(SearchCriteria criteria);

	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId);

	// 글 작성
	public void writeQnaBoard(QnaBoardVO qnaBoardVO);
	
}
