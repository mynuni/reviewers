package com.spring.biz.reportReview;

import java.util.List;

import com.spring.biz.util.SearchCriteria;

public interface ReportReviewService {
	void insertReportReview(ReportReviewVO vo);			//신고하기
	List<ReportReviewVO> getReportList(ReportReviewVO vo);
	// 글 목록 조회 with paging
	List<ReportReviewVO> getBoardListWithPaging(SearchCriteria cri);

	// 글 목록 조회 with dynamic(search condition) paging
	List<ReportReviewVO> getBoardListWithDynamicPaging(SearchCriteria cri);
	
	int getTotalPages(SearchCriteria cri);
	
	List<ReportReviewVO> getReportReviewDetail(ReportReviewVO vo);
	
	int getValid(ReportReviewVO vo);					//신고 중복체크
}
