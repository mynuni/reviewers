<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>#리뷰어스</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

	<!-- BootStrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
  <!-- Vendor CSS Files -->
  
  <link href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/quill/quill.snow.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/quill/quill.bubble.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/remixicon/remixicon.css"/>" rel="stylesheet">
  <link href="<c:url value="/resources/assets/vendor/simple-datatables/style.css"/>" rel="stylesheet">
  
  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/assets/css/style.css"/>" rel="stylesheet">
  <!-- JS LINK -->
 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
      <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"/>
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<script type="text/javascript" src="<c:url value="/resources/main.js"/>"></script>

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style type="text/css">
  
  .login{
    display: none;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, 80%);
    font-family: 'Noto Sans KR', sans-serif;
    font-size:14px;
    background-color: rgb(251, 247, 242);
    line-height: 1.5em;
    color : #222;
    margin: 0;
   
    
}
.modal-content{
	border-radius: 15px;
background-color: rgb(251, 247, 242); 
}


.modal-content a{
    text-decoration: none;
    color: #222;
}



.login{
    border-radius: 10px;
}

/*member sign in*/
.member{
    width: 400px;
    /* border: 1px solid #000; */
    margin: auto; /*중앙 정렬*/
    padding: 0 20px;
     
    margin-bottom: 20px;
      text-align: center;
	display:block;
	color:coral;
	padding : 15px;
}

.member .logo{
    /*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
    display: block;
    margin :50px auto;
}

.member .field{
    margin :5px 0; /*상하로 좀 띄워주기*/
}

.member b{
    /* border: 1px solid #000; */
    display: block; /*수직 정렬하기 */
    margin-bottom: 5px;
}

/*input 중 radio 는 width 가 100%면 안되니까 */
.member input:not(input[type=radio]),.member select{
    border: 1px solid #dadada;
    padding: 15px;
    width: 100%;
    margin-bottom: 5px;
    border-radius: 10px;
}

.member input[type=submit]{
    margin-top: 10px;
}

.member input[type=button],
.member input[type=submit]{
font-size: 18px;
border-radius: 10px;
background-color: coral;
color:#fff
}

.member-footer a{
    font-size: 13px;
}

.member input:focus, .member select:focus{
    border: 1px solid #2db400;
}

.field.birth div{ /*field 이면서 birth*/
    display: flex;
    gap:10px; /*간격 벌려줄때 공식처럼 사용핟나 */
}

/* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌 
    flex:1;
} */

.field.tel-number div {
    display: flex;
}

.field.tel-number div input:nth-child(1){
    flex:2;
}

.field.tel-number div input:nth-child(2){
    flex:1;
}

.field.gender div{
    border: 1px solid #dadada;
    padding: 15px 5px;
    background-color: #fff;
}

.placehold-text{
    display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
    position:relative;
    /* border: 1px solid #000; */
}

.placehold-text:before{ 
    content : "";
    position:absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
    right : 20px;
    top:13px;
    pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
}

.userpw{
    background:url(./images/images2/icon-01.png) no-repeat center right 15px;
    background-size: 20px;
    background-color: #fff;
}

.userpw-confirm{
    background:url(./images/images2/icon-02.png) no-repeat center right 15px;
    background-size: 20px;
    background-color: #fff;
}

.member-footer {
    text-align: center;
    font-size: 12px;
    margin-top: 20px;
}

.member-footer div a:hover{
    text-decoration: underline;
    color:#2db400
}

.member-footer div a:after{
    content:'|';
    font-size: 10px;
    color:#bbb;
    margin-right: 5px;
    margin-left: 7px;
    /*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
    display: inline-block;
    transform: translateY(-1px);

}

.member-footer div a:last-child:after{
    display: none;
}

border-radius: 15px;
    background-color: rgb(251, 247, 242);
@media (max-width:768px) {
    .member{
        width: 100%;
    }
}
     .item img{
      display: inline-block;
    width: 250px;
    margin-left: 2%;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
     }
     
     .item {
    display: inline-block;
    width: 250px;
    margin-top: 40px;
    margin-left: 2%;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
    boder-radius:25px;
}
     
     .item .image {
    width: 100%;
    height: 200px;
    background-color: #ddd;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-size: cover;
    
}

.item .cont {
    padding: 20px;
}

.item strong {
    display: block;
    margin: 0 0 10px 0;
    font-size: 16px;
    letter-spacing: -1px;
}

.item p {
    font-size: 13px;
    letter-spacing: -1px;
}

 .item a {
    display: inline-block;
    margin-top: 10px;
    padding: 5px 10px;
    background: #eee;
    font-size: 13px;
    letter-spacing: -1px;
}

.item a:hover {
    background: #325cb2;
    color: #fff;
}
     
     img {
        width: 100%;
        height: 100%;
        border-radius: 25px;
       
      }
      .slider {
        width: 80%;
        height : 15%;
        margin: 0px auto;
        margin-left:270px;
      }
      .slider .slick-slide {
        margin: 10px;
      }
      .slick-prev:before, .slick-next:before {
        color: #444444;
      }
      select{
     	margin-left:20px;

 		font-family: "Noto Sansf KR", sans-serif;
		font-size: 1rem;
		font-weight: 400;
		line-height: 1.5;
		
		color: #444;
		background-color: #fff;
		
		padding: 0.6em 1.4em 0.5em 0.8em;
		
		border: 1px solid #aaa;
		border-radius: 0.5em;

      }
      #header{
      	 padding-right: 15px;
      }
   </style>
  
</head>
    <script>
      $( document ).ready( function() {
    	  
    	
    	  
        $( '.slider' ).slick( {
          autoplay: true,
          autoplaySpeed: 5000,
          slidesToShow: 5,
          slidesToScroll: 3,
        } );
      } );
      
  
    </script>


<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="testMovie.do?type=movie" class="logo d-flex align-items-center">
        <span class="d-none d-lg-block">#Reviewers</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

	<div>
	
    <div class="search-bar">
      <form class="search-form d-flex align-items-center" action="search.do" id="searchHeader">
        <input type="search" id="searchKeyword" name="searchKeyword">
        <button type="submit" value="search"><i class="bi bi-search"></i></button>
      
      <select id="SC" name="SC">
		<option value="movie">영화</option>
		<option value="tv">TV</option>
		<option value="review">리뷰</option>
		<option value="tag">태그</option>
		<option value="SearchId">아이디검색</option>
	</select>
      </form>
	
    </div>
    </div>
    <!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
        <!-- 검색 클릭 버튼 -->
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->



        <li class="nav-item dropdown pe-3">
		<c:choose>
				<c:when test="${User.userId  eq null }">
					<!-- Button trigger modal -->
					<button type="button" class="btn" data-toggle="modal"
						data-target="#exampleModalCenter">로그인</button>
								<button type="button" onclick="location.href='sign_up.jsp'">회원가입</button>
				</c:when>
				<c:otherwise>
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${UserInfo.nickname }</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${User.userId }</h6>
              <span>${UserInfo.nickname }</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>내 프로필</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>계정 설정</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>도움말</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="logout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그 아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->
     </c:otherwise>
			</c:choose>
      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="testMovie.do?type=movie">
          <i class="bi bi-grid"></i>
          <span>메인 페이지</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>컨텐츠 리뷰</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="getBoardList.do?boardnum=1">
              <i class="bi bi-circle"></i><span>영화</span>
            </a>
          </li>
          <li>
            <a href="getBoardList.do?boardnum=2">
              <i class="bi bi-circle"></i><span>TV프로그램</span>
            </a>
          </li>
          <li>
            <a href="getBoardList.do?boardnum=3">
              <i class="bi bi-circle"></i><span>웹툰</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>커뮤니티</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>업데이트 예정</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>업데이트 예정</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>업데이트 예정</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>업데이트 예정</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>인기 리뷰</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>인기 리뷰</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>마이페이지</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-faq.html">
          <i class="bi bi-question-circle"></i>
          <span>F.A.Q</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-login.html">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>로그인</span>
        </a>
      </li><!-- End Login Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->
  
  
  
  
  
  
  
   <main id="main" class="main">
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
	
    <!-- 인기영화 슬라이드 코드 -->
  <div>
  <h2 style="margin-left:270px; margin-top: 100px;">인기 영화</h2>
    <div class="slider">
     <c:forEach var="release_date" begin="0" end="19" step="1" items="${release_date}">
      <div><img src="${release_date.poster_path }" onClick="location.href='ContentsDetail.do?type=${release_date.contents_type }&id=${release_date.contents_num }'">
      <div>${release_date.title }</div>
      </div>
     </c:forEach>
    </div>
    </div>
    
    <hr>
    
    <div>

    	<h2 style="margin-left:270px; ">인기 리뷰</h2>
    	<div class="slider">
    	<c:forEach var="board" items="${boardList }">
    			<li class="item item1">
                    <div class="image"><img src="<c:url value="/resources/images/${board.filename }"/>"></div>
                    <div class="cont">
                        <strong>${ board.title }</strong>
                        <p>${board.content }</p>
                        <p>작성자:${board.nickname }</p>
                        <p>추천:${board.like_num} &nbsp&nbsp 비추:	 ${board.unlike_num}</p>
                        <a href="#">바로가기</a>
                    </div>
         
 				</c:forEach>
    	</div>
    </div>
    
    
   <!-- 인기영화 슬라이드 끝 -->

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Sales',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: 'Revenue',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: 'Customers',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->

            

            

          

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                    legend: {
                      data: ['Allocated Budget', 'Actual Spending']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Allocated Budget'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Actual Spending'
                        }
                      ]
                    }]
                  });
                });
              </script>

            

          

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              </script>

            

         

      </div>
    </section>

  </main><!-- End #main -->
  
  
  
  
  
  
  
  
  
  
  
  
  

  

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <!-- <script src="<c:url value="/resources/assets/vendor/apexcharts/apexcharts.min.js"/>"></script> -->
  <script src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
  <script src="<c:url value="/resources/assets/vendor/chart.js/chart.umd.js"/>"></script>
  
  <!-- <script src="<c:url value="/resources/assets/vendor/echarts/echarts.min.js"/>"></script> -->
  
  <script src="<c:url value="/resources/assets/vendor/quill/quill.min.js"/>"></script>
  <script src="<c:url value="/resources/assets/vendor/simple-datatables/simple-datatables.js"/>"></script>
  <script src="<c:url value="/resources/assets/vendor/tinymce/tinymce.min.js"/>"></script>
  <script src="<c:url value="/resources/assets/vendor/php-email-form/validate.js"/>"></script>
  
   <script src="<c:url value="/resources/assets/js/main.js"/>"></script>



    

</body>
</html>