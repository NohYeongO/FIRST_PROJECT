package com.kh.semi.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("loginForm")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("member/memberLoginForm");
		return mv;
	}
	
	@RequestMapping("enrollForm")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		mv.setViewName("member/memberEnrollForm");
		return mv;
	}
	
	@RequestMapping("login")
	public ModelAndView login(Member member, HttpSession session ,ModelAndView mv) {
		
		Member loginUser = memberService.login(member);
		
		
		if(loginUser != null && bcryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			// model.addAttribute
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(ModelAndView mv, HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		mv.setViewName("common/main");
		
		return mv;
	}
	
	
	
	@RequestMapping("insertMember")
	public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encPwd);
		
		int result = memberService.insertMember(member);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "회원가입 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}
