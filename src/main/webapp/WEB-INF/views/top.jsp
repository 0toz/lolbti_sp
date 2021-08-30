<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<style type="text/css">


body{

text-align: center;
}

#all{
 
}
header{
  padding: 30px;
  padding-left: 160px;
  padding-right : 160px;
  text-align: center;
  color: white;
}
#top_div{
	min-width : 1000px;
	height: 170px;
	display: grid;
	grid-template-columns: 270px 1fr;
	padding: 0px;
}

.logo{
  width : 298.4px;
  height: 144.8px; 
  padding: 0px;
}
.top_menu:hover{
	color: #f1edd4;
}


.top_menu{
background-color: white;
color: #84b7b8;
margin-top: 40px;
border-bottom: 4px solid Aliceblue;
font-size: 26px;
width : 190px;
height: 60px;
float: right;
padding: 4px;
flex-direction: row;
}

a{
text-decoration: none;
color: #84b7b8;
}
a:hover{
color: #f1edd4;
}

#login{
border: 4px solid Aliceblue;
color: #84b7b8;
margin-top : 10px;
float: right;
font-size : 16px;
width : 100px;
height: 40px;
}
</style>

</head>
<body>
	<header>
			<div id="top_div">
				<div class="logo">
					<a href="http://localhost:8090/main.do">
					<img alt="롤비티아이 로고" src="/resources/images/logo.png" width="80%" height="80%" align="left">
					</a>
				</div>
				<div id="top_menu_set">
					<div class="top_menu" id="login"><a href="http://localhost:8090/login.do">
						로그인 / 회원가입</a></div>
					<div class="top_menu"><a href="http://localhost:8090/test_result_list.do">
						<span>테스트 결과</span></a>
					</div>
					<div class="top_menu"><a href="http://localhost:8090/test_main_go.do">
					테스트 하기</a></div>
					<div class="top_menu"><a href="http://localhost:8090/main.do">
					롤BTI 소개</a></div>
				</div>
			</div>
	
		</header>



</body>
</html>