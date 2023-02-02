package com.spring.biz.cs.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.cs.qna.dao.QnaBoardDAO;
import com.spring.biz.cs.qna.domain.QnaBoardVO;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private QnaBoardDAO qnaBoardDAO;

	@Override
	public void write(QnaBoardVO qnaBoardVO) throws Exception {
		qnaBoardDAO.write(qnaBoardVO);

	}

	@Override
	public List<QnaBoardVO> list() throws Exception {
		return qnaBoardDAO.list();
	}

	@Override
	public QnaBoardVO read(int bno) throws Exception {
		return qnaBoardDAO.read(bno);
	}

	@Override
	public void update(QnaBoardVO qnaBoardVO) throws Exception {
		qnaBoardDAO.update(qnaBoardVO);

	}

	@Override
	public void delete(int bno) throws Exception {
		qnaBoardDAO.delete(bno);

	}

}
