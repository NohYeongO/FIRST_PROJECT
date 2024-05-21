package com.kh.semi.customer.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.customer.model.vo.Answer;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;

public interface CustomerService {

	List<Notice> notice();
	
	int selectNoticeCount();
	
	List<Notice> noticeList(PageInfo pi);
	
	int searchNoticeCount(HashMap<String, String> map);
	
	List<Notice> searchNotice(PageInfo pi, HashMap<String, String> map);
	
	Notice noticeDetail(int noticeNo);
	
	NoticeFile noticeFile(HashMap<String, Integer> map);
	
	int insertNotice(Notice notice,NoticeFile file);
	
	// qna관련 서비스
	int selectQnaCount();
	
	List<QNA> qnaList(PageInfo pi);
	
	int searchQnaCount(HashMap<String, String>map);
	
	List<QNA> searchQnaList(PageInfo pi, HashMap<String, String> map);
	
	int insertQna(QNA qna, NoticeFile file);
	
	int insertFile(NoticeFile file);
	
	QNA qnaDetail(int qnaNo);
	
	int deleteQna(int qnaNo);
	
	int deleteFile(HashMap<String, Integer> map);
	
	int updateQna(QNA qna, NoticeFile file);
	
	
	// qna댓글 관련
	List<Answer> replyList(int qnaNo);
	
	int replyInsert(Answer answer);
	
	int replyCompleted(int qnaNo);
	
	int replyUpdate(Answer answer);
	
	int replyDelete(Answer answer);
}
