<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	/*  $(function(){		
		$.getJSON("spring_json", function(data){
			//var data = responseData.list;
			//alert(data);
			$.each(data, function(index, member){
				$('#result').append('<tr><td>' + member.name + '</td>'
						+ '<td>' + member.address + '</td></tr>');
			});
		});
	});  */
	
	$(function(){
		var url = "board_list_json";
		var data = "list";
		$.ajax({
			url : url,
			data : data,
			dataType : 'json',
			success : function(data){
				var htmls = "";
				console.log(data);
				$(data).each(function(){					
					htmls += "<tr>";
					htmls += "<td>" + this.seq + "</td>";
					htmls += "<td>" + this.title + "</td>";
					htmls += "<td>" + this.writer + "</td>";
					htmls += "<td>" + this.regdate + "</td>";
					htmls += "<td>" + this.hitcount + "</td>";
					htmls += "</tr>";					
				});
				$('#result').append(htmls);
			}
		});
	});
</script>
</head>
<body>
	<table id="result" border="1">
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>작성일자</td>
			<td>조회수</td>
		</tr>
	</table>
</body>
</html>









