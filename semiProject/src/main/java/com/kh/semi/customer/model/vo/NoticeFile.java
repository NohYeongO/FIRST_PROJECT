package com.kh.semi.customer.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeFile {
	
	private int fileNo;
	private int boardType;
	private int boardNo;
	private String filePath;
	private String originName;
	private String changeName;
	
}
