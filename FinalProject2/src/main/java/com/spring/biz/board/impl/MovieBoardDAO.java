package com.spring.biz.board.impl;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.MovieBoardVO;
import com.spring.biz.util.SearchCriteria;


@Repository
public class MovieBoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	public void insertBoard(MovieBoardVO vo) {
		System.out.println("insertBoard 수행");
		
		mybatis.insert("MovieBoardDAO.insertBoard", vo);
	
	}
	
	public void updateBoard(MovieBoardVO vo) {
		System.out.println("updateBoard 수행");
		
		mybatis.update("MovieBoardDAO.updateBoard",vo);

	}
	public void deleteBoard(MovieBoardVO vo) {
		mybatis.delete("MovieBoardDAO.deleteBoard", vo);
	}
	
	public MovieBoardVO getBoard(MovieBoardVO vo) {
		System.out.println("getBoard 기능 수행");
		
		return (MovieBoardVO) mybatis.selectOne("MovieBoardDAO.getBoard",vo);
		
	}
	
	public List<MovieBoardVO> getBoardList(MovieBoardVO vo){
		System.out.println("getBoardList 수행");
		
		return mybatis.selectList("MovieBoardDAO.getBoardList", vo);
	}
	
	public List<MovieBoardVO> getBoardListMain(SearchCriteria cri){
		System.out.println("getBoardListMain 수행");
		
		return mybatis.selectList("MovieBoardDAO.getBoardListMain", cri);
	}
	
	public int getTotalPages(MovieBoardVO vo) {

		return mybatis.selectOne("MovieBoardDAO.getTotalPages", vo);
	}

	// 글 목록 조회 with paging
	public List<MovieBoardVO> getBoardListWithPaging(SearchCriteria cri) {
		
//		System.out.println("---> MyBatis로 getBoardListWithPaging() 기능 처리");
//		System.out.println("page : " + cri.getPageNum());
//		System.out.println("amount : " + cri.getAmount());
		
		return mybatis.selectList("MovieBoardDAO.getBoardListWithPaging", cri);
	}
	
	// 리뷰 검색
	public List<MovieBoardVO> getSearchReview(MovieBoardVO vo){
	
		return mybatis.selectList("MovieBoardDAO.getSearchReview", vo);
	}
	
	
	// 글 목록 조회 with paging
	public List<MovieBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri) {
		
//		System.out.println("---> MyBatis로 getBoardListWithDynamicPaging() 기능 처리");
		
		return mybatis.selectList("MovieBoardDAO.getBoardListWithDynamicPaging", cri);
	}
}
