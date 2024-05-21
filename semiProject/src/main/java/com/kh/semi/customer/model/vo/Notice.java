package com.kh.semi.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeWriter;
	private String noticeHold;
	private Date createDate;
	private String status;
	private String imageFile;
	
}
