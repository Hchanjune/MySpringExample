<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>

<script>
	$(document).ready(function() {
		$("#modify-post-button").click(function() {
			$("#input-title").removeAttr("readonly");
			$("#input-body").removeAttr("readonly")
			$("#writeButtonTag").hide();
			$("#replyDiv").hide();
			$("#writeReplyDiv").hide();
			$("#modify-post-button").hide();
			$("#modify-post-confirm-button").show();
			$("#modify-post-cancel-button").show();
		})
	});
	$(document).ready(function(){
		$(".modify-reply-button").click(function(){
			const replyId = $(this).attr("data-reply-id");
			$("#modify-reply-button"+replyId).hide();
			$("#reply-content"+replyId).removeAttr("readonly");
			$("#modify-reply-confirm-button"+replyId).show();
			$("#modify-reply-cancel-button"+replyId).show();
		})
	});
	
	
</script>

<title>게시글</title>
</head>
<body>
<div class="container" >
	<ex:NavBar />
	<div class="container" id="postDiv" >
		<c:url value="/board/modify" var="modifyPostLink"></c:url>
		<form action="${modifyPostLink }" method="post">
			<span>${board.id }.번째 게시글 제목</span><br />
			<input type="hidden" name="id" value="${board.id }" />
			<input class="form-control" style="width:400px;" type="text" name="title" id="input-title" value=${board.title } readonly />
			<br />
			<textarea class="form-control" style="width:400px;height:400px" rows="" cols="" name="body" id="input-body" readonly>${board.body }</textarea>
			<br />
			<i class="fa-regular fa-clock"></i> <input type="datetime-local" value="${board.inserted }" readonly />
			<br />
			<button class="btn btn-outline-success" style="display: none;" id="modify-post-confirm-button">작성</button>
			<form action="">
				<button class="btn btn-outline-success" style="display: none;" id="modify-post-cancel-button">취소</button>
			</form>
		</form>
	</div>
	<div class="container" >
		<div id="writeButtonTag" class="btn-group" role="group" aria-label="Basic outlined example">
		<!-- 게시물 쓰기 버튼 -->
		<ex:writeButton />
		<!-- 게시물 수정 버튼 -->
		<button class="btn btn-outline-primary" id="modify-post-button"><i class="fa-solid fa-pen-to-square"></i></button>
		<!-- 게시물 삭제 버튼 -->
		<c:url value="/board/delete" var="deletePostLink"></c:url>
		<div class="col">
			<form action="${deletePostLink }" method="post">
			
				<input type="hidden" name="id" value="${board.id }" />
				<button class="btn btn-outline-primary" id="delete-post-button"><i class="fa-solid fa-trash"></i></button>
			
			</form>
		</div>
		</div>
	</div>

	<div class="container" id="replyDiv">
		<i class="fa-solid fa-hashtag">댓글</i>
		<br />
		<div class="col" style="border: 1px solid black; margin-bottom: 3px;">
		<c:forEach items="${replyList }" var="replyList">
			<!-- 댓글 창 + 수정 form -->
			<c:url value="/board/reply/modify" var="modifyReplyLink"></c:url>
			<form action="${modifyReplyLink }" method="post">
				<input type="hidden" name="id" value="${replyList.id }" />
				<input type="hidden" name="boardId" value="${board.id }" />
				<input class="form-control" type="text" name="content" id="reply-content${replyList.id }" value="${replyList.content }" readonly />
				<p>작성일시 : ${replyList.prettyInserted }</p>
				<button class="btn btn-outline-primary" style="display: none;" id="modify-reply-confirm-button${replyList.id }">수정</button>
				<!-- <form action=""> -->
				<button class="btn btn-outline-primary" style="display: none;" id="modify-reply-cancel-button${replyList.id }">취소</button>
				<!-- </form> -->
			</form>
			<div class="row">
			<div class="col"><button class="modify-reply-button btn btn-outline-primary" id="modify-reply-button${replyList.id }" data-reply-id="${replyList.id }"><i class="fa-solid fa-pen-to-square"></i></button></div>
			<!-- 댓글 삭제 form -->
			<c:url value="/board/reply/delete" var="deleteReplyLink"></c:url>
			<div class="col">
			<form action="${deleteReplyLink }" method="post">
				<input type="hidden" name="id" value="${replyList.id }" />
				<input type="hidden" name="boardId" value="${board.id }" />
				<button id="reply-delete-button" class="btn btn-outline-primary"><i class="fa-solid fa-trash"></i></button>
			</form>
			</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="container" id="writeReplyDiv" style="margin-bottom: 50px;">
		<i class="fa-solid fa-message">댓글쓰기</i>
		<br />
		<c:url value="/board/insert/reply" var="insertReplyLink"></c:url>
		<form action="${insertReplyLink }" method="post">
			<input type="hidden" name="boardId" value="${board.id }" />
			<input class="form-control" type="text" name="content" />
			<button class="btn btn-outline-primary"><i class="fa-solid fa-square-pen">댓글 작성</i></button>
		</form>
	</div>
</div>
</body>
</html>













