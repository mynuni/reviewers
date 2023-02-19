package com.spring.biz.util;

public class Criteria {
	private int page; // 현재 페이지 번호
	private int perPageNum; // 페이지 당 보여줄 게시글의 수
	private int startRow; // 해당 페이지의 시작 행 번호
	private int endRow; // 해당 페이지의 마지막 행 번호

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getEndRow() {
		return endRow;
	}

	// startRow, endRow 값을 계산하고 설정하는 메소드
	public void calculateRowNum() {
		this.startRow = (this.page - 1) * perPageNum + 1;
		this.endRow = this.startRow + perPageNum - 1;
	}
}
