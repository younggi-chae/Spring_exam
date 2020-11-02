<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.error{
		color: #ff0000;
	}
</style>
</head>
<body>
<h3>글쓰기</h3>
<hr>
<form:form action="board_insert" method="post" enctype="multipart/form-data"
           commandName="boardCommand">
	작성자 : <form:input type="text" path="writer"/>
		  	<form:errors path="writer" cssClass="error"/><br>
	제목 : <form:input type="text" path="title"/>
		   	<form:errors path="title" cssClass="error"/><br>
         파일 : <input type="file" name="uploadFile"/><br>	
	내용 <br>
	<form:textarea rows="6" cols="70" path="contents"></form:textarea>
	<br>
	<input type="submit" value="등록">
</form:form>

</body>
</html>