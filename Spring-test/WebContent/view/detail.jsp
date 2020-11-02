<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.board_title {
	font-weight: 700;
	font-size: 20pt
}

.board_info_box {
	border-bottom: solid 1px;
}
</style>

<script type="text/javascript">
	$(document).on('click', '#btnUpdate', function() {
		location.href = "board_update" + ${board.seq};
	});

	$(document).on('click', '#btnDelete', function() {
		location.href = "board_delete" + ${board.seq};
	});

	$(document).on('click','#btnList', function() {
		location.href = "${pageContext.request.contextPath}/board_list";
	});
	
		
	$(document).ready(function(){
		showReplyList();
	});
	
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/restBoard/reply_list";
		var paramData = {"seq" : "${board.seq}"};
		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
               	var htmls = "";
			if(result.length < 1){
				htmls.push("등록된 댓글이 없습니다.");
			} else {
	             $(result).each(function(){
	                htmls += '<div class="media text-muted pt-3" id="r_no' + this.r_no + '">';
	                htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                htmls += '<title>Placeholder</title>';
	                htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                htmls += '</svg>';
	                htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                htmls += '<span class="d-block">';
	                htmls += '<strong class="text-gray-dark">' + this.r_writer + '</strong>&nbsp;&nbsp;';	               
	                htmls += '<span> ' + this.r_regdate + '</span>'
	                htmls += '<span style="padding-left: 7px; font-size: 9pt">';	                  
	                htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.r_no + ', \'' + this.r_writer + '\', \'' + this.r_contents + '\' )" style="padding-right:5px">수정</a>';
	                htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.r_no + ')" >삭제</a>';
	                htmls += '</span>';
	                htmls += '</span>';
	                htmls += this.r_contents;
	                htmls += '</p>';
	                htmls += '</div>';
	           });	//each end
			}
			$("#replyList").html(htmls);
            }	   // Ajax success end
		});	// Ajax end
	}
	
	
	$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#r_contents').val();
		var replyWriter = $('#r_writer').val();

		var paramData = JSON.stringify({"r_contents": replyContent
				, "r_writer": replyWriter
				, "seq":'${board.seq}'
		});	
		console.log(paramData);
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard/reply_insert"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				$('#r_contents').val('');
				$('#r_writer').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});
	
		
	function fn_editReply(r_no, r_writer, r_contents){
		
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="r_no' + r_no + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + r_writer + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + r_no + ', \'' + r_writer + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += r_contents;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';
		$('#r_no' + r_no).replaceWith(htmls);
		$('#r_no' + r_no + ' #editContent').focus();
	}
	
	
	function fn_updateReply(r_no, r_writer){
		var replyUpdateContent = $('#editContent').val();
		var paramData = JSON.stringify({"r_contents": replyUpdateContent
				, "r_no": r_no
		});		

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard/reply_update"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}

	

	function fn_deleteReply(r_no){
		var paramData = {"r_no": r_no};
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard/reply_delete"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
</script>
</head>

<body>
	<article>
		<div class="container" role="main">
			<br>
			<div class="board_title">
				<c:out value="${board.title}" />
			</div>
			<div class="board_info_box">
				<span class="board_writer"><c:out
						value="작성자 : ${board.writer}" /></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="board_regdate"><c:out value="${board.regdate}" /></span>				
				<span class="board_cnt"><c:out value="${hitcount}" /></span>
			</div>
			<div class="bg-white rounded shadow-sm" id="border">

				<br> <br>
				<div class="board_content">${board.contents}</div>
			</div>
			<br><br>
			<a href="/MVC_BOARD/download.jsp?filename=${board.fname }">${board.fname }</a>
			<div style="margin-top: 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
	<br>
	<br>
	<br>

	<article>
		<div class="container">
			<div>
				<span><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<!-- Reply Form {s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<form name="form" id="form" role="form" method="post">
				<input type="hidden" name="seq" id="seq">
				<div class="row">
					<div class="col-sm-10">
						<textarea name="r_contents" id="r_contents" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>
					</div>
					<div class="col-sm-2">
						<input name="r_writer" class="form-control" id="r_writer" placeholder="댓글 작성자"/>
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
					</div>
				</div>
				</form>
			</div>
			<!-- Reply Form {e} -->
		</div>
	</article>

	<article>
		<div class="container">
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList"></div>
			</div> 
		</div>
	</article>
</body>
</html>
