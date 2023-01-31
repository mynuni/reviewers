<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>Insert title here</title>
</head>
<body>	
	<h1>${board.title }</h1>
	<b>${board.nickname }</b>
	<span id = "UserID"> ${board.userId }</span>
	<h3>${board.content }</h3>
	<button id = "report">신고하기</button>
	<script type="text/javascript">
		$("#report").on("click",function(e){
			const url = "testInsertReport.jsp"
			window.open(url,'신고하기','width=500, height=700, scrollbars=yes,resizable=no');
		})
	</script>
</body>
</html>