<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />
		<div class="mypage-content">
			<div class="mypage-edit-title">회원정보수정</div>
			<div class="mypage-edit-container">
				<form action="/mypage/edit" method="post">
					<div class="basic-info">
						<div class="basic-info-title"> 기본 정보<i class="fa-solid fa-circle-info"></i>
						</div>
						<div class="userId-input-container">
							<div class="edit-input-title">아이디</div>
							<div>${User.userId}</div>
							<button type="button" class="edit-input-btn edit-input-btn__cancel">변경불가</button>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">이름(실명)</div>
							<input type="text" name="name" id="realName" value="${User.name}" readonly>
							<input type="hidden" id="currentRealName" value="${User.name}">
							<button id="changeRealName-btn" class="edit-input-btn" type="button">이름 변경</button>
							<button id="changeRealName-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">닉네임</div>
							<input type="text" name="nickname" id="userName" value="${User.nickname}" readonly>
							<input type="hidden" id="currentName" value="${User.nickname}">
							<div class="nameDuplicateCheck" id="nameDuplicateCheck"></div>
							<button id="changeUserName-btn" class="edit-input-btn" type="button">닉네임 변경</button>
							<button id="changeUserName-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userPw-input-container">
							<div class="edit-input-title">비밀번호</div>
							<i class="fa-solid fa-lock"></i>
							<button class="changePw-btn edit-input-btn" type="button">비밀번호 변경</button>
							<button id="changePw-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="changePw-form">
							<div class="newPw-wrap">
								<div class="edit-input-title edit-input-title__newPw">새 비밀번호</div>
								<input name="password" type="password" class="userPw"><br>
							</div>
							<div class="newPw-wrap newPw-wrap__check">
								<div class="edit-input-title edit-input-title__newPw">비밀번호 확인</div>
								<input name="confirmPw" type="password" class="confirmPw"><br>
								<div class="pwCheck"></div>
							</div>
						</div>
					</div>
					<div class="basic-info">
						<div class="basic-info-title">추가 정보<i class="fa-regular fa-square-plus"></i></div>
						<div class="userName-input-container">
							<div class="edit-input-title">전화번호</div>
							<input type="text" name="tel" id="tel" value="${User.tel}" readonly>
							<input type="hidden" id="currentTel" value="${User.tel}">
							<button id="changeTel-btn" class="edit-input-btn" type="button">전화번호 변경</button>
							<button id="changeTel-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="email-input-container">
							<div class="edit-input-title">이메일</div>
							<input type="text" name="email" id="email" value="${User.email}" readonly>
							<input type="hidden" id="currentEmail" value="${User.email}">
							<button id="changeEmail-btn" class="changeEmail-btn edit-input-btn" type="button">이메일 변경</button>
							<button id="changeEmail-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="changeEmail-form">
							<div class="newEmail-wrap newEmail-wrap__newEmail">
								<div class="edit-input-title edit-input-title__newPw">새 이메일 주소</div>
								<input name="text" type="password" class="userPw"><br>
								<button id="changeEmail-btn" class="changeEmail-btn sendAuthNum-btn edit-input-btn" type="button">인증번호 전송</button>
							</div>
							<div class="newEmail-wrap">
								<div class="edit-input-title edit-input-title__newPw">인증번호</div>
								<input name="confirmPw" type="text" class="confirmPw"><br>
								<button id="changeEmail-btn" class="changeEmail-btn checkAuthNum-btn edit-input-btn" type="button">인증번호 확인</button>
							</div>
						</div>
						<div class="userId-input-container">
							<div class="edit-input-title">나이</div>
							<input type="text" name="birth" id="userTel" value="${User.birth}" readonly>
							<button type="button" class="edit-input-btn edit-input-btn__cancel">변경불가</button>
						</div>
					</div>
					<div class="edit-input-btn-container">
						<button class="edit-input-btn edit-input-btn__cancel" type="submit">취소</button>
						<button id="editSubmitBtn" class="edit-input-btn edit-input-btn__save" type="submit">변경사항 저장</button>
					</div>
					<input type="hidden" name="userId" id="userId" value="${User.userId}">
				</form>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(function(){
		// 정보 변경 취소 시 세션의 저장된 값으로 세팅
		$('#changeUserName-btn').click(
				function() {
					$('#userName').prop('readonly', false).css(
							'background-color', '#fff');
					$(this).hide();
					$('#changeUserName-cancel-btn').show();
				});

		$('#changeUserName-cancel-btn').click(
				function() {
					$('#userName').val('${User.nickname}').attr('readonly', 'readonly');
					$(this).hide();
					$('#changeUserName-btn').show();
					$('#nameDuplicateCheck').text('');
					$("#userName").css("outline", "1px solid lightgrey");
				});
		
		$('#changeTel-btn').click(
				function() {
					$('#tel').prop('readonly', false).css(
							'background-color', '#fff');
					$(this).hide();
					$('#changeTel-cancel-btn').show();
				});

		$('#changeTel-cancel-btn').click(
				function() {
					$('#tel').val('${User.tel}').attr('readonly', 'readonly');
					$(this).hide();
					$('#changeTel-btn').show();
					$("#tel").css("outline", "1px solid lightgrey");
				});
		
		$('#changeRealName-btn').click(
				function() {
					$('#realName').prop('readonly', false).css(
							'background-color', '#fff');
					$(this).hide();
					$('#changeRealName-cancel-btn').show();
				});

		$('#changeRealName-cancel-btn').click(
				function() {
					$('#realName').val('${User.name}').attr('readonly', 'readonly');
					$(this).hide();
					$('#changeRealName-btn').show();
					$("#realName").css("outline", "1px solid lightgrey");
				});
		
		$('#changeEmail-btn').click(
				function() {
					$(this).hide();
					$('#changeEmail-cancel-btn').show();
				});

		$('#changeEmail-cancel-btn').click(
				function() {
					$('#email').val('${User.email}').attr('readonly', 'readonly');
					$(this).hide();
					$('#changeEmail-btn').show();
					$("#email").css("outline", "1px solid lightgrey");
				});
		
	});
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