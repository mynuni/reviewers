<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/mypage/mypage.css">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<title>리뷰어스 - 마이페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
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
						<input type="file" name="uploadFile" id="imageFile"
							class="file-input">
						<button type="submit" class="fileUpload-btn" id="submitBtn">변경</button>
						<button type="button" class="fileUpload-cancel-btn"
							id="submitCancelBtn">취소</button>
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
					<a href="#" class="myactive-dropdown-toggle">나의 활동 <i
						class="fa fa-plus"></i> <i class="fa fa-minus"></i>
					</a>
					<ul class="myactive-dropdown-list">
						<li><a id="myfavorate" href="#">나의 관심 컨텐츠</a></li>
						<li><a id="mypost" href="#">내가 쓴 게시물</a></li>
						<li><a id="mycomment" href="#">내가 쓴 댓글</a></li>
					</ul>
				</div>
				<a id="myqna" href="#">1:1 문의 내역</a>
				<form action="/member/logout" id="logout-form" method="post">
					<a onclick="document.getElementById('logout-form').submit();">로그아웃</a>
				</form>
			</div>
		</div>
		<div class="mypage-content">
			<div class="mypage-edit-title">회원정보수정</div>
			<div class="mypage-edit-container">
				<form action="/member/edit" method="post">
					<div class="basic-info">
						<div class="basic-info-title">
							기본 정보<i class="fa-solid fa-circle-user"></i>
						</div>
						<div class="userId-input-container">
							<div class="edit-input-title">아이디</div>
							<div>${member.userId}</div>
							<button type="button"
								class="edit-input-btn edit-input-btn__cancel">변경불가</button>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">닉네임</div>
							<input type="text" name="userName" id="userName"
								value="${member.userName}" readonly>
							<div class="nameDuplicateCheck" id="nameDuplicateCheck"></div>
							<button id="changeUserName-btn" class="edit-input-btn"
								type="button">닉네임 변경</button>
							<button id="changeUserName-cancel-btn"
								class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userPw-input-container">
							<div class="edit-input-title">비밀번호</div>
							<i class="fa-solid fa-lock"></i>
							<button class="changePw-btn edit-input-btn" type="button">비밀번호
								변경</button>
							<button id="changePw-cancel-btn"
								class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="changePw-form">
							<div class="newPw-wrap">
								<div class="edit-input-title edit-input-title__newPw">새
									비밀번호</div>
								<input name="userPw" type="password" class="userPw"><br>
							</div>
							<div class="newPw-wrap newPw-wrap__check">
								<div class="edit-input-title edit-input-title__newPw">비밀번호
									확인</div>
								<input name="confirmPw" type="password" class="confirmPw"><br>
								<div class="pwCheck"></div>
							</div>
						</div>
					</div>
					<div class="basic-info">
						<div class="basic-info-title">추가 정보</div>
						<div class="userName-input-container">
							<div class="edit-input-title">전화번호</div>
							<input type="text" name="userTel" id="userTel"
								value="${member.userTel}" readonly>
							<button id="changeUserName-btn" class="edit-input-btn"
								type="button">전화번호 변경</button>
							<button id="changeUserName-cancel-btn"
								class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">이메일 주소</div>
							<input type="text" name="userEmail" id="userEmail"
								value="${member.userEmail}" readonly>
							<button id="changeUserName-btn" class="edit-input-btn"
								type="button">이메일 변경</button>
							<button id="changeUserName-cancel-btn"
								class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userId-input-container">
							<div class="edit-input-title">생년월일</div>
							<fmt:formatDate value="${member.userBirth}"
								pattern="yyyy년 MM년 dd일" type="date" />
							<button type="button"
								class="edit-input-btn edit-input-btn__cancel">변경불가</button>
						</div>
					</div>
					<div class="edit-input-btn-container">
						<button class="edit-input-btn edit-input-btn__cancel" type="submit">취소</button>
						<button class="edit-input-btn edit-input-btn__save" type="submit">변경사항 저장</button>
					</div>
					<input type="hidden" name="userId" id="userId" value="${member.userId}">
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {

			// URI별 메뉴 효과
			var menuLinks = {
				'/member/mypage' : '#mypage',
				'/member/edit' : '#edit',
				'/member/myfavorate' : '#myfavorate',
				'/member/mypost' : '#mypost',
				'/member/mycomment' : '#mycomment',
				'/member/myqna' : '#myqna'
			};
			var link = menuLinks[window.location.pathname];
			if (link) {
				$(link).css({
					'border-left' : '4px solid coral',
					'color' : 'coral'
				});
			}

			// 마이페이지 드롭다운 효과
			$('.myactive-dropdown-toggle').click(function(e) {
				e.preventDefault();
				var dropdownList = $(this).siblings('.myactive-dropdown-list');
				dropdownList.slideToggle(200, function() {
					$(this).toggleClass('active');
				});

				var plusIcon = $(this).find('.fa-plus');
				var minusIcon = $(this).find('.fa-minus');

				if (plusIcon.is(':visible')) {
					plusIcon.hide();
					minusIcon.show();
				} else {
					minusIcon.hide();
					plusIcon.show();
				}

				$(this).toggleClass('active');
			});

		});

		// 정보 변경 취소 시 세션의 저장된 값으로 세팅
		$(function() {
			$('#changeUserName-btn').click(
					function() {
						$('#userName').prop('readonly', false).css(
								'background-color', '#fff');
						$(this).hide();
						$('#changeUserName-cancel-btn').show();
					});

			$('#changeUserName-cancel-btn').click(
					function() {
						$('#userName').val('${member.userName}').attr(
								'readonly', 'readonly');
						$(this).hide();
						$('#changeUserName-btn').show();
						$('#nameDuplicateCheck').text('');
						$("#userName").css("outline", "1px solid lightgrey");
					});
		});

		// 회원 정보수정 관련 스크립트
		$(function() {
			// 비밀번호 일치 검증
			$(".changePw-btn").click(function() {
				$(this).hide();
				$(".changePw-form").css('display', 'block');
				$("#changePw-cancel-btn").show();
			});

			$('#changePw-cancel-btn').click(function() {
				$(this).hide();
				$('.userPw, .confirmPw').val('');
				$('.pwCheck').text("");
				$(".changePw-form").hide();
				$('.changePw-btn').show();
			});

			$('.userPw, .confirmPw').on(
					'keyup',
					function() {
						if ($('.userPw').val() && $('.confirmPw').val()) {
							if ($('.userPw').val() === $('.confirmPw').val()) {
								$('.pwCheck').text('비밀번호가 일치합니다.').css('color',
										'green');
							} else {
								$('.pwCheck').text('비밀번호가 일치하지 않습니다.').css(
										'color', 'red');
							}
						} else {
							$('.pwCheck').empty();
						}
					});

			// 닉네임 중복검사
			$("#userName").keyup(function() {
				checkNameDuplicate();
			});

			function checkNameDuplicate() {
				var userName = $("#userName").val();
				$.ajax({
					url : "/member/checkNameDuplicate",
					type : "POST",
					data : {
						userName : userName
					},
					success : function(result) {
						if (result) {
							  $("#nameDuplicateCheck").text("사용 가능한 닉네임입니다.").css("color", "green");
							  $("#userName").css("outline", "1px solid green");
							} else {
							  $("#nameDuplicateCheck").text("이미 존재하는 닉네임입니다.").css("color", "red");
							  $("#userName").css("outline", "1px solid red");
							}
					},
					error : function() {
						$("#nameDuplicateCheck").text("서버와 통신 오류가 발생했습니다.");
					}
				});
			}

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