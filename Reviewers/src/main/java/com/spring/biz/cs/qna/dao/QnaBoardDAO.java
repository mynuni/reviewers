package com.spring.biz.cs.qna.dao;

import java.util.List;

import com.spring.biz.cs.vo.QnaBoardVO;
import com.spring.biz.util.SearchCriteria;

public interface QnaBoardDAO {

	public int getBoardCount();

	public int getMyBoardCount(SearchCriteria criteria, String userId);

	public List<QnaBoardVO> getBoardList(SearchCriteria criteria);

	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId);

	public void writeQnaBoard(QnaBoardVO qnaBoardVO);
	
}
