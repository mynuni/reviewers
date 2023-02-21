package com.spring.biz.cs.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.cs.service.QnaBoardService;
import com.spring.biz.cs.vo.QnaBoardVO;
import com.spring.biz.util.PageMaker;
import com.spring.biz.util.SearchCriteria;
import com.spring.biz.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class QnaBoardController {

	private final QnaBoardService qnaBoardService;

	@Autowired
	public QnaBoardController(QnaBoardService qnaBoardService) {
		this.qnaBoardService = qnaBoardService;
	}

	@GetMapping("/myqna")
	public String getQnaBoardList(SearchCriteria criteria, HttpSession session, Model model) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null) {
			return "/member/login-form";
		}

		criteria.calculateRowNum();
		String userId = member.getUserId();
		String role = member.getRole();

		PageMaker pageMaker = null;
		List<QnaBoardVO> boardList = null;

		if (role.equals("admin")) {
			pageMaker = new PageMaker(criteria, qnaBoardService.getBoardCount());
			boardList = qnaBoardService.getBoardList(criteria);
		} else if (role.equals("user")) {
			pageMaker = new PageMaker(criteria, qnaBoardService.getMyBoardCount(criteria, userId));
			boardList = qnaBoardService.getMyBoardList(criteria, userId);
		}
 
		if (pageMaker == null || boardList == null) {
			return "/member/login-form";
		}

		pageMaker.setCriteria(criteria);
		model.addAttribute("board", boardList);
		model.addAttribute("pageMaker", pageMaker);
		return "/member/myqna";
	}
	
		// 글 작성 폼
		@GetMapping("/myqna/write")
		public String getQnaWriteForm(Model model, HttpSession session) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			if (member == null) {
				return "/member/login-form";
			}
			model.addAttribute("writer", member.getUserName());
			System.out.println(member.getUserName());
			System.out.println(member.getUserId());

			return "/member/qna-write-form";
		}
		
		// 글 작성
		@PostMapping("/myqna/write")
		public String writeQnaBoard(QnaBoardVO qnaBoardVO, HttpSession session) {
			MemberVO member = (MemberVO) session.getAttribute("member");
			qnaBoardVO.setWriterId(member.getUserId());
			qnaBoardService.writeQnaBoard(qnaBoardVO);
			
			String writer = member.getUserName();
			qnaBoardVO.setWriter(writer);
			System.out.println(qnaBoardVO.getWriter());
			return "redirect:/member/myqna";
		}

}
