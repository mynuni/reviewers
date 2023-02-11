package com.spring.biz.cs.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.cs.faq.dao.FaqBoardDAO;
import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.SearchCriteria;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {

	private final FaqBoardDAO faqBoardDAO;

	@Autowired
	public FaqBoardServiceImpl(FaqBoardDAO faqBoardDAO) {
		this.faqBoardDAO = faqBoardDAO;
	}

	@Override
	public void insertBoard(FaqBoardVO vo) {
		faqBoardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(FaqBoardVO vo) {
		faqBoardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(FaqBoardVO vo) {
		faqBoardDAO.deleteBoard(vo);
	}

	@Override
	public FaqBoardVO getBoard(FaqBoardVO vo) {
		return faqBoardDAO.getBoard(vo);
	}

	@Override
	public List<FaqBoardVO> getBoardList(FaqBoardVO vo) {
		return faqBoardDAO.getBoardList(vo);
	}

	@Override
	public int getTotalPages(SearchCriteria cri) {
		return faqBoardDAO.getTotalPages(cri);
	}

	@Override
	public List<FaqBoardVO> getBoardListWithPaging(SearchCriteria cri) {
		return faqBoardDAO.getBoardListWithPaging(cri);
	}

	@Override
	public List<FaqBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		return faqBoardDAO.getBoardListWithDynamicPaging(cri);
	}

}
