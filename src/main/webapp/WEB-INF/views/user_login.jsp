<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOLBTi > Rules</title>
<style type="text/css">
#all{
  padding-left: 160px;
  padding-right : 160px;

}
a:hover{
color: #f1edd4;
}
#body{
	font-weight: bold;
}
.loginbox input{

    width: 104px;
    height: 44px;

}
#tb1{
    margin-bottom: 30px;
    margin-left: auto;
 	margin-right: auto;
}

#tb1 input{
   width: 180px;
    height: 24px;

}

.loginbox{
margin-top : 20px;
 margin-left: 60px;
 margin-right: 60px;
 font-size: 30px;
 	color: #84b7b8;
 height: auto;
 padding: 10px;
}

#tb1 th{
	padding-top : 20px;
	padding-bottom : 20px;
	padding-right : 10px;
	text-align: center;
	align-content: center;

}

.loginbox div{
	display : inline;
	padding : 40px;
	weight:100px;
	height: 70px;
}
</style>

<script type="text/javascript">
	function login_go(f) {
		if(f.id.value=="" || f.pw.value==""){
			alert("id 혹은 pwd를 입력하세요");
			f.id.value="";
			f.pwd.value="";
			f.id.focus();
			return;
		}
		f.action="login_ok.do";
		f.submit();
	}
	function join_go(f) {
		alert("회원가입 하기");
		f.action="join_ok.do";
		f.submit();
	}
</script>

</head>
<body>
<%@ include file="top.jsp" %>



<div id="all"><!-- 전체박스 -->
	<div id="body"> <!-- 바디박스1111 -->
		
		<div >
		<h2 style="margin-left: 60px; margin-right: auto; width: 280px; height: 50px;"> 로그인</h2>
		</div>	
		<div style="border-bottom: 2px solid #84b7b8; width: auto; height: 2px; margin-left: auto; margin-right: auto; " >
		</div>
			
		<div class="loginbox">
			<table id="tb1">
				<tr><th>아이디</th><td><input type="text" name="id"> </td></tr>
				<tr>
					<th>비밀번호</th><td><input type="password" name="pwd" ></td>			
				</tr>
			</table>
		
			<div><input type="button" value="회원가입" onclick="join_go(this.form)"></div>
			<div><input type="button" value="로그인" onclick="login_go(this.form)"></div>
				
			
		
		</div>
		
		<div style="border-bottom: 2px solid #84b7b8; width: auto; height: 2px; margin-left: auto; margin-right: auto; margin-bottom: 3px;">
			</div>
	</div>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>