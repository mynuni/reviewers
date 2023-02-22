package com.spring.biz.cs.faq;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.util.PageMaker;
import com.spring.biz.util.SearchCriteria;
import com.spring.biz.vo.MemberVO;

@Controller
@RequestMapping("/cs")
public class FaqBoardController {

	private final FaqBoardService faqBoardService;

	@Autowired
	public FaqBoardController(FaqBoardService faqBoardService) {
		this.faqBoardService = faqBoardService;
	}

	// 글 목록
	@GetMapping("/faq")
	public String getFaqBoardList(SearchCriteria criteria, HttpSession session, Model model) {
		criteria.calculateRowNum();
		int totalCount = faqBoardService.countFaqBoardList(criteria);
		PageMaker pageMaker = new PageMaker(criteria, totalCount);
		model.addAttribute("faqList", faqBoardService.getFaqBoardList(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "/cs/faq-list";
	}

	// 글 작성 폼
	@GetMapping("/faq/write")
	public String faqBoardWriteForm() {
		return "/cs/faq/faq-write-form";
	}

	// 글 작성
	@PostMapping("/faq/write")
	public String faqBoardWrite(FaqBoardVO faqBoardVO) {
		faqBoardService.writeFaqBoard(faqBoardVO);
		return "redirect:/cs/faq/list";
	}

	// 글 수정 폼
	@GetMapping("/faq/edit/{board}")
	public String getModifyFaqBoard(@PathVariable("board") int boardId, HttpSession session, Model model) {
		FaqBoardVO faqBoardVO = faqBoardService.getFaqBoardById(boardId);
		if (faqBoardVO == null) {
			return "redirect:/cs/faq/list";
		}
		model.addAttribute("faqBoardVO", faqBoardVO);
		return "/cs/faq/faq-edit-form";
	}

	// 글 수정
	@PostMapping("/faq/edit")
	public String faqBoardModify(FaqBoardVO faqBoardVO) {
		faqBoardService.updateFaqBoard(faqBoardVO);
		return "redirect:/cs/faq/list";
	}

	// 글 삭제
	@GetMapping("/faq/delete/{board}")
	public String faqBoardDelete(@PathVariable("board") int boardId, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		if (member == null || !member.getRole().equals("admin")) {
			return "redirect:/member/login";
		}
		FaqBoardVO faqBoardVO = faqBoardService.getFaqBoardById(boardId);
		if (faqBoardVO == null) {
			throw new RuntimeException ("해당 게시물이 존재하지 않습니다.");
		}

		faqBoardService.deleteFaqBoardById(boardId);
		return "redirect:/cs/faq/list";
	}

}
