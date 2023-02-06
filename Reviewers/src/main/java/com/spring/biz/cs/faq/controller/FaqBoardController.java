package com.spring.biz.cs.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.cs.faq.service.FaqBoardService;
import com.spring.biz.cs.faq.vo.FaqBoardVO;
import com.spring.biz.util.Criteria;
import com.spring.biz.util.PageMaker;

@Controller
@RequestMapping("/faq")
public class FaqBoardController {

	private final FaqBoardService faqBoardService;
	
	@Autowired
	public FaqBoardController(FaqBoardService faqBoardService) {
		this.faqBoardService = faqBoardService;
	}

	@GetMapping
	public String list(Criteria cri, Model model) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(faqBoardService.listCount());

		model.addAttribute("list", faqBoardService.list(cri));
		model.addAttribute("pageMaker", pageMaker);

		return "faq/list";
	}

	@GetMapping("read")
	public String read(FaqBoardVO faqBoardVO, Model model) throws Exception {
		model.addAttribute("read", faqBoardService.read(faqBoardVO.getBoardId()));

		return "faq/read";
	}

	@GetMapping("write")
	public String write() {
		
		return "faq/write-form";
	}

	@PostMapping("write")
	public String write(FaqBoardVO faqBoardVO) throws Exception {
		faqBoardService.write(faqBoardVO);
		
		return "redirect:/cs/faq";
	}

	@GetMapping("update")
	public String updateView(FaqBoardVO faqBoardVO, Model model) throws Exception {
		model.addAttribute("update", faqBoardService.read(faqBoardVO.getBoardId()));
		
		return "faq/update-form";
	}

	@PostMapping("update")
	public String update(FaqBoardVO faqBoardVO) throws Exception {
		faqBoardService.update(faqBoardVO);
		
		return "redirect:/cs/faq";
	}

	@PostMapping("delete")
	public String delete(FaqBoardVO faqBoardVO) throws Exception {
		faqBoardService.delete(faqBoardVO.getBoardId());
		
		return "redirect:/cs/faq";
	}

}
