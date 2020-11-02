<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<title>board</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

#align {
	text-align: center;
}
</style>

<script type="text/javascript">
		
		//글쓰기 버튼
		$(document).on('click', '#btnWriteForm', function(e) {
			e.preventDefault();
			location.href = "board_insert";
		});
	
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/board_list";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}

	    //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/board_list";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}

		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/board_list";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
</script>

</head>
<body>
	<h2 align="center">게시판</h2>
	<br>
	<article>
		<div class="container">
			<div class="table-responsive">
				<div align="right">
					<button type="button" class="btn btn-sm btn-primary"
						id="btnWriteForm">글쓰기</button>
				</div>
				<br>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th id="align">글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty list}">
								<c:forEach var="board" items="${list }">
									<tr>
										<td>${board.seq }</td>
										<td><a href="board_detail${board.seq }">${board.title }</a></td>
										<td>${board.writer }</td>
										<td>${board.hitcount }</td>
										<td><fmt:parseDate var="dt" value="${board.regdate }"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												value="${dt }" pattern="yyyy/MM/dd" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
	<!-- pagination{s} -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
							'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->

			</div>
			<br>
						
			<form action="listAction.do" method="post">
				<div align="center">
					<select name="area" id="searchType">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
					</select> <input type="text" name="searchKey" size="10"> <input
						type="submit" value="검색">
				</div>
			</form>
		</div>
	</article>
	<br>
	<br>
</body>
</html>
