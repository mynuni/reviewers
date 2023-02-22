package com.spring.biz.cs.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.cs.dao.QnaBoardDAO;
import com.spring.biz.cs.vo.QnaBoardVO;
import com.spring.biz.cs.vo.QnaFileVO;
import com.spring.biz.util.SearchCriteria;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	private final QnaBoardDAO qnaBoardDAO;

	@Autowired
	public QnaBoardServiceImpl(QnaBoardDAO qnaBoardDAO) {
		this.qnaBoardDAO = qnaBoardDAO;
	}

	@Override
	public int getBoardCount() {
		return qnaBoardDAO.getBoardCount();
	}

	@Override
	public int getMyBoardCount(SearchCriteria criteria, String userId) {
		return qnaBoardDAO.getMyBoardCount(criteria, userId);
	}

	@Override
	public List<QnaBoardVO> getBoardList(SearchCriteria criteria) {
		return qnaBoardDAO.getBoardList(criteria);
	}

	@Override
	public List<QnaBoardVO> getMyBoardList(SearchCriteria criteria, String userId) {
		return qnaBoardDAO.getMyBoardList(criteria, userId);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void writeQnaBoard(QnaBoardVO qnaBoardVO) {
		qnaBoardDAO.writeQnaBoard(qnaBoardVO);
		if (qnaBoardVO.getFilePaths() != null && qnaBoardVO.getFilePaths().size() > 0) {
			for (String filePath : qnaBoardVO.getFilePaths()) {
				QnaFileVO qnaFileVO = new QnaFileVO();
				qnaFileVO.setBoardId(qnaBoardVO.getBoardId());
				qnaFileVO.setFilePath(filePath);
				qnaBoardDAO.writeQnaFile(qnaFileVO);
			}
		}
	}

}