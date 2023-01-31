package com.spring.biz.board;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import oracle.sql.DATE;

public class MovieBoardVO {

	private int bseq;
	private Integer boardnum=null;
	private String title;
	private String nickname;
	private String content;
	private String filename;
	private DATE writedate;
	private int like_num;
	private int unlike_num;
	private int cnt;
	private String userId;
	private MultipartFile uploadFile;
	
	private int pageNum;
	private int amount;
	private String searchCondition;
	private String searchKeyword;

	
	
	public MovieBoardVO() {
		this.pageNum = 1;
		this.amount = 15;
		this.searchCondition = "TITLE";
		this.searchKeyword = "";
	}
	
	
	
	
	public int getBseq() {
		return bseq;
	}




	public void setBseq(int bseq) {
		this.bseq = bseq;
	}




	public Integer getBoardnum() {
		return boardnum;
	}




	public void setBoardnum(Integer boardnum) {
		this.boardnum = boardnum;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public String getContent() {
		return content;
	}




	public void setContent(String content) {
		this.content = content;
	}




	public String getFilename() {
		return filename;
	}




	public void setFilename(String filename) {
		this.filename = filename;
	}




	public DATE getWritedate() {
		return writedate;
	}




	public void setWritedate(DATE writedate) {
		this.writedate = writedate;
	}




	public int getLike_num() {
		return like_num;
	}




	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}




	public int getUnlike_num() {
		return unlike_num;
	}




	public void setUnlike_num(int unlike_num) {
		this.unlike_num = unlike_num;
	}




	public int getCnt() {
		return cnt;
	}




	public void setCnt(int cnt) {
		this.cnt = cnt;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public MultipartFile getUploadFile() {
		return uploadFile;
	}




	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}




	public int getPageNum() {
		return pageNum;
	}




	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}




	public int getAmount() {
		return amount;
	}




	public void setAmount(int amount) {
		this.amount = amount;
	}




	public String getSearchCondition() {
		return searchCondition;
	}




	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}




	public String getSearchKeyword() {
		return searchKeyword;
	}




	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}




	public String makeQuery() {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("searchCondition", this.searchCondition)
				.queryParam("searchKeyword", this.searchKeyword)
				.build();
		
		return uriComponents.toUriString();
	}
	
	
	
	
}