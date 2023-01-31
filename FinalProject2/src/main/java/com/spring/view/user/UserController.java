package com.spring.view.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
import com.spring.biz.userInfo.UserInfoService;
import com.spring.biz.userInfo.UserInfoVO;
import com.spring.view.email.MailSendService;

@Controller
@SessionAttributes({"User","UserInfo"})

public class UserController {
	@Autowired
	private MailSendService mailService;
	@Autowired
	private UserService userService;
	@Autowired
	private UserInfoService userinfoservice;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "/insertUser.do")
	public String insertUser(UserVO vo,HttpServletResponse response,UserInfoVO Ivo) throws IOException {
		System.out.println("회원가입");
		
		vo.setPassword(pwdEncoder.encode(vo.getPassword()));
		userService.insertUser(vo);
		System.out.println("error1");
		System.out.println(Ivo.getNickname());
		userinfoservice.insertUserInfo(Ivo);
		
		System.out.println("error2");
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('회원가입이 완료되었습니다. 로그인을 해주세요');location.href='index.jsp'</script>");
        out.flush();
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value = "/login.do", method =RequestMethod.GET)
	public String loginView(UserVO vo) {
		System.out.println("로그인 화면으로 이동");
		return "login.jsp";
	}
	@RequestMapping(value = "/login.do", method =RequestMethod.POST)
	public String login(UserVO vo ,UserInfoVO Ivo ,Model model , HttpServletResponse response) throws IOException {
		System.out.println("로그인 시도");
		System.out.println(vo.getUserId());
		
		UserVO User = userService.idCheck(vo);
		System.out.println(User.getUserId());
		System.out.println(User.getName());
		boolean result = pwdEncoder.matches(vo.getPassword(),User.getPassword());
		System.out.println(result);
		if(User!=null && result) {
			System.out.println("로그인 완료");
			model.addAttribute("User", userService.idCheck(vo));
			System.out.println(vo.getUserId());
			model.addAttribute("UserInfo",userinfoservice.getUserInfo(Ivo));
			return "testMovie.do";
		}else {
			 	response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	            out.flush();
			System.out.println("로그인 실패");
			return "web-inf/index.jsp";
		}
		
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session,HttpServletResponse response) throws IOException {

		System.out.println("로그아웃 처리");
		
		// 1. 브라우저와 연결된 세션 객체를 강제로 종료한다.
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그아웃되었습니다.');location.href='index.jsp';</script>");
        out.flush();
		// 2. 세션 종료후, 메인 화면으로 이동한다.
		return "testMovie.do";

	}

	
	@ResponseBody
	@RequestMapping(value = "/checkID.do",method=RequestMethod.GET)
	public int checkID(UserVO vo) {
		int reuslt = 0;
		
		System.out.println(vo.getUserId());
		
		if(userService.idCheck(vo)!=null) {reuslt = 1;}else {reuslt = 0;}
		System.out.println(reuslt);
		return reuslt;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkNickName.do",method=RequestMethod.GET)
	public int checkNickName(UserInfoVO Vo) {
		int reuslt = 0;
		System.out.println(Vo.getNickname());
		if(userinfoservice.getNickname(Vo)!=null) {reuslt = 1;}else {reuslt = 0;}
		System.out.println(reuslt);
		return reuslt;
	}
	@ResponseBody
	@RequestMapping(value="/emailCheck.do")
	public String emailCheck(String email) {
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		String code = mailService.joinEmail(email);
		System.out.println(code);
		return code;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkTel.do",method=RequestMethod.GET)
	public int checkTel(UserVO vo) {
		int reuslt = 0;
		
		System.out.println(vo.getTel());
		
		if(userService.telCheck(vo)!=null) {reuslt = 1;}else {reuslt = 0;}
		System.out.println(reuslt);
		return reuslt;
	}
	
	@ResponseBody
	@RequestMapping(value="/findEmailCheck.do")
	public String findEmailCheck(String email,UserVO vo) {
		String code = null;
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		System.out.println(vo.getTel());
		if(userService.emailCheck(vo)!=null) {
		 code = mailService.joinEmail(email);
		System.out.println(code);
		}else {
			 code = "false";
			 System.out.println(code);
		}
		return code;
	}
	@RequestMapping(value = "/findId.do")
	public String findId(UserVO vo,Model model) {
		UserVO User = userService.emailCheck(vo);
		model.addAttribute("id",User.getUserId());
		return "resultId.jsp";
	}
	@ResponseBody
	@RequestMapping(value="/findPassword.do")
	public String findPassword(String email,UserVO vo) {
		String code = null;
		System.out.println("이메일 인증 요청");
		System.out.println("이메일 인증 이메일 : " + email);
		System.out.println(vo.getTel());
		if(userService.FindPassword(vo)!=null) {
		 code = mailService.joinEmail(email);
		System.out.println(code);
		}else {
			 code = "false";
			 System.out.println(code);
		}
		return code;
	}
	@RequestMapping(value = "/updatePassword.do")
	public String updatePassword(UserVO vo,Model model,HttpServletResponse response) throws IOException {
		vo.setPassword(pwdEncoder.encode(vo.getPassword()));
		System.out.println(vo.getUserId());
		System.out.println(vo.getPassword());
		System.out.println(vo.getEmail());
		System.out.println(vo.getTel().getClass().getTypeName());
		userService.updatePassword(vo);
		System.out.println(1);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('비밀번호가 변경되었습니다 다시 로그인 해주세요.');location.href='index.jsp';</script>");
        System.out.println(2);
        out.flush();
        return "result.jsp";
	}
	@PostMapping("/upload_ok.do")
	public String upload(@RequestParam("file") MultipartFile file ,UserInfoVO Ivo) {
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:\\Users\\jwpar\\Desktop\\Final_Project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\FinalProject\\resources\\UserProfile";
		
		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		System.out.println(uniqueName+fileExtension);
		
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "fileupload/upload_ok";
	}
	@RequestMapping("/getAllUser.do")
	public String getAllUser(UserVO vo,Model model) {
		model.addAttribute("User",userService.getUserLIst(vo));
		return "testList.jsp";
	}
}
