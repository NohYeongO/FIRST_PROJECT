package com.kh.semi.customer.controller;

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
import com.kh.semi.customer.model.vo.Notice;
import com.kh.semi.customer.model.vo.NoticeFile;
import com.kh.semi.customer.model.vo.QNA;

@RestController
public class NoticeController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private QnaController qnaController;
	
	@GetMapping("customer") // 고객센터 메인페이지 공지사항 최신순 3개 조회
	public ModelAndView notice(ModelAndView mv){
		
		List<Notice> list = customerService.notice();
		
		mv.addObject("noticeList", list);
		mv.setViewName("customer/customer");
		
		return mv;
	}
	
	@GetMapping("faq")
	public ModelAndView faq(ModelAndView mv) {
		mv.setViewName("customer/faq");
		return mv;
	}
	
	@GetMapping("notice")
    public ModelAndView noticeList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
                                   String select, String keyword) {
        int listCount;
        int pageLimit = 10;
        int boardLimit = 15;
        
        if(keyword != null) {
            if(keyword.equals("")) {
                mv.setViewName("customer/notice");
                return mv;
            } else {
                HashMap<String, String> map = new HashMap<>();
                map.put("select", select);
                map.put("keyword", keyword);
                listCount = customerService.searchNoticeCount(map);
                PageInfo pi = pagination.getPageInfo(listCount, currentPage, boardLimit, pageLimit);
				List<Notice> list = customerService.searchNotice(pi, map);
				mv.addObject("noticeList", list);
	            mv.addObject("pi", pi);
	            mv.addObject("select", select);
	            mv.addObject("keyword", keyword);
	            mv.setViewName("customer/notice");
	            return mv;
	        }
	     } else {
	        listCount = customerService.selectNoticeCount();
	        PageInfo pageInfo = pagination.getPageInfo(listCount, currentPage, boardLimit, pageLimit);
			List<Notice> list = customerService.noticeList(pageInfo);
			mv.addObject("noticeList", list);
			mv.addObject("pi", pageInfo);
			mv.setViewName("customer/notice");
			return mv;
		}
	}
	
	@GetMapping("noticeDetail")
    public ModelAndView noticeDetail(ModelAndView mv, int noticeNo, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {

        // 공지사항 상세 페이지 조회
        int boardType = 4;

        HashMap<String, Integer> map = new HashMap<>();
        map.put("noticeNo", noticeNo);
        map.put("boardType", boardType);

        Notice noticeDetail = customerService.noticeDetail(noticeNo);
        String changeContent = noticeDetail.getNoticeContent();
        changeContent.replaceAll("&nbsp;" , " ");
        changeContent.replaceAll("<br>", "\\n");
        noticeDetail.setNoticeContent(changeContent);
        
        NoticeFile noticeFile = customerService.noticeFile(map);

        mv.addObject("noticeDetail", noticeDetail);
        mv.addObject("noticeFile", noticeFile);
        mv.addObject("currentPage", currentPage);
        mv.setViewName("customer/noticeDetail");
        return mv;
    }
	
	@GetMapping("enrollNoticeForm")
    public ModelAndView enrollNoticeForm(ModelAndView mv) {
        // 공지사항 작성 페이지 이동
        mv.setViewName("customer/enrollNoticeForm");
        return mv;
    }
	
    @PostMapping("insertNotice")
    public ModelAndView insertNotice(ModelAndView mv, Notice notice, MultipartFile noticeFile, HttpSession session) {
        String changeContent = notice.getNoticeContent();
        changeContent = changeContent.replaceAll(" ", "&nbsp;");
        notice.setNoticeContent(changeContent.replaceAll("\\n", "<br>"));
        if(notice.getNoticeHold() == null) {
            notice.setNoticeHold("N");
        } else {
            notice.setNoticeHold("Y");
        }
        if (!noticeFile.getOriginalFilename().equals("")) {
            NoticeFile file = new NoticeFile();
            file.setFilePath(session.getServletContext().getRealPath("/resources/notice/"));
            file.setOriginName(noticeFile.getOriginalFilename());
            file.setChangeName(qnaController.saveFile(noticeFile, file.getFilePath()));
            file.setBoardType(4);
            file.setBoardNo(notice.getNoticeNo());
            
            if (customerService.insertNotice(notice, file) > 0) {
                session.setAttribute("alertMsg", "공지사항 작성 성공");
                mv.setViewName("redirect:notice");
                return mv;
            } else {
                session.setAttribute("errorMsg", "다시 작성해주세요");
                mv.setViewName("common/errorPage");
                return mv;
            }
        } else {
            if (customerService.insertNotice(notice, null) > 0) {
                session.setAttribute("alertMsg", "공지사항 작성 성공");
                mv.setViewName("redirect:notice");
                return mv;
            } else {
                session.setAttribute("errorMsg", "다시 작성해주세요");
                mv.setViewName("common/errorPage");
                return mv;
            }
        }
    }
}
