<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	img{
		width:500px;
		height: 450px;
	}
</style>
</head>
<body>
<h1>${info.overview }</h1>
<h1>${info.title }</h1>
<h1>${info.genres }</h1>
<h1>${info.runtime }</h1>
 <div><img src="${info.poster_path }"></div>
 <div><img src="${info.backdrop_path }"></div>
</body>
</html>