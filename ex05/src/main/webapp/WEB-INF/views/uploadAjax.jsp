<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.uploadResult {
		width: 100%;
		background-color: gray;
	}
	
	.uploadResult ul {
		display :flex;
		flex-flow: row;
		justify-content : center;
		align-items : center;		
	}
	
	.uploadResult ul li{
		list-style: none;
		padding: 10px;
	}
	.uploadResult ul li img{
		width: 100px;
	} 
</style>
</head>
<body>
	<h1>Upload with Ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<div class="uploadResult">
		<ul>
		
		</ul>
	</div>
	
	<button id="uploadBtn">Upload</button>
	
	
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
  <script type="text/javascript">
  
	  //파일 확장자 , 크기 체크
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880;  // 5mb
	  
	  function checkExtension(fileName, fileSize){
		  if(fileSize >= maxSize){
			  alert("파일 사이즈 초과");
			  return false;
		  }
		  
		  if(regex.test(fileName)){
			  alert("해당 종류의 파일은 업로드할 수 없습니다.");
			  return false;
		  }
		  return true;
	  }  
  
  
		//첨부파일 이름 목록 출력
		var uploadResult = $('.uploadResult ul');
		
		function showUploadedFile(uploadResultArr){
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				
				if(!obj.image){
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" 
							+ obj.uuid + "_" + obj.fileName);
					
					str +="<li><a href='/download?fileName="+ fileCallPath + "'>" 
							+ "<img src='/resources/img/attach.png'>" + obj.fileName +"</a></li>"
						
				} else {
					//str += "<li>" + obj.fileName + "</li>";
					var fileCallPath = 
						encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<li><img src='/display?fileName=" + fileCallPath + "'></li>";
				}				
			});
			uploadResult.append(str);
		}
		
		
		// Ajax 업로드
  		var cloneObj = $('.uploadDiv').clone(); 
   		
  		$("#uploadBtn").on('click', function(e){
  			var formData = new FormData();
  			var inputFile = $("input[name='uploadFile']");
  			var files = inputFile[0].files;
  			console.log(files);
  			
  			//add filedate to formdata
  			for(var i = 0; i < files.length; i++){
  				
  				if(!checkExtension(files[i].name, files[i].size)){
  					return false;
  				}
  				
  				formData.append("uploadFile", files[i]);
  			}
  			
  			$.ajax({
  				url : '/uploadAjaxAction',
  				processData: false,
  				contentType: false,
  				data: formData,
  				dataType : 'json',
  				type: 'post',
  				success : function(result){
  					console.log(result);
  					
  					showUploadedFile(result);
  					// <input type='file'> 초기화
  					$('.uploadDiv').html(cloneObj.html());
  				}
  			});
  		});		
 
  </script>
</body>
</html>