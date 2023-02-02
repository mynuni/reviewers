package com.spring.biz.cs.qna.domain;

import java.util.Date;

public class QnaBoardVO {

	private Integer t_no;
	private Integer b_no;
	private String title;
	private String content;
	private String writer;
	private Integer is_answered;
	private Date reg_date;

	public Integer getT_no() {
		return t_no;
	}

	public void setT_no(Integer t_no) {
		this.t_no = t_no;
	}

	public Integer getB_no() {
		return b_no;
	}

	public void setB_no(Integer b_no) {
		this.b_no = b_no;
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

	public Integer getIs_answered() {
		return is_answered;
	}

	public void setIs_answered(Integer is_answered) {
		this.is_answered = is_answered;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
