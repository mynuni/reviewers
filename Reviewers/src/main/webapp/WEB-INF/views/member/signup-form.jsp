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
</body>
</html>