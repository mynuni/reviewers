package com.spring.biz.reportComment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.reportComment.reportCommentService;
import com.spring.biz.reportComment.reportCommentVO;
import com.spring.biz.util.SearchCriteria;

@Service("reportCommentService")
public class reportCommentImpl implements reportCommentService{
	@Autowired
	private reportCommentDAO reportcommentDAO;
	
	@Override
	public void intsertRePortComment(reportCommentVO vo) {
		reportcommentDAO.inserReportCommetn(vo);
		
	}

	@Override
	public List<reportCommentVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reportcommentDAO.getBoardListPaging(cri);
	}

	@Override
	public int getTotalPages(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return reportcommentDAO.getTotalComment(cri);
	}

	@Override
	public List<reportCommentVO> getReportCommentDetail(reportCommentVO vo) {
		// TODO Auto-generated method stub
		return reportcommentDAO.getReportCommentDetai(vo);
	}

	@Override
	public int getValid(reportCommentVO vo) {
		// TODO Auto-generated method stub
		return reportcommentDAO.getValid(vo);
	}

}
