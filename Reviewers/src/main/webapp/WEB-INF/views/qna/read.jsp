<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		var formObj = $("form[name='readForm']");
	
		// 게시글 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/cs/qna/update");
			formObj.attr("method", "get");
			formObj.submit();
		})
	
		// 게시글 삭제
		$(".delete_btn").on("click", function() {
			formObj.attr("action", "/cs/qna/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})
	
		// 목록
		$(".list_btn").on("click", function() {
			location.href = "/cs/qna";
		})
	})
</script>
<body>
		<form name="readForm" method="post">
			<input type="hidden" id="b_no" name="b_no" value="${read.b_no}" />
		</form>
		<table>
			<tbody>
				<tr>
					<td><label for="title">제목</label><input type="text" id="title"
						name="title" value="${read.title}" readonly /></td>
				</tr>
				<tr>
					<td><label for="content">내용</label> <textarea id="content"
							name="content" readonly><c:out value="${read.content}" /></textarea></td>
				</tr>
				<tr>
					<td><label for="writer">작성자</label><input type="text"
						id="writer" name="writer" value="${read.writer}" readonly /></td>
				</tr>
				<tr>
					<td><label for="regdate">작성날짜</label> <fmt:formatDate
							value="${read.reg_date}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</tbody>
		</table>
		<div>
			<button type="submit" class="update_btn">수정</button>
			<button type="submit" class="delete_btn">삭제</button>
			<button type="submit" class="list_btn">목록</button>
		</div>
		<div id="reply">
			<ol class="commentList">
				<c:forEach items="${commentList}" var="commentList">
					<li>
						<p>
							작성자 : ${commentList.writer}<br /> 작성 날짜 :
							<fmt:formatDate value="${commentList.reg_date}" pattern="yyyy-MM-dd" />
						</p>

						<p>댓글 내용: ${commentList.content}</p>
					</li>
				</c:forEach>
			</ol>
		</div>
</body>
</html>