<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	  $(function()
	  {
	      $("#sendBtn").click(function()
	      {
	         var params = "name=" + $.trim($("#name").val())
	         + "&content=" + $.trim($("#content").val());
	         
	         // jQuery 의 ajax() 함수 사용(호출)
	         $.ajax(
	         {

	        	 type : "POST"
                 , url : "AjaxTest01_ok.jsp"
                 , data : params
                 , success : function(args)   // callBack. ajax 처리가 제대로 됐을 때~

				{
                	$("#resultDiv").html(args);
                     
                    $("#name").val("");
                    $("#content").val("");
                    $("#name").focus();
                }

	            , beforeSend : showRequest	// 서버 전송하기 전에 확인할거 → true / false 
	            , error : function(e)	// 에러가 생기면 처리하겠다
	            {
	                alert(e.responseText);	// 에러 생긴 내용 텍스트로 찍어보겠다.
				}
	         });
	      });
	   }); 
	   
	  // ajax() 함수의 속성들 잘 볼 것
	   function showRequest()
	   {
	      if (!$.trim($("#name").val()))   // 유효성 검사
	      {
	         alert("이름을 입력해야 합니다.");
	         $("#name").focus();
	         return false;
	      }
	      
	      if (!$.trim($("#content").val()))
	      {
	         alert("내용을 입력해야 합니다.");
	         $("#content").focus();
	         return false;
	      }
	      return true;
	   }
	   
	   
</script>
</head>
<body>

<div>
   <h1>jQuery 의 ajax() 메소드 실습</h1>
</div>

<div>
   이름 : <input type="text" id="name" class="txt"><br>
   내용 : 
   <textarea rows="3" cols="50" id="content">

   </textarea>
   <br><br>
   
   <input type="button" value="등록하기" id="sendBtn" class="btn">
</div>
<br><br>

<div id="resultDiv">

</div>

</body>
</html>