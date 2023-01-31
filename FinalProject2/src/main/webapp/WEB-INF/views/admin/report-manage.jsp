<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Logo -->
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!-- CSS -->
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/login.css" />" rel="stylesheet">
</head>
<style>
<!--

-->
#reportTable{
    width: 80%;
    margin: auto;
   
}
body{
    background-color: rgb(251, 247, 242);
}
</style>
<body>
	<header>
		<nav2 class="navbar">
		<div class="navbar_logo1">
			<div>#리뷰어스</div>
		</div>
		<div class="navbar_search">
			<input type="text"> <i class="fa-solid fa-magnifying-glass"></i>
		</div>
		<div class="navbar_button">
			<c:choose>
				<c:when test="${User.userId  eq null }">
					<!-- Button trigger modal -->
					<button type="button" class="btn" data-toggle="modal"
						data-target="#exampleModalCenter">로그인</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">

								<div class="modal-body">
									<div class="member">
										<form action="login.do" method="post">
											<h2>#REVIEWERS</h2>
											<h1>로그인</h1>
											<div class="field">
												<b>아이디</b> <span class="placehold-text"><input
													type="text" id="UserId" name="UserId"></span>
											</div>
											<div class="field">
												<b>비밀번호</b> <input class="userpw" type="password"
													id="password" name="password">
											</div>
											<input type="submit" value="로그인">
											<div class="member-footer">
												<hr>
												<div>
													<a href="sign_up.jsp">회원가입</a> <a href="findId.jsp">아이디
														찾기</a> <a href="updatePassword.jsp">비밀번호 찾기</a>
												</div>
											</div>
										</form>
									</div>

								</div>

							</div>
						</div>
					</div>

					<button type="button" onclick="location.href='sign_up.jsp'">회원가입</button>
				</c:when>
				<c:otherwise>
            	${UserInfo.nickname }
            	
            </c:otherwise>
			</c:choose>
		</nav2>
	</header>

	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="" class="nav__logo">로그인 해주세요</a>
				</div>
				<div class="nav__list">
					<a href="#" class="nav__link active"> <ion-icon
							name="home-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">메인</span>
					</a>
					<div href="#" class="nav__link collapse">
						<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">컨텐츠</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

						<ul class="collapse__menu">
							<a href="#" class="collapse__sublink">Movie</a>
							<a href="#" class="collapse__sublink">TV</a>
							<a href="#" class="collapse__sublink">WebToon</a>
						</ul>
					</div>
					<a href="#" class="nav__link"> <ion-icon
							name="chatbubbles-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">커뮤니티</span>
					</a> <a href="#" class="nav__link"> <ion-icon
							name="pie-chart-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">인기리뷰</span>
					</a> <a href="Mypage.jsp" class="nav__link"> <ion-icon
							name="settings-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">마이페이지</span>
					</a>
				</div>
				<a href="logout.do" class="nav__link"> <ion-icon
						name="log-out-outline" class="nav__icon"></ion-icon> <span
					class="nav_name">로그아웃</span>
				</a>
			</div>
		</nav>
	</div>
	<div id = "reportTable">
	<form action="reportSeach">
	<label>게시판 검색</label>
	<input type = "text">
	<input type = "submit" value ="검색하기">
	</form>
	<table class="table" >
	
  <thead>
  	 	
    <tr class = "table-secondary">
    	
      <th scope="col">신고된 게시글 번호</th>
      <th scope="col">신고된 아이디</th>
      <th scope="col">신고된 게시판</th>
      <th scope="col">신고 글</th>
      <th scope="col">신고 사유</th>
      <th scope="col">삭제 </th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items = "${boardList }" var = "list">
    <tr>
      <th scope="row">${list.RN }</th>
      <td>${list.targetID }</td>
      <input type ="hidden" value = "${list.tableNum }" id = "${list.tableNum }">
      <td id = "table${list.tableNum }">${list.value }</td>
      <td id = ${list.tableNum }><a href = "getboard.do?seq=${list.seq }">내용보기</a></td>
       <td><a href = "javascript:void(0);onclick:window.open('getReportDetail.do?seq=${list.seq }', '신고 상세정보', 
           'width=500, height=700, scrollbars=yes,resizable=no');">사유보기</a></td>
      <td><button id="mail-Check-Btn">수정</button></td>
    </tr>
    
    </c:forEach>
    
    
  </tbody>
</table>
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item paginate_button previous">
				<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
			</li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
			<li class="page-item paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
				<a class="page-link" href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="page-item paginate_button next">
				<a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
			</li>
		</c:if>
	</ul>
</div>
<form id='pageForm' action="getReviewReport.do" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	<input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.cri.searchCondition }"/>'> 
	<input type='hidden' name='searchKeyword'	value='<c:out value="${ pageMaker.cri.searchKeyword }"/>'>
</form>

<a href="insertBoard.jsp"><spring:message code="message.board.list.link.insertBoard" /></a>
<script>
	$(function(){
		$(".paginate_button a").on("click",
			function(e) {
				e.preventDefault();
//				console.log('click');
				$("#pageForm").find("input[name='pageNum']").val($(this).attr("href"));
				$("#pageForm").submit();
			}
		);
	});
</script>

</div>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script type="text/javascript"
		src="<c:url value="/resources/main.js"/>"></script>

</body>
</html>