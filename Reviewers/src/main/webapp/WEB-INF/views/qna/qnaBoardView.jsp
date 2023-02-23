<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<div>
보드ID:${board.boardId}
  <h2>${board.title}</h2>
  <p>${board.content}</p>
  <p>작성자: ${board.writer}</p>
</div>
<h3>댓글 작성</h3>
    <form id="comment-form" method="post">
        <input type="hidden" id="board-id" name="boardId" value="${board.boardId }">
        <input type="hidden" id="board-id" name="writer" value="1111">
        <input type="hidden" id="board-id" name="writerId" value="1111">
        <textarea id="comment-content" name="content" rows="5"></textarea>
        <br>
        <button type="submit">댓글 작성</button>
    </form>
    <hr>
    <h3>댓글 목록</h3>
    <div id="comment-list">
        <p>댓글이 없습니다.</p>
    </div>

<script>
  $('#comment-form').submit(function(event) {
    // 기본 동작인 form submit 막기
    event.preventDefault();

    // 폼 데이터 가져오기
    var formData = $(this).serialize();
    var boardId = ${board.boardId};

    // 댓글 작성 요청 보내기
    $.ajax({
      type: 'POST',
      url: '/support/qna/comment/write',
      data: formData,
      success: function(response) {
        // 새로 등록된 댓글 목록에 추가하기
        var commentList = $('#comment-list');
        commentList.append(
          '<div>' +
          '<p>' + response.content + '</p>' +
          '<p>작성자: ' + response.writer + '</p>' +
          '</div>'
        );
        // 폼 초기화
        $('#comment-form')[0].reset();
      },
      error: function() {
        alert('댓글 작성에 실패했습니다.');
      }
    });
  });
</script>

</body>
</html>