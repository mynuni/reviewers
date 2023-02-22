package com.spring.biz.cs.faq;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FaqBoardVO {

	private int tableId;
	private int boardId;
	private String subject;
	private String title;
	private String content;
	private String writer;
	private String writerId;
	private Date writeDate;
	private boolean isDeleted;
	
}
