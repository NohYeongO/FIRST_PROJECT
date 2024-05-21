package com.kh.semi.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.Answer;

@RestController
public class CustomerAjaxController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping(value="replys/{qnaNo}", produces="application/json; charset=UTF-8")
	public String replyList(@PathVariable("qnaNo") int qnaNo) {
		return new Gson().toJson(customerService.replyList(qnaNo));
	}
	
	@PostMapping(value="replys", produces="text/html; charset=UTF-8")
	public String replyInsert(Answer answer, String qnaStatus) {
		int result = 0;
		if (answer.getReplyWriter() == 1 && qnaStatus.equals("N")) {
			if (customerService.replyInsert(answer) > 0) {
				result = customerService.replyCompleted(answer.getQnaNo());
			}
		} else {
			result = customerService.replyInsert(answer);
		}
		return (result > 0) ? "success" : "fail"; 
	}
	
	@PostMapping(value="replyUpdate", produces="text/html; charset=UTF-8")
	public String replyUpdate(Answer answer) {
		return (customerService.replyUpdate(answer) > 0) ? "success" : "fail";
	}
	
	@PostMapping(value="replyDelete", produces="text/html; charset=UTF-8")
	public String replyDelete(Answer answer) {
		return (customerService.replyDelete(answer) > 0) ? "success" : "fail";
	}
	
}