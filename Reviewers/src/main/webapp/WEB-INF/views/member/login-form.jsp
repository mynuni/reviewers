<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<style>

	.pop-up__bottom {
 		width: 500px;
		height: 100px;
		background-color: purple;
		color: white;
   		text-align: center;
	}
	
</style>
<title>로그인</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="/member/login" method="post">
		<div><label for="userId">아이디</label><input name="userId" type="text"></div>
		<div><label for="userPw">비밀번호</label><input name="userPw" type="password"></div>
		<button class="btn btn__login" type="submit">로그인</button>
		<button class="btn btn__sign-up" type="button">회원가입</button>
	</form>
	<c:if test="${status}">
		<span class="pop-up__bottom">회원가입이 성공적으로 완료되었습니다.</span>
	</c:if>

	<script>
		$(function() {
			// 뒤로가기 버튼
			$(".btn__login").click(function() {
				history.back();
			});

			// 회원가입 버튼
			$(".btn__sign-up").click(function() {
				$(location).attr("href", "/member/sign-up");
			});
			
			// 하단 팝업
			$(".pop-up__bottom").show(function(){
				$(this).delay(700).fadeOut(2000);
			});
		});
	</script>
</body>
</html>