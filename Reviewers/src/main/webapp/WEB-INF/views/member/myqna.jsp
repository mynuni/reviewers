<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mypage.css">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mypage/mypage.js"></script>
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<title>리뷰어스 - 마이페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<main class="main main-container" id="main">
	<div class="mypage-container">
		<!-- 마이페이지 메뉴 -->
		<div class="mypage-menu">
			<div class="mypage-menu__info">
				<div class="profile-img-wrap">
					<c:choose>
						<c:when test="${member.userImg != null}">
							<div class="image-container">
								<img src="${pageContext.servletContext.contextPath}${member.userImg}" id="preview" class="profile-img"> <label for="imageFile" class="file-label" id="file-label"><i class="fas fa-camera"></i></label>
							</div>
						</c:when>
						<c:otherwise>
							<div class="image-container">
								<img src="${pageContext.servletContext.contextPath}/resources/emptyUserImg.png" id="preview" class="profile-img"> <label for="imageFile" class="file-label" id="file-label"><i class="fas fa-camera"></i></label>
							</div>
						</c:otherwise>
					</c:choose>
					<form id="fileUploadForm" action="/member/file-upload" method="post" enctype="multipart/form-data">
						<input type="file" name="uploadFile" id="imageFile" class="file-input">
						<button type="submit" class="fileUpload-btn" id="submitBtn">변경</button>
						<button type="button" class="fileUpload-cancel-btn" id="submitCancelBtn">취소</button>
					</form>
				</div>
				<div class="profile-info-wrap">
					<div class="profile-info__name">${member.userName}</div>
					<div class="profile-info__id">(${member.userId})</div>
				</div>
			</div>
			<div class="mypage-menu__list">
				<a id="mypage" href="#">마이페이지 홈</a> <a id="edit" href="#">회원정보수정</a>
				<div class="myactive-dropdown">
					<a href="#" class="myactive-dropdown-toggle">나의 활동 <i class="fa fa-plus"></i> <i class="fa fa-minus"></i>
					</a>
					<ul class="myactive-dropdown-list">
						<li><a id="myfavorate" href="#">나의 관심 컨텐츠</a></li>
						<li><a id="mypost" href="#">내가 쓴 게시물</a></li>
						<li><a id="mycomment" href="#">내가 쓴 댓글</a></li>
					</ul>
				</div>
				<a id="myqna" href="/member/myqna">1:1 문의 내역</a>
				<form action="/member/logout" id="logout-form" method="post">
					<a onclick="document.getElementById('logout-form').submit();">로그아웃</a>
				</form>
			</div>
		</div>
		<!-- 마이페이지 메뉴 끝 -->
		<div class="mypage-content">
			<div class="mypage-edit-title">1:1 문의 내역</div>
			<div class="mypage-edit-container">
				<div class="basic-info">
					<div class="qna-container">
						<div class="qna-title">
							<h3>나의 문의</h3>
						</div>

						<!-- 검색바 -->
						<form method="get" action="/member/myqna">
							<div>
								<select name="searchType">
									<option value="">전체</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="subject">주제</option>
								</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요">
								<button type="submit">검색</button>
							</div>
							<input type="hidden" name="page" value="${searchCriteria.page}"> <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
						</form>
						<!-- 검색바 끝 -->

						<!-- 게시판 -->
						<table class="qna-table">
							<thead>
								<tr>
									<th>번호</th>
									<th>구분</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${board}" var="board">
									<tr>
										<td class="qna-id">${board.boardId}</td>
										<td class="qna-subject">[${board.subject}]</td>
										<td class="qna-title"><a href="/member/myqna?page=${board.boardId}">${board.title}</a></td>
										<td class="qna-writer">${board.writer}</td>
										<td class="qna-date"><fmt:formatDate value="${board.writeDate}" pattern="yyyy.MM.dd" /></td>
										<td class="qna-status <c:if test="${board.isAnswered == true}">answered</c:if>"><c:if test="${board.isAnswered == false}">처리중</c:if> <c:if test="${board.isAnswered == true}">답변완료</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 게시판 끝 -->
					</div>

					<!-- 페이징 -->
					<div class="page-container">
						<c:if test="${pageMaker.prev}">
							<a class="page-group-btn" href="/member/myqna?page=${pageMaker.startPage - 1}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"> <i class="fa-solid fa-chevron-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
							<c:choose>
								<c:when test="${page eq searchCriteria.page}">
									<a class="currentPage">${page}</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/member/myqna?page=${page}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}">${page}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a class="page-group-btn" href="/member/myqna?page=${pageMaker.endPage + 1}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"><i class="fa-solid fa-chevron-right"></i></a>
						</c:if>
					</div>
					<!-- 페이징 끝 -->
				</div>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function() {
			// 뒤로가기 버튼
			$(".btn__cancel").click(function() {
				history.back();
			});

			// 회원가입 버튼
			$(".btn__sign-up").click(function() {
				$(location).attr("href", "/member/sign-up");
			});

			// 하단 팝업
			$(".pop-up__bottom").show(function() {
				$(this).delay(700).fadeOut(2000);
			});

			$(".imgModBtn").on("click", function() {
				var file = $("#file").val();
				if (file == "") {
					alert("파일을 선택해주세요.");
					return;
				}
				$("#userImageForm").submit();
			});
		});
	</script>
</body>
</html>