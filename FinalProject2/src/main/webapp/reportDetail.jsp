<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${reportDetail }" var="list">
	<span>${list.userId }</span>
	<h3>${list.reportOption }</h3>
	<h3>${list.reportDetail }</h3>
	<hr>
</c:forEach>
</body>
</html>