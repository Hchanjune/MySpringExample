<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div>
		<c:url value="/board/write" var="writeLink"></c:url>
		<form action="${writeLink }">
			<button class="btn btn-outline-primary">
				<i class="fa-solid fa-pen">글쓰기</i>
			</button>
		</form>
	</div>
