<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="container">
		<form action="/member/edit" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="user_id">아이디</label> <input
					class="form-control" type="text" id="user_id" name="user_id"
					value="${member.user_id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_pw">패스워드</label> <input
					class="form-control" type="password" id="user_pw" name="user_pw" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name"
					value="${member.user_name}" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
</body>
</html>