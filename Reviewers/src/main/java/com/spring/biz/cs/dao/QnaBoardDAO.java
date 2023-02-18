package com.spring.biz.cs.dao;

import java.util.List;

import com.spring.biz.cs.vo.QnaBoardVO;

public interface QnaBoardDAO {

	// 게시글 목록 조회
	List<QnaBoardVO> getQnaBoardList(String searchType, String keyword);

	// 게시글 목록 전체 수
	int getQnaBoardCount(String searchType, String keyword);

	// 조회수
	void updateQnaBoardViewCnt(int boardId);

	// 게시글 등록
	void insertQnaBoard(QnaBoardVO qnaBoardVO);

	// 게시글 수정
	void updateQnaBoard(QnaBoardVO qnaBoardVO);

	// 게시글 삭제
	void deleteQnaBoard(int boardId);

	// 게시글 조회
	QnaBoardVO getQnaBoard(int boardId);

	// 파일 경로
	String getFilePath(int boardId);

}
