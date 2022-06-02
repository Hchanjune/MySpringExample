<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags" %>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>게시물 목록</title>
</head>
<body>
	<div class="container">
	<ex:NavBar/>

	<h4>게시물 목록</h4>

	<table class="table table-sm">
		<tr>
			<th>번호</th>
			<th><i class="fa-solid fa-square-poll-horizontal"> 제목</i></th>
			<th><i class="fa-regular fa-clock"> 작성일시</i></th>
		</tr>
		<c:forEach items="${board }" var="board">
			<tr>
				<td>${board.id }</td>
				<td>
					<c:url value="/board/post/${board.id }" var="link"></c:url>
					<i class="fa-solid fa-square-poll-horizontal"> <a href="${link }"> ${board.title } </a></i>
					<c:if test="${board.numOfReplies > 0 }">
						<i class="fa-regular fa-comment">[${board.numOfReplies }]</i>
					</c:if>
				</td>
				<td ><i class="fa-regular fa-clock">${board.prettyInserted }</i></td>
			</tr>
		</c:forEach>
	</table>
		<div class="container">
			<div class="row">
			<div class="col"><ex:writeButton/></div>
			<div class="col"><ex:Pagenation path="list"/></div>
			<div class="col">
			<form action="${search }" class="d-flex" role="search" method="post">
        		<input class="form-control me-2" name="value" type="search" placeholder="검색" aria-label="Search" style="width:150px" required>
        		<button class="btn btn-outline-primary" type="submit">Search</button>
      		</form>
      		</div>
      		</div>
		</div>
	</div>
</body>
</html>