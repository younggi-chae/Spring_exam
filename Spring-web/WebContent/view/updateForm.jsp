<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글수정폼</h3>
	<form:form action="board_update" method="post" commandName="boardCommand">
		<form:input type="hidden" path="seq" value="${board.seq }"/>
		작성자 : <form:input type="text" path="writer" value="${board.writer }"/><br>
		제목 : <form:input type="text" path="title" value="${board.title }"/><br>
		내용 <br>
		<form:textarea rows="6" cols="70" path="contents"></form:textarea>
		<br>
		<input type="submit" value="수정">
	</form:form>
</body>
</html>








