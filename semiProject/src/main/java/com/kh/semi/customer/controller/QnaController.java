package com.kh.semi.customer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.common.template.pagination;
import com.kh.semi.customer.model.service.CustomerService;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;

@RestController
public class QnaController {

    @Autowired
    private CustomerService customerService;

    // QNA 목록 조회
    @GetMapping("qnaList")
    public ModelAndView qnaList(ModelAndView mv,
                                @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                                String select, String keyword) {
       
    	int listCount;
        int pageLimit = 10;
        int boardLimit = 15;

        if (keyword != null) {
            if (keyword.equals("")) {
                mv.setViewName("customer/qna");
                return mv;
            } else {
                HashMap<String, String> map = new HashMap();
                map.put("select", select);
                map.put("keyword", keyword);

                listCount = customerService.searchQnaCount(map);

                PageInfo pi = pagination.getPageInfo(listCount, currentPage, boardLimit, pageLimit);

                List<QNA> list = customerService.searchQnaList(pi, map);

                mv.addObject("qnaList", list);
                mv.addObject("pi", pi);
                mv.addObject("select", select);
                mv.addObject("keyword", keyword);
                mv.setViewName("customer/qna");
                return mv;
            }
        } else {
            listCount = customerService.selectQnaCount();

            PageInfo pageInfo = pagination.getPageInfo(listCount, currentPage, boardLimit, pageLimit);
            List<QNA> list = customerService.qnaList(pageInfo);

            mv.addObject("qnaList", list);
            mv.addObject("pi", pageInfo);
            mv.setViewName("customer/qna");

            return mv;
        }
    }

    // QNA 등록 폼
    @GetMapping("enrollQnaForm")
    public ModelAndView enrollQnaForm(ModelAndView mv) {
        mv.setViewName("customer/enrollQnaForm");
        return mv;
    }

    // 파일 저장 메서드
    public String saveFile(MultipartFile file, String savePath) {
       
    	String originName = file.getOriginalFilename();
        String ext = originName.substring(originName.lastIndexOf("."));
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int ranNum = (int) Math.random() * 90000 + 10000;
        String changeName = currentTime + ranNum + ext;

        try {
            file.transferTo(new File(savePath + changeName));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }

        return changeName;
    }

    // QNA 등록
    @PostMapping("insertQna")
    public ModelAndView insertQna(ModelAndView mv, QNA qna, MultipartFile qaFile, HttpSession session) {
        
    	// QNA 내용 줄 바꿈 처리
        String changeContent = qna.getQnaContent();
        qna.setQnaContent(changeContent.replaceAll("\\n", "<br>"));

        if (!qaFile.getOriginalFilename().equals("")) {
            // 파일이 첨부된 경우
            NoticeFile file = new NoticeFile();
            file.setFilePath(session.getServletContext().getRealPath("/resources/qa_files/"));
            file.setOriginName(qaFile.getOriginalFilename());
            file.setChangeName(saveFile(qaFile, file.getFilePath()));
            file.setBoardType(8);

            // 파일과 함께 QNA 등록
            if (customerService.insertQna(qna, file) > 0) {
                session.setAttribute("alertMsg", "문의글 작성 성공");
                mv.setViewName("redirect:qnaList");
                return mv;
            } else {
                session.setAttribute("errorMsg", "다시 작성해주세요");
                mv.setViewName("common/errorPage");
                return mv;
            }
        } else {
            // 파일이 첨부되지 않은 경우
            if (customerService.insertQna(qna, null) > 0) {
                session.setAttribute("alertMsg", "문의글 작성 성공");
                mv.setViewName("redirect:qnaList");
                return mv;
            } else {
                session.setAttribute("errorMsg", "다시 작성해주세요");
                mv.setViewName("common/errorPage");
                return mv;
            }
        }
    }

    // QNA 상세 조회
    @GetMapping("qnaDetail")
    public ModelAndView qnaDetail(ModelAndView mv, int qnaNo,
                                  @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        
    	mv.addObject("qna", customerService.qnaDetail(qnaNo));
        mv.setViewName("customer/qnaDetail");
        return mv;
    }

    // QNA 삭제
    @PostMapping("deleteQna")
    public ModelAndView deleteQna(HttpSession session, ModelAndView mv, int qnaNo, int qnaFileNo,
                                  @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
        // QNA 파일이 있는 경우
        if (qnaFileNo > 0) {
            QNA qna = customerService.qnaDetail(qnaNo);
            if (customerService.deleteQna(qnaNo) > 0) {
                HashMap<String, Integer> map = new HashMap();
                map.put("boardNo", qnaNo);
                map.put("boardType", 8);

                if (customerService.deleteFile(map) > 0) {
                    new File(qna.getQnaFile().getFilePath() + qna.getQnaFile().getChangeName()).delete();
                }

                session.setAttribute("alertMsg", "삭제완료");
                mv.setViewName("redirect:qnaList?currentPage=" + currentPage);
            } else {
                mv.addObject("errorMsg", "삭제 실패");
                mv.setViewName("common/errorPage");
            }
        } else {
            if (customerService.deleteQna(qnaNo) > 0) {
                session.setAttribute("alertMsg", "삭제완료");
                mv.setViewName("redirect:qnaList?currentPage=" + currentPage);
            } else {
                mv.addObject("errorMsg", "삭제 실패");
                mv.setViewName("common/errorPage");
            }
        }
        return mv;
    }

    // QNA 수정 폼
    @PostMapping("updateQnaView")
    public ModelAndView updateQnaView(ModelAndView mv, int qnaNo) {
        QNA qna = customerService.qnaDetail(qnaNo);
        qna.setQnaContent(qna.getQnaContent().replaceAll("<br>", ""));

        mv.addObject("qna", qna);
        mv.setViewName("customer/updateQnaForm");
        return mv;
    }

    // QNA 수정
    @PostMapping("updateQna")
    public ModelAndView updateQna(ModelAndView mv, QNA qna, MultipartFile qaFile, HttpSession session) {
        String changeContent = qna.getQnaContent();
        changeContent = changeContent.replaceAll(" ", "&nbsp;");
        changeContent = changeContent.replaceAll("\\n", "<br>");
        qna.setQnaContent(changeContent);
        if (!qaFile.getOriginalFilename().equals("")) {
            QNA originQna = customerService.qnaDetail(qna.getQnaNo());
            int boardType = 8;
            HashMap<String, Integer> map = new HashMap();
            map.put("noticeNo", qna.getQnaNo());
            map.put("boardType", boardType);
            NoticeFile originFile = customerService.noticeFile(map);
            NoticeFile file = new NoticeFile();
            file.setFilePath(session.getServletContext().getRealPath("/resources/qa_files/"));
            file.setOriginName(qaFile.getOriginalFilename());
            file.setChangeName(saveFile(qaFile, file.getFilePath()));
            file.setBoardType(8);

            if (originFile != null) {
                new File(originQna.getQnaFile().getFilePath() + originQna.getQnaFile().getChangeName()).delete();
            } else {
                file.setBoardNo(qna.getQnaNo());
                customerService.insertFile(file);
            }
            if (customerService.updateQna(qna, file) > 0) {
                session.setAttribute("alertMsg", "수정 완료");
                mv.setViewName("redirect:qnaDetail?qnaNo=" + qna.getQnaNo());
            } else {
                mv.addObject("errorMsg", "삭제 실패");
                mv.setViewName("common/errorPage");
            }
        } else {
            if (customerService.updateQna(qna, null) > 0) {
                session.setAttribute("alertMsg", "수정 완료");
                mv.setViewName("redirect:qnaDetail?qnaNo=" + qna.getQnaNo());
            } else {
                mv.addObject("errorMsg", "삭제 실패");
                mv.setViewName("common/errorPage");
            }
        }
        return mv;
    }
}