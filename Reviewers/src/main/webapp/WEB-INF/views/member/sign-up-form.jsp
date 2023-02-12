<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>로그인</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form action="/member/sign-up" method="post">
		<div>
			<label for="userId">아이디</label>
			<input name="userId" type="text" onblur="checkId()">
		</div>
		<div>
			<span id="idMsg"></span>
		</div>
		<div>
			<label for="userPw">비밀번호</label
			><input name="userPw" class="userPw" type="password">
		</div>
		<div>
			<label for="confirmPw">비밀번호 확인</label>
			<input name="confirmPw" class="confirmPw" type="password">
		</div>
		<div>
			<span class=pwCheck></span>
		</div>
		<div>
			<label for="userName">이름</label>
			<input name="userName" type="text">
		</div>
		<div>
			<span class="userNameCheck"></span>
		</div>
		<div>
			<button type="submit">회원가입</button>
			<button class="cancel-btn" type="button">취소</button>
		</div>
	</form>

	<script>
		 $(function() {
		  	// 비밀번호, 비밀번호 확인 검사
		    $('.userPw, .confirmPw').on('keyup', function() {
		      if ($('.userPw').val() && $('.confirmPw').val()) {
		        if ($('.userPw').val() === $('.confirmPw').val()) {
		          $('.pwCheck').text('비밀번호가 일치합니다.').css('color', 'green');
		        } else {
		          $('.pwCheck').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
		        }
		      } else {
		        $('.pwCheck').empty();
		      }
		    });
		    
		  	// 필수 입력 값 검사
		    $("form").submit(function(event) {
		      if(!$("input").filter(function() { return $(this).val() == ""; }).length) {
		        if($(".userPw").val() === $(".confirmPw").val()) {
		          return true;
		        } else {
		          $(".pwCheck").text("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		          return false;
		        }
		      } else {
		        event.preventDefault();
		      }
		    });
		});
	</script>
</body>
</html>