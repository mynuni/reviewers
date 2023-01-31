package com.spring.biz.reportComment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.spring.biz.reportComment.reportCommentVO;
import com.spring.biz.util.SearchCriteria;

@Repository
public class reportCommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void inserReportCommetn(reportCommentVO vo) {
		mybatis.insert("reportCommentDAO.insertReport", vo);
	}
	public List<reportCommentVO> getBoardListPaging(SearchCriteria cri){
		return mybatis.selectList("reportCommentDAO.getBoardListWithDynamicPaging",cri);
	}
	public int getTotalComment(SearchCriteria cri) {
		return mybatis.selectOne("reportCommentDAO.getTotalPages",cri);
	}
	public List<reportCommentVO> getReportCommentDetai(reportCommentVO vo){
		return mybatis.selectList("reportCommentDAO.getReportCommentDetail",vo);
	}
	public int getValid(reportCommentVO vo) {
		return mybatis.selectOne("reportCommentDAO.getInvalid",vo);
	}
}
