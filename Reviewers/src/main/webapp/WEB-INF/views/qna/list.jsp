<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	ul {
		display: flex;
	}
	
	li {
		list-style: none;
		padding: 5px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>Q&A BOARD PAGE</h1>
	<form role="form" method="post" action="/board/write">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.b_no}" /></td>
					<td><a href="/cs/qna/read?b_no=${list.b_no}"><c:out value="${list.title}" /></a></td>
					<td><c:out value="${list.writer}" /></td>
					<td><fmt:formatDate value="${list.reg_date}" pattern="yy-MM-dd" /></td>
					<c:set var="status" value="${fn:replace(list.is_answered, '0', '진행중')} " />
					<c:set var="answer" value="${fn:replace(status, '1', '답변완료')} " />
					<td><c:out value="${answer}" /><td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a
						href="qna${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li><a href="qna${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="qna${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</form>
</body>
</html>