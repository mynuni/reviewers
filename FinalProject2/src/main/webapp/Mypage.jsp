<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Logo -->
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- CSS -->
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/login.css" />" rel="stylesheet"> 
</head>
<style>
<!--

--><style>
      * {
      margin: 0;
      padding: 0;
}

a {
      text-decoration: none;
      color: black;
}

li {
      list-style: none;
}

.title {
      padding: 0;
      margin: 0;
      display: block;
      color: coral;
      font-size: 28px;
      font-weight: 900;
      margin-bottom: 20px;
}

.menu{
      display: inline-block;
      border: 1px solid lightgrey;
      width: 180px;
      margin-bottom: 200px;
      background-color: white;
}

.menu li{
      border-bottom: 1px solid lightgrey;
      padding: 12px;
}

.menu li i{
      padding-right: 8px;
}


.menu li a{
      padding-left: 10px;
      color: rgba(0, 0, 0, 0.7);
}

.basic-info {
      border-left: 5px solid coral;
}

.user-info{
      border: 1px solid lightgrey;
      display: block;
      width: 180px;
      margin-bottom: 30px;
      border-radius: 15px;
      background-color: white;
}

.user-info-inner {
      padding: 18px;
      text-align: center;
}

.user-info-inner i{
      font-size: 80px;
      color: rgba(0, 0, 0, 0.5);
      margin-bottom: 10px;
}

.container{
      margin: 100px;
      display: inline-block;
      padding: 50px;
      padding-top: 20px;
      border: 1px solid lightgrey;
      background-color: rgb(251, 247, 242);
      border-radius: 15px;
      width: 1200px;
}

.user-info-inner i{
      color: rgba(0, 0, 0, 0.4);
      font-size: 80px;
}
</style>
</style>
<body>
          <header>
           <nav2 class="navbar">
                  <div class="navbar_logo1">
                        <div>#리뷰어스</div>
                  </div>
                  <div class="navbar_search">
                        <input type="text">
                        <i class="fa-solid fa-magnifying-glass"></i>
                  </div>
                  <div class="navbar_button">
                  <c:choose>
                  	<c:when test="${User.userId  eq null }">
                  	                 <!-- Button trigger modal -->
<button type="button" class="btn" data-toggle="modal" data-target="#exampleModalCenter">
 로그인
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
   
      <div class="modal-body">
         <div class="member">
         <form action="login.do" method = "post">
                <h2>#REVIEWERS</h2>
                <h1>로그인</h1>
                <div class="field">
                    <b>아이디</b>
                    <span class="placehold-text"><input type="text" id = "UserId" name = "UserId" ></span>
                </div>
                <div class="field">
                    <b>비밀번호</b>
                    <input class="userpw" type="password" id="password" name = "password">
                </div>
                <input type="submit" value="로그인">
                <div class="member-footer">
                    <hr>
                    <div>
                        <a href="sign_up.jsp">회원가입</a>
                        <a href="findId.jsp">아이디 찾기</a>
                        <a href="updatePassword.jsp">비밀번호 찾기</a>
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
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">메인</span>
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
                    <a href="#" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">커뮤니티</span>
                    </a>


                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">인기리뷰</span>
                    </a>


                    <a href="#" class="nav__link">
                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">마이페이지</span>
                    </a>
                </div>
                <a href="logout.do" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">로그아웃</span>
                </a>
            </div>
        </nav>
    </div>
       <main>
            <div class="container">
                  <p class="title">마이페이지</p>
            <div class="user-info">
                  <div class="user-info-inner">
                        <i class="fa-solid fa-circle-user"></i>
                        <p>${UserInfo.nickname } 님</p>
                        <p>${User.name } </p>
                  </div>
            </div>
            <ul class="menu">
                  <li class="basic-info"><a href="#" style="font-weight: 600; color: coral;"><i class="fa-solid fa-user"></i><span> 기본 정보</span></a></li>
                  <li><a href="#"><i class="fa-solid fa-user-gear"></i><span>계정 관리</span></a></li>
                  <li><a href="#"><i class="fa-solid fa-heart"></i><span> 관심 컨텐츠</span></a></li>
                  <li><a href="#"><i class="fa-solid fa-star"></i><span> 평가한 컨텐츠</span></a></li>
                  <li><a href="#"><i class="fa-regular fa-pen-to-square"></i><span> 내가 쓴 게시글</span></a></li>
                  <li><a href="#"><i class="fa-regular fa-circle-question"></i><span> 고객센터</span></a></li>
                  <li style="border-bottom: none;"><a href="#"><i class="fa-solid fa-arrow-right-from-bracket" ></i> 로그아웃</a></li>
            </ul>
      </div>
</main>
   <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script type="text/javascript" src="<c:url value="/resources/main.js"/>"></script>
 
</body>
</html>