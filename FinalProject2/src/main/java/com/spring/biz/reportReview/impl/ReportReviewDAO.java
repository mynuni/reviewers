package com.spring.biz.reportReview.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.reportComment.reportCommentVO;
import com.spring.biz.reportReview.ReportReviewVO;
import com.spring.biz.util.SearchCriteria;


@Repository
public class ReportReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReportReview(ReportReviewVO vo) {
		mybatis.insert("reportReviewDAO.insertReport",vo);
	}
	public List<ReportReviewVO> getReportReviewList(ReportReviewVO vo){
		return mybatis.selectList("reportReviewDAO.getReportList", vo);
	}
	public int getTotalPages(SearchCriteria cri) {

		return mybatis.selectOne("reportReviewDAO.getTotalPages", cri);
	}

	// 글 목록 조회 with paging
	public List<ReportReviewVO> getBoardListWithPaging(SearchCriteria cri) {

		
		return mybatis.selectList("reportReviewDAO.getBoardListWithPaging", cri);
	}
	
	// 글 목록 조회 with paging
	public List<ReportReviewVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		
		
		return mybatis.selectList("reportReviewDAO.getBoardListWithDynamicPaging", cri);
	}
	
	public List<ReportReviewVO> getReportReviewDetail(ReportReviewVO vo){
		return mybatis.selectList("reportReviewDAO.getReportDetail",vo);
	}
	
	public int getValid(ReportReviewVO vo) {
		return mybatis.selectOne("reportReviewDAO.getInvalid",vo);
	}
}
