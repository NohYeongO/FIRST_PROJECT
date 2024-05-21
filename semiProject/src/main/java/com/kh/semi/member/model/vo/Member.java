package com.kh.semi.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String nickName;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
}
