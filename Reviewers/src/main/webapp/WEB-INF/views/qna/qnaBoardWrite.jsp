<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="/support/qna/write">
		  <input type="hidden" name="writerId" value="${member.userId}" readonly>
		
		  <input type="text" name="writer" value="${member.userName}" readonly>
		
		  <label for="title">제목</label>
		  <input type="text" id="title" name="title" required><br> <br>
		
		  <label for="title">주제</label>
		  <input type="text" id="subject" name="subject" required><br> <br>
		
		  <label for="content">내용</label>
		  <textarea id="content" name="content" rows="10" cols="30" required></textarea>
		
		  <label for="files">파일 선택</label>
		  <input type="file" id="fileInput" name="files" id="files" multiple>
		
		  <div id="fileList" style="display: flex; flex-wrap: wrap;">
		    <!-- 첨부한 파일 목록이 표시될 영역 -->
		  </div>
		  <button type="submit">작성</button>
	</form>
</body>
</html>