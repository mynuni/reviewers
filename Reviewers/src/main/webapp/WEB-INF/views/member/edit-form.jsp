<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<style>
.changePw-form {
	display: none;
}

.mypage-container {
	display: flex;
}

.mypage-container a {
	text-decoration: none;
	color: rgba(0, 0, 0, 0.75);
}

.mypage-menu {
	width: 200px;
	background-color: #f2f2f2;
}

.mypage-menu__info {
	background-color: #f2f2f2;
	text-align: center;
	padding: 20px;
}

.profile-img-wrap {
	position: relative;
	display: inline-block;
	margin-bottom: 10px;
}

.profile-img {
	background-color: white;
	border-radius: 50%;
	width: 120px;
	height: 120px;
}

.file-input {
	display: none;
}

.file-label:hover {
	background-color: #0084d4;
}

.file-selected {
	margin-top: 8px;
	font-size: 12px;
}

.profile-info__name {
	font-size: 18px;
	font-weight: 600;
}

.profile-info__id {
	font-size: 14px;
}

.image-container {
	position: relative;
	display: inline-block;
}

.image-container i {
	position: absolute;
	bottom: 0;
	right: 0;
	color: rgba(0, 0, 0, 0.65);
	background-color: lightgrey;
	padding: 8px;
	border-radius: 50%;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
	cursor: pointer;
}

.fileUpload-btn {
	border: none;
	background-color: coral;
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
	cursor: pointer;
	margin-top: 5px;
}

.fileUpload-cancel-btn {
	border: none;
	background-color: rgba(165, 165, 165, 1);
	color: white;
	border-radius: 5px;
	padding: 5px 10px;
	cursor: pointer;
	margin-top: 5px;
}

.mypage-menu__list a {
	text-decoration: none;
	display: block;
	cursor: pointer;
	padding: 15px 30px;
	font-size: 16px;
	font-weight: 600;
}

.mypage-menu__list a:hover {
	border-left: 3px solid coral;
	color: coral;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div class="mypage-container">
		<div class="mypage-menu">
			<div class="mypage-menu__info">
				<div class="profile-img-wrap">
					<c:choose>
						<c:when test="${member.userImg != null}">
							<div class="image-container">
								<img
									src="${pageContext.servletContext.contextPath}${member.userImg}"
									id="preview" class="profile-img"> <label for="imageFile"
									class="file-label" id="file-label"><i
									class="fas fa-camera"></i></label>
							</div>
						</c:when>
						<c:otherwise>
							<div class="image-container">
								<img
									src="${pageContext.servletContext.contextPath}/resources/emptyUserImg.png"
									id="preview" class="profile-img"> <label for="imageFile"
									class="file-label" id="file-label"><i
									class="fas fa-camera"></i></label>
							</div>
						</c:otherwise>
					</c:choose>
					<form id="fileUploadForm" action="/member/file-upload"
						method="post" enctype="multipart/form-data">
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
				<a href="/mypage/home">마이페이지 홈</a>
				<a href="/mypage/update">회원정보수정</a>
				<a href="/mypage/update">나의 활동</a>
				<a href="/mypage/inquiry">1:1 문의 내역</a> <a href="/logout">로그아웃</a>
			</div>
		</div>
		<div class="mypage-content">컨텐츠 영역</div>
	</div>
		<input type="hidden" name="userId" id="userId" value="${member.userId}">
	
	<form action="/member/edit" method="post">
	    <div>
		    <label for="userId">아이디:</label>
			<input type="text" name="userId" value="${member.userId}">
	    </div>
		<button class="changePw-btn" type="button">비밀번호 변경</button>
		<div class="changePw-form">
		    <label for="userPw">새 비밀번호:</label>
		    <input name="userPw" type="password" class="userPw"><br>
		    <label for="confirmPw">새 비밀번호 확인:</label>
		    <input name="confirmPw" type="password" class="confirmPw"><br>
		    <span class="pwCheck"></span>
		</div>
	    <div>
		    <label for="userName">닉네임:</label>
			<input type="text" name="userName" value="${member.userName}">
	    </div>
		<button class="cancel-btn" type="button">취소</button>
		<button class="edit-btn" type="submit">수정</button>
		<button class="withdraw-btn" type="button">탈퇴</button>
	</form>

	<script>
		
		// 회원 정보수정 관련 스크립트
		$(function() {
			// 비밀번호 일치 검증
			$(".changePw-btn").click(function() {
				$(".changePw-form").show();
			});

			$('.userPw, .confirmPw').on('keyup', function() {
				if ($('.userPw').val() && $('.confirmPw').val()) {
					if ($('.userPw').val() === $('.confirmPw').val()) {
							$('.pwCheck').text('비밀번호가 일치합니다.').css('color', 'green');
					} else {
						$('.pwCheck').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
					}
						} else {
							$('.pwCheck').empty();
						}
					});
			
			// 파일을 업로드 해야만 변경 버튼이 노출
			$("#submitBtn").hide();
			$("#submitCancelBtn").hide();
			
			var originalImage = $("#preview").attr("src");

			$("#imageFile").change(function() {
				$("#submitBtn").show();
				$("#submitCancelBtn").show();
				
				$("#submitCancelBtn").on("click", function() {
					$("#submitBtn").hide();
					$("#imageFile").val("");
					$("#preview").attr("src", originalImage);
					$("#submitCancelBtn").hide();
				});
			});

			// 업로드 파일 미리보기
			$("#imageFile").on("change", function(event) {
				var file = event.target.files[0];
				var reader = new FileReader();
			
				reader.onload = function(e) {
					$("#preview").attr("src", e.target.result);
				}
			
				reader.readAsDataURL(file);
			});

			// AJAX 닉네임 중복 검사

			// 파일 유무 검증 후 전송
			$('#fileUploadForm').submit(function(e) {
				e.preventDefault();

				var fileInput = document.getElementById('imageFile');
				if (!fileInput.value) {
					alert('변경할 프로필 사진을 추가해주세요.');
					return false;
				}

				var formData = new FormData($(this)[0]);

				$.ajax({
					url : $(this).attr('action'),
					type : $(this).attr('method'),
					data : formData,
					async : false,
					cache : false,
					contentType : false,
					processData : false,
					success : function(data) {
						$("#submitBtn").hide();
						$("#submitCancelBtn").hide();
						alert("프로필 사진이 변경되었습니다.");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("프로필 사진 변경에 실패했습니다.");
					}
				});

				return false;
			});
		});
	</script>
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
			$(".pop-up__bottom").show(function(){
				$(this).delay(700).fadeOut(2000);
			});

			$(".imgModBtn").on("click", function () {
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