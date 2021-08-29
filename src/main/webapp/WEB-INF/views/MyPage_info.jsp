<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지</title>
</head>
<style type="text/css">
section.header {
	position: relative;
	padding: 80px 0px 20px
}

div {
	display: block;
}

body {
	display: block;
	line-height: 1.75;
	margin: 0;
	background-color: #fff;
}

div.header {
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: black;
	left: 0;
	top: 0;
	color: white;
}

div.container {
	max-width: 900px;
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

footer {
	padding: 80px 0px;
	position: relative;
	bottom: 0;
}

div.footer-overay {
	position: absolute;
	left: 0;
	width: 100%;
	height: 200px;
	background-color: gray;
}

.bodybox {
	min-width : 700px;
	margin: auto;
	padding: auto;
	padding-left: 100px;
	padding-right : 100px;
	padding-top : 100px;
	padding-bottom: 100px;
}
.myPageList{
	float : left;
	border: 2px solid lightgray;
	border-bottom : 3px solid #696969;
	min-width:160px;
	height: auto; 
	padding : auto;
	background-color: white;
	text-align: center;
	font-weight: bold; 
	font-size : 14pt;
	color: #696969;
}
.myInfo-table{
	width : 800px;
	min-width : 500px;
	width: 100%;
	padding: 50px;
	padding-right: 5px;
	padding-left : 5px;
	font-weight: bold; 
	font-size: 20px;
}  
td p{
padding-left: 20px;
margin: auto;
}
th{
	padding-right: 30px;
	width: 25%;
	text-align: right;
	border-right: 2px solid lightgray;
}
 
#submit_btn{
	float : right;
	background-color: white;
	border: 2px solid lightgray;
	width:160px;
	height: 40px;
	text-align: center;
	font-weight: bold;  
	font-size : 18pt;
	color: #696969; 
	text-decoration: none;
}

</style>


<script type="text/javascript">
$(function() {
	 $.ajax({
		url: "onelist_ok.do?idx=${idx}",
		method : "post",
		dataType : "json",
		success : function(data) {
		  var tbody = "" ;
			  tbody +="<tr><th class='bg'>ID</th><td>"+data["id"]+"</td></tr>";
			  tbody +="<tr><th class='bg'>PASSWORD</th><td>"+data["pwd"]+"</td></tr>";
			  tbody +="<tr><th class='bg'>닉네임</th><td>"+data["nickname"]+"</td></tr>";

			  tbody +="<tr><th class='bg'>성별</th><td>"+data["gender"]+"</td></tr>";
			  tbody +="<tr><th class='bg'>이메일 주소</th><td>"+data["email"]+"</td></tr>";
			  tbody +="<tr><th class='bg'>가입일</th><td>"+data["reg"]+"</td></tr>";
			  tbody +="<input type='hidden' name='idx' value='"+data["idx"]+"'>";	
			  tbody +="<input type='hidden' name='pwd' value='"+data["pwd"]+"'>";
		  $("#tbody").append(tbody);
			
		},
		error : function() {
			alert("읽기실패");
		}
	});
});
</script>

</head>
<body>
	<div>
	 <%@ include file="top.jsp" %>
		
		<div class="contents">
			<div class="container">
			
				<div class="bodybox">

					<p style="text-align: left; font-size: 25pt; margin-bottom: 2px;">마이페이지</p>
					<br>
						<div class="myPageList" onclick="" onmouseover="">회원 정보</div>
						<div class="myPageList" onclick="" onmouseover="">즐겨찾기 리스트</div>
						<div class="myPageList" onclick="" onmouseover="">나의 리뷰</div>
					<br>
					<p style="text-align: left; font-size: 25pt; margin-bottom: 2px;">나의정보</p>
						
						<table class="myInfo-table">
							<tbody id="tbody"></tbody>
						</table>
						<br>
					
					
						<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button"  value="회원 탈퇴" onclick="secession_go(this.form)"> 
				</div>

			</div>

		</div>

 		<%@ include file="footer.jsp" %>


	</div>
</body>

</html>