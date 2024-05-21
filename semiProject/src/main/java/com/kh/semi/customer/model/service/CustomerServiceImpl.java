package com.kh.semi.customer.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.customer.model.dao.CustomerRepository;
import com.kh.semi.customer.model.vo.Answer;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Notice> notice(){
		return customerRepository.notice(sqlSession);
	}
	@Override
	public int selectNoticeCount() {
		return customerRepository.selectNoticeCount(sqlSession);
	}
	@Override
	public List<Notice> noticeList(PageInfo pageInfo) {
		
		int startNum = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
		int endNum = ((pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1) + pageInfo.getBoardLimit();
		HashMap<String, Integer> map = new HashMap();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return customerRepository.noticeList(sqlSession, map);
	}
	
	@Override
	public int searchNoticeCount(HashMap<String, String> map) {
		return customerRepository.searchNoticeCount(sqlSession, map);
	}
	@Override
	public List<Notice> searchNotice(PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return customerRepository.searchNotice(sqlSession, map, rowBounds);
	}
	@Override
	public Notice noticeDetail(int noticeNo) {
		return customerRepository.noticeDetail(sqlSession, noticeNo);
	}
	@Override
	public NoticeFile noticeFile(HashMap<String, Integer> map) {
		return customerRepository.noticeFile(sqlSession, map);
	}
	
	@Override
	public int insertNotice(Notice notice, NoticeFile file) {
		int result = 0;
		if(file == null) {
			result = customerRepository.insertNotice(sqlSession, notice);
		} else {
			if(customerRepository.insertNotice(sqlSession, notice) > 0) {
				result = customerRepository.insertFile(sqlSession, file);
			}
		}
		return result;
	}
	
	// ==================== qna관련 서비스 =======================
	
	@Override
	public int selectQnaCount() {
		return customerRepository.selectQnaCount(sqlSession);
	}
	@Override
	public List<QNA> qnaList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return customerRepository.qnaList(sqlSession, rowBounds);
	}
	@Override
	public int searchQnaCount(HashMap<String, String> map) {
		return customerRepository.searchQnaCount(sqlSession, map);
	}
	
	@Override
	public List<QNA> searchQnaList(PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return customerRepository.searchQnaList(sqlSession, map, rowBounds);
	}
	
	@Override
	public int insertQna(QNA qna, NoticeFile file) {
		int result = 0;
		if(file == null) {
			result = customerRepository.insertQna(sqlSession, qna);
		} else {
			if(customerRepository.insertQna(sqlSession, qna) > 0) {
				result = customerRepository.insertFile(sqlSession, file);
			}
		}
		
		return result;
	
	}
	
	@Override
	public int insertFile(NoticeFile file) {
		return customerRepository.insertFile(sqlSession, file);
	}
	
	@Override
	public QNA qnaDetail(int qnaNo) {
		return customerRepository.qnaDetail(sqlSession, qnaNo);
	}
	
	@Override
	public int deleteQna(int qnaNo) {
		return customerRepository.deleteQna(sqlSession, qnaNo);
	}
	
	@Override
	public int deleteFile(HashMap<String, Integer> map) {
		return customerRepository.deleteFile(sqlSession, map);
	}

	@Override
	public int updateQna(QNA qna, NoticeFile file) {
		
		int result = 0;
		
		if(file != null) {
			if(customerRepository.updateQna(sqlSession, qna)>0) {
				result = customerRepository.updateFile(sqlSession, file);
			}
		} else {
			result = customerRepository.updateQna(sqlSession, qna);
		}
		
		return result;
	}
	
	// ===================== qna 댓글 관련 서비스 ===========================
	@Override
	public List<Answer> replyList(int qnaNo) {
		return customerRepository.replyList(sqlSession, qnaNo);
	}
	@Override
	public int replyInsert(Answer answer) {
		return customerRepository.replyInsert(sqlSession,answer);
	}
	@Override
	public int replyCompleted(int qnaNo) {
		return customerRepository.replyCompleted(sqlSession, qnaNo);
	}
	@Override
	public int replyUpdate(Answer answer) {
		return customerRepository.replyUpdate(sqlSession, answer);
	}
	@Override
	public int replyDelete(Answer answer) {
		return customerRepository.replyDelete(sqlSession, answer);
	}
	
}
