<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/myqna/write" method="post" enctype="multipart/form-data">
		<input type="hidden" name="writerId" value="${member.userId}" readonly>
		<input type="text" name="writer" value="${member.userName}" readonly>
		<div>
			<label for="subject">Subject</label>
			<input type="text" class="form-control" id="subject" name="subject" required>
		</div>
		<div>
			<label for="title">Title</label>
			<input type="text" class="form-control" id="title" name="title" required>
		</div>
		<div>
			<label for="content">Content</label>
			<textarea class="form-control" id="content" name="content" rows="5" required></textarea>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>