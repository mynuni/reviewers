<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/cs/faq.css" />
<link rel="stylesheet" href="https://kit.fontawesome.com/8e012a278c.css" crossorigin="anonymous">
<title>자주 믇는 질문</title>
</head>
<body>
	<div class="container">
		<div class="faq-container">
			<dl>
				<c:forEach var="list" items="${list}">
					<dt class="accordion">
						<span class="quetion-logo">Q</span>
						<span class="preface">[계정]</span>
						<span class="title"><c:out value="${list.title}" /></span>
					</dt>
					<dd class="panel">
						<c:out value="${list.content}" />
					</dd>
				</c:forEach>
			</dl>
		</div>
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a href="faq${pageMaker.makeQuery(pageMaker.startPage - 1)}"><i class="fa-solid fa-angle-left"></i></a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li><a href="faq${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="faq${pageMaker.makeQuery(pageMaker.endPage + 1)}"><i class="fa-solid fa-angle-right"></i></a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
	</script>
</body>
</html>