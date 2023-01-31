package com.spring.biz.cs.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.cs.qna.domain.QnaBoardVO;
import com.spring.biz.cs.qna.service.QnaBoardService;

@Controller
@RequestMapping("cs/qna")
public class QnaBoardController {

	@Autowired
	QnaBoardService qnaBoardService;

	@GetMapping
	public String list(Model model) throws Exception {
		model.addAttribute("list", qnaBoardService.list());
		return "qna/list";
	}

	@GetMapping("read")
	public String read(QnaBoardVO qnaBoardVO, Model model) throws Exception {
		model.addAttribute("read", qnaBoardService.read(qnaBoardVO.getB_no()));
		return "qna/read";
	}

	@GetMapping("write")
	public String write() {
		return "qna/write-form";
	}

	@PostMapping("write")
	public String write(QnaBoardVO qnaBoardVO) throws Exception {
		qnaBoardService.write(qnaBoardVO);
		return "redirect:/cs/qna";

	}

	@GetMapping("update")
	public String updateView(QnaBoardVO qnaBoardVO, Model model) throws Exception {
		model.addAttribute("update", qnaBoardService.read(qnaBoardVO.getB_no()));
		return "qna/update-form";
	}

	@PostMapping("update")
	public String update(QnaBoardVO qnaBoardVO) throws Exception {
		qnaBoardService.update(qnaBoardVO);
		return "redirect:/cs/qna";
	}

	@PostMapping("delete")
	public String delete(QnaBoardVO qnaBoardVO) throws Exception {
		qnaBoardService.delete(qnaBoardVO.getB_no());
		return "redirect:/cs/qna";
	}

}
