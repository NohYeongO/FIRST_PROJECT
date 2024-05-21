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
public class QNA {

	private int qnaNo;  //QNA게시글번호
	private String qnaTitle; // 제목
	private String qnaContent; // 내용
	private Date createDate; // 작성일
	private String status; // 게시글 상태
	private String qnaStatus; // 답변상태
	private String qnaWriter; // 작성자
	private NoticeFile qnaFile;
}
