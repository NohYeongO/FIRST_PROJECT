package com.kh.semi.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.member.model.dao.MemberRepository;
import com.kh.semi.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member login(Member member) {
		
		return memberRepository.login(sqlSession, member);
		
	}

	@Override
	public int insertMember(Member member) {
		
		return memberRepository.insertMember(sqlSession, member);
	}

}
