<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
	function qna_list_go() {
		f.action="QnA_list.do"
		f.submit();
	}

	function member_list_go() {
		f.action="member_list.do"
		f.submit();
	}
	function test_list_go() {
		f.action="test_list.do"
		f.submit();
	}
</script>
</head>
<body>
	<%-- 현재 페이지에서 다른 페이지 가져오기  --%>
	<%@ include file="top.jsp" %>
	
				<div class="myPageList">
					<input type="button" value="회원관리" onclick="member_list_go(this.form)" />
				</div>
				<div class="myPageList">
					<input type="button" value="QnA관리" onclick="qna_list_go(this.form)" />
				</div>
				<div class="myPageList">
					<input type="button" value="테스트관리" onclick="test_list_go(this.form)" />
				</div>				
		<button id ="chk" style="text-align: right;" >선택삭제</button>
	<table>
		<h2> :: 회원관리 :: </h2>
		<thead>
			<tr bgcolor="#dedede">
				<th style="width: 5%">체크</th>
				<th style="width: 15%">id</th>
				<th style="width: 10%">pwd</th>
				<th style="width: 10%">nickname</th>
				<th style="width: 5%">gender</th>
				<th style="width: 15%">email</th>
				<th style="width: 15%">reg</th>
				<th style="width: 15%">pi</th>
			</tr>
		</thead>
		<tbody id="tbody">
		
			<c:choose>
					<c:when test="${empty list}">
						   <tr><td colspan="4"><h2>원하는 정보가 존재하지 않습니다</h2></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<tr>
								<td></td>
								<td>${vs.count}</td>
								<td>${k.id }</td>
								<td>${k.pwd }</td>
								<td>${k.nickname }</td>
								<td>${k.gender }</td>
								<td>${k.email }</td>								
								<td>${k.reg.substring(0,10)}</td>
								<td>${k.pi }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</tbody>
	</table>

				
</body>

</html>