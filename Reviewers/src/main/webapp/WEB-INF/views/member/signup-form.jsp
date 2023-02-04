<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$(".cencle").on("click", function() {

				location.href = "/login";

			})

			$("#submit").on("click", function() {
				if ($("#user_id").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#user_id").focus();
					return false;
				}
				if ($("#user_pw").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
				if ($("#user_name").val() == "") {
					alert("성명을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
			});

		})
	</script>
	<section id="container">
		<form action="/member/signup" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="user_id">아이디</label> <input
					class="form-control" type="text" id="user_id" name="user_id" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_pw">패스워드</label> <input
					class="form-control" type="password" id="user_pw" name="user_pw" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
</body>
</html>