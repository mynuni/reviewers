<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
	<div>
	    <label for="userId">아이디:</label>
	    <input type="text" name="userId" value="${member.userId}" readonly>
	</div>
	<div>
	    <label for="userName">닉네임:</label>
	    <input type="text" name="userName" value="${member.userName}" readonly>
	</div>
	<button class="cancel-btn" type="button">취소</button>
	<button class="edit-btn" type="submit">수정</button>
	<button class="withdraw-btn" type="button">탈퇴</button>
</body>
</html>