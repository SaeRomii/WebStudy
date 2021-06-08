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
<title>XmlTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "title=" + $("#title").val()
			      + "&content=" + $("#content").val();
			
			$.ajax(
			{
				type : "POST"
				, url : "XmlTest02_ok.jsp"
				, data : params
				, dataType : "xml"
				, success : function(xml)
				{
									
					$(xml).find("status").each(function()
					{
						var status = $(this).text();
						alert(status);		//확인
						/* var title = item.find("title").text();
						var content = item.find("content").text(); */
						
						/* out += "<br>===============================";
						out += "<br> -title=" + title;
						out += "<br> -content=" + content;
						out += "<br>==============================="; */
					});
					
					var str = "";
					
					$(xml).find("records").each(function()
					{
						var records = $(this);
						var id = records.attr("id");
						var title = $(this).find("title").text();
						var content = $(this).find("content").text();
						
						str += ">> id=" + id + "<br> - title=" + title 
						    + "<br> - content=" + content + "<br>";
					});
					
					$("#resultDiv").html(str);
				}
				, beforeSend : showRequest
				, error : function(e)
				{
					alert(e.responseText);
					/* console.log(e); */
				}
			});
		});
	});

	function showRequest()
	{
		var flag = true;
		
		if(!$("#title").val())
		{
			alert("제목을 입력해야 합니다.");
			$("#title").focus();
			flag = false;
		}
		
		if(!$("#content").val())
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			flag = false;
		}
		
		return flag;
	}
</script>

</head>
<body>

<div>
	<h1>jQuery AJAX XML 관련 실습</h1>
	<hr>
</div>

<div>
	제목 : <input type="text" id="title" class="txt"><br>
	내용 : <input type="text" id="content" class="txt"><br>
	<br>
	<input type="button" id="sendBtn" value="전송확인" class="btn">
</div>
<br><br>

<div id="resultDiv">
<!-- 
>> id=1<br>
- title=aaaa<br>
- content=bbbb<br>

>> id=2<br>
- title=aaaa<br>
- content=bbbb<br>
 -->
</div>

</body>
</html>