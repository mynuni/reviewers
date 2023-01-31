package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.MovieBoardVO;
//import com.spring.biz.common.LogAdvice;
import com.spring.biz.util.SearchCriteria;



@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private MovieBoardDAO boardDAO;
//	private LogAdvice log;
	
//	public BoardServiceImpl() {
//		log = new LogAdvice();
//	}

	public void insertBoard(MovieBoardVO vo) {
//		log.printLog();
		boardDAO.insertBoard(vo);
	}

	public void updateBoard(MovieBoardVO vo) {
//		log.printLog();
		boardDAO.updateBoard(vo);
	}

	public void deleteBoard(MovieBoardVO vo) {
//		log.printLog();
		boardDAO.deleteBoard(vo);
	}

	public MovieBoardVO getBoard(MovieBoardVO vo) {
//		log.printLog();
		return boardDAO.getBoard(vo);
	}

	public List<MovieBoardVO> getBoardList(MovieBoardVO vo) {
//		log.printLog();
		return boardDAO.getBoardList(vo);
	}
	
	
	

	
	
	
	
	
	@Override
	public int getTotalPages(MovieBoardVO vo) {
		return boardDAO.getTotalPages(vo);
	}

	@Override
	public List<MovieBoardVO> getBoardListWithPaging(SearchCriteria cri) {
		return boardDAO.getBoardListWithPaging(cri);
	}

	@Override
	public List<MovieBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		return boardDAO.getBoardListWithDynamicPaging(cri);
	}

	@Override
	public List<MovieBoardVO> getBoardListMain(SearchCriteria cri) {
		
		return boardDAO.getBoardListMain(cri);
	}

	@Override
	public List<MovieBoardVO> getSearchReview(MovieBoardVO vo) {
	
		return boardDAO.getSearchReview(vo);
	}

	

}
