package com.spring.biz.reportReview.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.reportReview.ReportReviewService;
import com.spring.biz.reportReview.ReportReviewVO;
import com.spring.biz.util.SearchCriteria;

@Service("ReportReviewService")
public class ReportReviewServiceImpl implements ReportReviewService{
	@Autowired
	private ReportReviewDAO reportReviewDAO;
		
	@Override
	public void insertReportReview(ReportReviewVO vo) {
		// TODO Auto-generated method stub
		reportReviewDAO.insertReportReview(vo);
		
	}

	@Override
	public List<ReportReviewVO> getReportList(ReportReviewVO vo) {
		// TODO Auto-generated method stub
		return reportReviewDAO.getReportReviewList(vo);
	}

	@Override
	public List<ReportReviewVO> getBoardListWithPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reportReviewDAO.getBoardListWithPaging(cri);
	}

	@Override
	public List<ReportReviewVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reportReviewDAO.getBoardListWithDynamicPaging(cri);
	}

	@Override
	public int getTotalPages(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reportReviewDAO.getTotalPages(cri);
	}

	@Override
	public List<ReportReviewVO> getReportReviewDetail(ReportReviewVO vo) {
		// TODO Auto-generated method stub
		return reportReviewDAO.getReportReviewDetail(vo);
	}

	@Override
	public int getValid(ReportReviewVO vo) {
		// TODO Auto-generated method stub
		return reportReviewDAO.getValid(vo);
	}

}
