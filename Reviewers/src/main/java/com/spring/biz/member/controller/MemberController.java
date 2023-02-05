package com.spring.biz.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.biz.member.domain.MemberVO;
import com.spring.biz.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/signup")
	public String signup() throws Exception {
		return "member/signup-form";
	}

	@PostMapping("/signup")
	public void signup(MemberVO memberVO) throws Exception {
		String password = memberVO.getUser_pw();
		String bCryptPassword = passwordEncoder.encode(password);
		memberVO.setUser_pw(bCryptPassword);

		memberService.signUp(memberVO);
	}

	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rAttr) throws Exception{
	
		session.getAttribute("member");
		MemberVO login = memberService.login(vo);
		System.out.println(login);
		boolean pwdMatch = passwordEncoder.matches(vo.getUser_pw(), login.getUser_pw());

		if(login != null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rAttr.addFlashAttribute("msg", false);
		}
		
		
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpSession httpSession) throws Exception {

		httpSession.invalidate();

		return "redirect:/";
	}
	
	@GetMapping("/edit")
	public String memberUpdate() throws Exception{
		
		return "member/member-edit-form";
	}

	@PostMapping("/edit")
	public String memberUpdate(MemberVO memberVO, HttpSession httpSession) throws Exception{
		
		memberService.memberUpdate(memberVO);
		
		return "redirect:/";
	}
	
	@GetMapping("/delete")
	public String memberDelete() throws Exception{
		return "member/member-delete-form";
	}

	@PostMapping("/delete")
	public String memberDelete(MemberVO memberVO, HttpSession httpSession, RedirectAttributes rAttr) throws Exception{
		MemberVO member = (MemberVO) httpSession.getAttribute("member");
		String sessionPw = member.getUser_pw();
		String pwChk = memberVO.getUser_pw();
		
		if(!(sessionPw.equals(pwChk))) {
			rAttr.addFlashAttribute("msg", false);
			return "redirect:member/member-delete-form";
		}
		memberService.memberDelete(memberVO);
		httpSession.invalidate();
		return "redirect:/";
	}


}
