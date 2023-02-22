package com.spring.biz.cs.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QnaBoardVO {

	private int tableId;
	private int boardId;
	private String subject;
	private String title;
	private String content;
	private String writer;
	private String writerId;
	private Date writeDate;
	private boolean isDeleted;
	private boolean isAnswered;
	private List<String> filePaths;

	public void addFilePath(String filePath) {
		if (filePaths == null) {
			filePaths = new ArrayList<>();
		}
		filePaths.add(filePath);
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public boolean isAnswered() {
		return isAnswered;
	}
	
	public boolean getIsAnswered() {
		return isAnswered;
	}
	

	public void setAnswered(boolean isAnswered) {
		this.isAnswered = isAnswered;
	}

	public List<String> getFilePaths() {
		return filePaths;
	}

	public void setFilePaths(List<String> filePaths) {
		this.filePaths = filePaths;
	}
	

}
