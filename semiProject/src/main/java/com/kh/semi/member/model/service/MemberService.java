package com.kh.semi.member.model.service;

import com.kh.semi.member.model.vo.Member;

public interface MemberService {
	
	 Member login(Member member);
	 
	 int insertMember(Member member);
	 
}
