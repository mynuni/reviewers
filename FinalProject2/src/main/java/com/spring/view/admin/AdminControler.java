package com.spring.view.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.reportComment.reportCommentService;
import com.spring.biz.reportComment.reportCommentVO;
import com.spring.biz.reportReview.ReportReviewService;
import com.spring.biz.reportReview.ReportReviewVO;


import com.spring.biz.tableNum.tableNumService;
import com.spring.biz.tableNum.tableNumVO;
import com.spring.biz.util.PageDTO;
import com.spring.biz.util.SearchCriteria;

@Controller
public class AdminControler {
	@Autowired
	private ReportReviewService reviewService;
	@Autowired
	private tableNumService tableNumService;
	@Autowired
	private reportCommentService commentService;
	
	@RequestMapping(value = "/getReviewReport.do")
	public String getReviewReport(Model model,SearchCriteria cri) {
		// Model 정보 저장
				PageDTO pageMaker = new PageDTO(cri, reviewService.getTotalPages(cri));
				System.out.println("TotalPage : " + pageMaker.getTotalPage());
				System.out.println("StartPage : " + pageMaker.getStartPage());
				System.out.println("EndPage : " + pageMaker.getEndPage());
				
				model.addAttribute("pageMaker", pageMaker);	// Model 정보 저장
				System.out.println("error1");
				model.addAttribute("boardList", reviewService.getBoardListWithDynamicPaging(cri));	// Model 정보 저장
				System.out.println("error2");
//				model.addAttribute("boardList", boardService.getBoardList(vo));	// Model 정보 저장
				System.out.println(reviewService.getBoardListWithDynamicPaging(cri).get(0).getReportSeq());
		return "admin.jsp";
	}
	
	@RequestMapping(value = "/getCommentReport.do")
	public String getCommentReport(Model model,SearchCriteria cri) {
		PageDTO pageMaker = new PageDTO(cri, commentService.getTotalPages(cri));
		System.out.println("TotalPage : " + pageMaker.getTotalPage());
		System.out.println("StartPage : " + pageMaker.getStartPage());
		System.out.println("EndPage : " + pageMaker.getEndPage());
		System.out.println(commentService.getBoardListWithDynamicPaging(cri));
		System.out.println("error1");
		model.addAttribute("boardList", commentService.getBoardListWithDynamicPaging(cri));	// Model 정보 저장
		model.addAttribute("pageMaker", pageMaker);
		return "reportComment.jsp";
	}
	@RequestMapping(value = "/getReportDetail.do")
	public String getReportDetail(Model model ,ReportReviewVO vo) {
		List<ReportReviewVO> list = reviewService.getReportReviewDetail(vo);
		System.out.println(list);
		model.addAttribute("reportDetail",list);
		return "reportDetail.jsp";
	}
	@RequestMapping(value = "/getReportCommentDetail.do")
	public String getReportCommentDetail(Model model ,reportCommentVO vo) {
		List<reportCommentVO> list = commentService.getReportCommentDetail(vo);
		System.out.println(list);
		model.addAttribute("reportDetail",list);
		return "reportDetail.jsp";
	}
	@RequestMapping(value = "/insertReviewReport.do")
	public String insertReviewRepoer(ReportReviewVO vo,HttpServletResponse response) throws IOException {
		
		if(reviewService.getValid(vo)==0) {
			reviewService.insertReportReview(vo);
		System.out.println("error");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('신고가 완료되었습니다'); window.open('about:blank','_self').close();</script>");
        out.flush();
		}else {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('이미 신고한 게시물입니다');  history.go(-1);</script>");
	        out.flush();
		}
		return "index.jsp";
	}
	@RequestMapping(value = "/inertCommentReport.do")
	public String insertCommentReport(reportCommentVO vo,HttpServletResponse response) throws IOException {
		if(commentService.getValid(vo)==0) {
			commentService.intsertRePortComment(vo);
		System.out.println("error");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('신고가 완료되었습니다'); window.open('about:blank','_self').close();</script>");
        out.flush();
		}else {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('이미 신고한 게시물입니다');  history.go(-1);</script>");
	        out.flush();
		}
		return "index.jsp";
	}
	@RequestMapping(value = "/test.do")
	public String test() {
		// Model 정보 저장
				
		return "/WEB-INF/views/home.jsp";
	}
}
