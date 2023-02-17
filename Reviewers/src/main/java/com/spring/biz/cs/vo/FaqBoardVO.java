package com.spring.biz.cs.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FaqBoardVO {
	
	private int tableId;
	private int boardId;
	private String subject;
	private String title;
	private String content;
	private String writer;
	private Date writeDate;
	private int viewCnt;
	private boolean isDeleted;
	private String filePath;
	
}
