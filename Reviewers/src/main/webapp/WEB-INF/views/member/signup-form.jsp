<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/member/signup" method="post">
		<input name="user_id" type="text">
		<input name="user_pw" type="password">
		<input name="user_name" type="text">
		<button type="submit">회원가입</button>
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