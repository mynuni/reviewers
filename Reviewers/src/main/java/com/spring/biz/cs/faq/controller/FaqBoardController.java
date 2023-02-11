package com.spring.biz.cs.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.cs.faq.service.FaqBoardService;
import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.PageDTO;
import com.spring.biz.util.SearchCriteria;

@Controller
@RequestMapping("/cs/faq")
public class FaqBoardController {

	private final FaqBoardService faqBoardService;

	@Autowired
	public FaqBoardController(FaqBoardService faqBoardService) {
		this.faqBoardService = faqBoardService;
	}

	@GetMapping
	public String getBoardList(SearchCriteria cri, Model model) {
		if (cri.getSearchCondition() == null) {
			cri.setSearchCondition("TITLE");
		}
		if (cri.getSearchKeyword() == null) {
			cri.setSearchKeyword("");
		}

		PageDTO pageMaker = new PageDTO(cri, faqBoardService.getTotalPages(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardList", faqBoardService.getBoardListWithDynamicPaging(cri));
		
		return "faq/list";
	}

}
