package com.kh.semi.common.model.vo;

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
public class PageInfo {
	
	private int listCount;
	private int currentPage;
	private int boardLimit;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
}
