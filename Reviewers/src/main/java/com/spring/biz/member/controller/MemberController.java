package com.spring.biz.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.biz.service.MemberService;
import com.spring.biz.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	// 로그인 폼
	@GetMapping("login")
	public String loginForm() {
		return "/member/login-form";
	}
	
	// 로그인 처리
	@PostMapping("login")
	public String login(@ModelAttribute("member") MemberVO memberVO, HttpSession session, RedirectAttributes rAttr) {
		MemberVO member = memberService.login(memberVO);
		if (member != null) {
			session.setAttribute("member", member);
			return "redirect:/member/mypage";
		} else {
			return "login";
		}
	}
	
	// 회원가입 폼
	@GetMapping("sign-up")
	public String signUpForm() {
		return "/member/sign-up-form";
	}
	
	// 회원가입 처리
	@PostMapping("sign-up")
	public String signUpForm(@ModelAttribute("member") MemberVO memberVO, RedirectAttributes rAttr) {
		memberService.signUp(memberVO);
		rAttr.addFlashAttribute("status", true);
		return "redirect:/member/login";
	}
	
	// 회원정보수정 폼
	@GetMapping("edit")
	public String editForm() {
		return "/member/edit-form";
	}
	
	// 회원정보 수정 처리
	@PostMapping("edit")
	public String edit(@ModelAttribute("member") MemberVO memberVO, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		memberService.memberEdit(memberVO);
		
		// 세션 정보 업데이트 
		MemberVO updatedMember = memberService.findMemberById(member.getUserId());
		session.setAttribute("member", updatedMember);
		return "redirect:/member/mypage";
	}
	
	// 회원탈퇴 폼
	@GetMapping("withdraw")
	public String withdraw() {
		return "/member/withdraw";
	}
	
	// 회원탈퇴 처리
	@PostMapping("withdraw")
	public String withdraw(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		memberService.withdraw(member);
		session.invalidate();
		return "redirect:/member/login";
	}
	
	// 마이페이지 폼
	@GetMapping("mypage")
	public String mypage(RedirectAttributes rAttr) {
		return "/member/mypage";
	}

}
