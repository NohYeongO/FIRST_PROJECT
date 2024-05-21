package com.kh.semi.customer.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.semi.customer.model.vo.Answer;
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;

@Repository
public class CustomerRepository {
	
	public List<Notice> notice(SqlSessionTemplate sqlSession){
		return sqlSession.selectList("customerMapper.notice");
	}
	
	public int selectNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("customerMapper.selectNoticeCount");
	}
	
	public List<Notice> noticeList(SqlSessionTemplate sqlSession, HashMap<String,Integer>map){
		return sqlSession.selectList("customerMapper.noticeList", map);
	}
	
	public int searchNoticeCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("customerMapper.searchNoticeCount", map);
	}
	
	public List<Notice> searchNotice(SqlSessionTemplate sqlSession, HashMap<String,String>map, RowBounds rowBounds){
		return sqlSession.selectList("customerMapper.searchNotice", map, rowBounds);
	}
	
	public NoticeFile noticeFile(SqlSessionTemplate sqlSession,HashMap<String, Integer> map) {
		return sqlSession.selectOne("customerMapper.noticeFile",map);
	}
	
	public Notice noticeDetail(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("customerMapper.noticeDetail", noticeNo);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("customerMapper.insertNotice", notice);
	}
	
	// =============== QNA 레퍼지토리 =====================
	
	public int selectQnaCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("customerMapper.selectQnaCount");
	}
	
	public List<QNA> qnaList(SqlSessionTemplate sqlSession, RowBounds rowBounds){
		return sqlSession.selectList("customerMapper.qnaList", null, rowBounds);
	}
	
	public int searchQnaCount(SqlSessionTemplate sqlSession, HashMap<String, String>map) {
		return sqlSession.selectOne("customerMapper.searchQnaCount",map);
	}
	
	public List<QNA> searchQnaList(SqlSessionTemplate sqlSession, HashMap<String,String>map, RowBounds rowBounds){
		return sqlSession.selectList("customerMapper.searchQnaList", map, rowBounds);
	}
	
	public int insertQna(SqlSessionTemplate sqlSession, QNA qna) {
		return sqlSession.insert("customerMapper.insertQna", qna);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, NoticeFile file) {
		return sqlSession.insert("customerMapper.insertFile", file);
	}
	
	public QNA qnaDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("customerMapper.qnaDetail", qnaNo);
	}
	
	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.delete("customerMapper.deleteQna", qnaNo);
	}
	
	public int updateQna(SqlSessionTemplate sqlSession, QNA qna) {
		return sqlSession.update("customerMapper.updateQna", qna);
	}
	public int updateFile(SqlSessionTemplate sqlSession, NoticeFile file) {
		return sqlSession.update("customerMapper.updateFile", file);
	}
	
	public int deleteFile(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.delete("customerMapper.deleteFile", map);
	}
	

	// ===================== qna 댓글 래퍼지토리 ==================
	public List<Answer> replyList(SqlSessionTemplate sqlSession, int qnaNo){
		return sqlSession.selectList("customerMapper.replyList", qnaNo);
	}
	
	public int replyInsert(SqlSessionTemplate sqlSession, Answer answer) {
		return sqlSession.insert("customerMapper.replyInsert", answer);
	}
	
	public int replyCompleted(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("customerMapper.replyCompleted", qnaNo);
	}
	
	public int replyUpdate(SqlSessionTemplate sqlSession, Answer answer) {
		return sqlSession.update("customerMapper.replyUpdate", answer);
	}
	
	public int replyDelete(SqlSessionTemplate sqlSession, Answer answer) {
		return sqlSession.delete("customerMapper.replyDelete", answer);
	}
}
