<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<script type="text/javascript">

//<![CDATA[

$(function() {

    var availableCity = ["서울","부산","대구","광주","울산"]; 

    $("#city").autocomplete({

        source: availableCity,

        select: function(event, ui) {

            console.log(ui.item);

        },

        focus: function(event, ui) {

            return false;

            //event.preventDefault();

        }

    });

});

//]]>
$(document).ready(function() {
let select = document.getElementById("SC");
let sel = select.value; 
select.addEventListener("change", function(e) {
    console.log("onchange select", e.target.value);
    select = e.target.value;
    console.log(" select",sel);
    sel = e.target.value;
    //alert(select);
		//값이 바뀔때마다 찍힘
});
let cnt = document.getElementById("Test");
cnt.addEventListener("click",function(){
	console.log(" select",sel);
	alert(select);
})
function test() {
	
	 console.log(" select",sel);
}
});
</script>

<form action="upload_ok.do" method="post" enctype="multipart/form-data">
		파일 선택 : <input type="file" name="file">
		<input type ="text" name = "UserId" id = "UserId">
		<input type="submit" value="전송">
	</form>

	<a href="test.do">test</a>
	
	  <select id="SC" name="SC" >
		<option value="movie">영화</option>
		<option value="tv">TV</option>
		<option value="review">리뷰</option>
		<option value="tag">태그</option>
		<option value="SearchId">아이디검색</option>
	</select>
	<button id = "Test">a</button>
	


<div class="ui-widget">

  <label for="city">도시: </label>

  <input id="city">

</div>
</body>
</html>