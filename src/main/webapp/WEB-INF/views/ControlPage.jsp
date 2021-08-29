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


</script>
</head>
<body>
	<%-- 현재 페이지에서 다른 페이지 가져오기  --%>
	<%@ include file="top.jsp" %>
	
				<div class="myPageList">
					<input type="button" value="회원관리" onclick="qnA_list_go(this.form)" />
				</div>
				<div class="myPageList">
					<input type="button" value="QnA관리" onclick="qnA_list_go(this.form)" />
				</div>
				<div class="myPageList">
					<input type="button" value="테스트관리" onclick="qnA_list_go(this.form)" />
				</div>

<%@ include file="footer.jsp" %>
				
</body>

</html>