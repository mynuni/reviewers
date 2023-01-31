<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 회원가입 폼 따기</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<link href="<c:url value="/resources/findId.css" />" rel="stylesheet">

<script type="text/javascript" src="<c:url value = "/resources/Find.js" />"></script>
</head>
<body>
<script type="text/javascript">

</script>
<form action="upload_ok.do" method="post" enctype="multipart/form-data" id = "frm">
<div class="member">
       <!-- 1. 로고 -->
        <h1>#REVIEWERS</h1>

  
     

        <div class="field tel-number">
            <b>프로필 사진</b>
           
            <label>파일 선택</label>
		<input type="file" name="profile" id = "profile" onchange="readURL(this)">
		<img id="preview" style="
    width: 300px;
    height: 300px;
    border-radius: 50%;
"/>
		
						
        </div>
     
        <div class="field tel-number">
            <b>본인 소개</b>
            
            <div>
                <textarea rows="3" cols="50" name = "info" id = "info"></textarea>
            </div>
           
            
        </div>

        <!-- 5. 이메일_전화번호 -->
        
    

        <!-- 6. 가입하기 버튼 -->
         <input type="submit" value="아이디 찾기" id="joinbutton">
          <input type="submit" value="메인페이지로 바로가기" id="joinbutton">
        <!-- 7. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">업데이트예정</a>
                <a href="#none">업데이트예정</a>
                <a href="#none">업데이트예정</a>
            </div>
            <span><a href="#none">REVIEWERS TEAM</a></span>
        </div>
    </div>

	
	
</form>
  	      <script type="text/javascript">
  	    function readURL(input) {
  	      if (input.files && input.files[0]) {
  	        var reader = new FileReader();
  	        reader.onload = function(e) {
  	          document.getElementById('preview').src = e.target.result;
  	        };
  	        reader.readAsDataURL(input.files[0]);
  	      } else {
  	        document.getElementById('preview').src = "";
  	      }
  	    }
	</script>

</body>
</html>