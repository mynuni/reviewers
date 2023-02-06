package com.spring.biz.cs.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.cs.faq.dao.FaqBoardDAO;
import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.Criteria;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {

	private final FaqBoardDAO faqBoardDAO;

	@Autowired
	public FaqBoardServiceImpl(FaqBoardDAO faqBoardDAO) {
		this.faqBoardDAO = faqBoardDAO;
	}

	@Override
	public List<FaqBoardVO> list(Criteria cri) throws Exception {
		return faqBoardDAO.list(cri);
	}

	@Override
	public int listCount() throws Exception {
		return faqBoardDAO.listCount();
	}

	@Override
	public void write(FaqBoardVO FaqBoardVO) throws Exception {
		faqBoardDAO.write(FaqBoardVO);

	}

	@Override
	public FaqBoardVO read(int bno) throws Exception {
		return faqBoardDAO.read(bno);
	}

	@Override
	public void update(FaqBoardVO FaqBoardVO) throws Exception {
		faqBoardDAO.update(FaqBoardVO);

	}

	@Override
	public void delete(int bno) throws Exception {
		faqBoardDAO.delete(bno);

	}

}
