package com.spring.biz.reportComment;

import java.util.List;

import com.spring.biz.util.SearchCriteria;



public interface reportCommentService {
	
	void intsertRePortComment(reportCommentVO vo);							//신고하기
	List<reportCommentVO> getBoardListWithDynamicPaging(SearchCriteria cri);//페이징
	int getTotalPages(SearchCriteria cri);									//페이징
	List<reportCommentVO> getReportCommentDetail(reportCommentVO vo);		//상세정보
	int getValid(reportCommentVO vo);										//신고 중복체크
}
