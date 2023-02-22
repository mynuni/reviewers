package com.spring.biz.cs.faq;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.util.PageMaker;
import com.spring.biz.util.SearchCriteria;

@Controller
@RequestMapping("cs")
public class FaqBoardController {

	private final FaqBoardService faqBoardService;

	@Autowired
	public FaqBoardController(FaqBoardService faqBoardService) {
		this.faqBoardService = faqBoardService;
	}

	// 글 목록
	@GetMapping("/faq/list")
	public String getFaqBoardList(SearchCriteria criteria, HttpSession session, Model model) {
		criteria.calculateRowNum();
		int totalCount = faqBoardService.countFaqBoardList(criteria);
		PageMaker pageMaker = new PageMaker(criteria, totalCount);
		model.addAttribute("faqList", faqBoardService.getFaqBoardList(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "/cs/faq-list";
	}

}
