package com.spring.biz.board;

import java.util.List;

import com.spring.biz.util.SearchCriteria;


public interface BoardService {
	// CRUD 기능의 메소드 구현
	
	// 글 등록
	void insertBoard(MovieBoardVO vo);
	
	// 글 수정
	void updateBoard(MovieBoardVO vo);
		
	// 글 삭제
	void deleteBoard(MovieBoardVO vo);

	// 글 상세 조회
	MovieBoardVO getBoard(MovieBoardVO vo);
	
	// 글 목록 조회
	List<MovieBoardVO> getBoardList(MovieBoardVO vo);
	
	// 메인페이지 인기 리뷰
	List<MovieBoardVO> getBoardListMain(SearchCriteria cri);
	
	// 글 목록 조회
	int getTotalPages(MovieBoardVO vo);

	// 글 목록 조회 with paging
	List<MovieBoardVO> getBoardListWithPaging(SearchCriteria cri);

	// 글 목록 조회 with dynamic(search condition) paging
	List<MovieBoardVO> getBoardListWithDynamicPaging(SearchCriteria cri);
	
	// 리뷰 검색 
	List<MovieBoardVO> getSearchReview(MovieBoardVO vo);
	
}