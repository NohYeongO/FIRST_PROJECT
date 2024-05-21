package com.kh.semi.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Answer {
	
	private int replyNo;
	private int qnaNo;
	private String replyComment;
	private String nickName;
	private int replyWriter;
	private Date commentDate;
	private String status;
	
}
