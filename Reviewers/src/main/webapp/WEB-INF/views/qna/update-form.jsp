<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/cs/qna";
		})
	})
</script>
<body>
	<div id="root">
		<section id="container">
			<form name="updateForm" method="post" action="/cs/qna/update">

				<input type="hidden" name="b_no" value="${update.b_no}" readonly/>
				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label> <textarea id="content" name="content"><c:out value="${update.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly/></td>
						</tr>
						<tr>
							<td><label for="regdate">작성날짜</label> <fmt:formatDate value="${update.reg_date}" pattern="yy-MM-dd" /></td>
						</tr>
					</tbody>
				</table>
				<button type="submit" class="update_btn">저장</button>
				<button type="submit" class="cancel_btn">취소</button>
			</form>
		</section>
	</div>
</body>

</html>