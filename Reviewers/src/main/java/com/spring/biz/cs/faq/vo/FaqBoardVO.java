package com.spring.biz.cs.faq.vo;

import java.util.Date;

public class FaqBoardVO {

	private int tableId;
	private int boardId;
	private String preface;
	private String title;
	private String content;
	private String is_deleted;
	private Date reg_date;

	public FaqBoardVO() {

	}

	public FaqBoardVO(String preface, String title, String content) {
		this.preface = preface;
		this.title = title;
		this.content = content;
	}

	public int getTableId() {
		return tableId;
	}

	public void setTableId(int tableId) {
		this.tableId = tableId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getPreface() {
		return preface;
	}

	public void setPreface(String preface) {
		this.preface = preface;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
