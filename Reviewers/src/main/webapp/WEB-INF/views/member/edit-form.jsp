<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<style>
	.changePw-form{
		display: none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<img src="${pageContext.servletContext.contextPath}${member.userImg}" alt="이미지 없음" id="preview">
	<form action="/member/file-upload" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" id="imageFile">
		<button type="submit">사진변경</button>
	</form>
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
	$(function() {
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
	  
	  
	  $("#imageFile").on("change", function(event) {

		    var file = event.target.files[0];

		    var reader = new FileReader(); 
		    reader.onload = function(e) {

		        $("#preview").attr("src", e.target.result);
		    }

		    reader.readAsDataURL(file);
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