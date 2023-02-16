package com.spring.biz.member.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.biz.member.service.MemberService;
import com.spring.biz.member.vo.MemberVO;

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
	
	// 로그아웃 처리
	@PostMapping("logout")
	public String logout(HttpSession session) {
	    if (session == null) {
	        return "redirect:/member/login";
	    }
	    session.invalidate();
	    return "redirect:/member/login";
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
	
	// 닉네임 중복검사
    @ResponseBody
    @PostMapping("checkNameDuplicate")
    public boolean checkNameDuplicate(@RequestParam String userName) {
        return memberService.isNameDuplicate(userName);
    }

	// 회원정보수정 폼
	@GetMapping("edit")
	public String editForm(HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("member");
		if(loginUser == null) {
			return "/member/login-form";
		}
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

	// 프로필 사진 업로드
	@PostMapping("file-upload")
	public String fileUpload(@RequestParam("uploadFile") MultipartFile file, HttpSession session) throws Exception {
	    MemberVO member = (MemberVO) session.getAttribute("member");

	    String originalFilename = file.getOriginalFilename();
	    UUID uuid = UUID.randomUUID();
	    String uploadFileName = uuid.toString() + "_" + originalFilename;

	    String basePath = "/resources/member/images/";

	    File dir = new File(basePath);
	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    String uploadPath = basePath + uploadFileName;

	    File dest = new File(session.getServletContext().getRealPath(basePath + uploadFileName));
	    file.transferTo(dest);

	    member.setUserImg(uploadPath);
	    memberService.memberImgUpload(member.getUserId(), member.getUserImg());
	    session.setAttribute("member", member);

	    return "redirect:/member/edit";
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
