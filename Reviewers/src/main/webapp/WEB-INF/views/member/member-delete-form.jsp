<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".cencle").on("click", function() {
				location.href = "/";
			})

			$("#submit").on("click", function() {
				if ($("#user_pw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
			});

		})
	</script>
		<form action="/member/delete" method="post">
				<label class="control-label" for="user_id">아이디</label> <input
					class="form-control" type="text" id="user_id" name="user_id"
					value="${member.user_id}" readonly="readonly" />
			<div class="form-group has-feedback">
				<label class="control-label" for="user_pw">패스워드</label> <input
					class="form-control" type="password" id="user_pw" name="user_pw" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name"
					value="${member.user_name}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
		<div>
			<c:if test="${msg == false}">비밀번호가 올바르지 않습니다.</c:if>
		</div>
</body>
</html>