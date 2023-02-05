<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$(".cancel").on("click", function() {
				location.href = "/";
			})

			$("#submit").on("click", function() {
				if ($("#user_pw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
				if ($("#user_name").val() == "") {
					alert("이름을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
			});

		})
	</script>
		<form action="/member/edit" method="post">
			<label for="user_id">아이디</label>
			<input type="text" id="user_id" name="user_id" value="${member.user_id}" readonly/>
			<label for="user_pw">패스워드</label><input type="password" id="user_pw" name="user_pw" />
			<label for="user_name">이름</label><input type="text" id="user_name" name="user_name" value="${member.user_name}" />
			<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
			<button class="cancel btn btn-danger" type="button">취소</button>
		</form>
</body>
</html>