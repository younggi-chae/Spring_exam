<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">


<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>글 수정</h2>
			<br>
			<form:form action="board_update" method="post" commandName="boardCommand">
				<div class="mb-3">
					<form:input type="hidden" value="${board.seq }"
						class="form-control" path="seq" id="seq"/>
				</div>
				<div class="mb-3">
					<label for="title">제목</label> <form:input type="text"
						value="${board.title }" class="form-control" path="title" id="title"
						placeholder="제목을 입력해 주세요"/>
				</div>

				<div class="mb-3">
					<label for="writer">작성자</label> <form:input type="text"
						value="${board.writer }" class="form-control" path="writer" id="writer"
						placeholder="닉네임을 입력해 주세요"/>
				</div>

				<div class="mb-3">
					<label for="contents">내용</label>
					<form:textarea class="form-control" rows="5" path="contents"
						id="contents" placeholder="내용을 입력해 주세요"/>
				</div>
				<div>
					<input type="submit" value="수정">
				</div>
			</form:form>
		</div>

	</article>
</body>
</html>
