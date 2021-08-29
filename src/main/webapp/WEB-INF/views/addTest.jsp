<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.r_title{
	font-size: 30px;
	color: #84b7b8;
	font-weight: bold;
}

.r_sub{
margin-top : 20px;
 margin-left: 60px;
 margin-right: 60px;
 height: auto;
 padding: 100px;
}

</style>

<script type="text/javascript">
	function add_Test(f) {
		f.action="addTest.do";
		f.submit();
	}
	function add_TestMain(f) {
		f.action="addTestMain.do";
		f.submit();
	}
	
</script>
</head>
<body>

<%@ include file="top.jsp" %>


<div id="all"><!-- 전체박스 -->
	<div> <!-- 바디박스1111 -->
		
		<div >
		<h2 style="margin-left: 60px; margin-right: auto; width: 280px; height: 50px;"> 관리자 로그인</h2>
		</div>	
		<div style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto; " >
		</div>
			
		<div class="admin">
			<form method="post" enctype="multipart/form-data" >
				<table>
					<tbody>
						
						<c:forEach var="k" items="${list}">
							<tr>
								<th class="bg">테스트이름</th>
								<td><input type="text" name="test_name" required></td>
							</tr>
							<tr>
								<th class="bg">테스트번호</th>
								<td><input type="number" name="exm_num" required></td>
							</tr>
							<tr>
								<th class="bg">중요도</th>
								<td><input type="number" name="imp" value="1" required></td>
							</tr>
							<tr>
								<th class="bg">제안</th>
								<td><input type="text" name="sug" required></td>
							</tr>
							<tr>
								<th class="bg">질문내용</th>
								<td><input type="text" name="quest" required></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2"><input type="button" value="테스트내용등록" onclick="addTest(this.form)"></td>
						</tr>
						<tr>
							<th class="bg">테스트이미지</th>
							<td><input type="file" name="p_image2" required></td>
						</tr>
						<tr>
							<th colspan="2" class="bg">테스트정보</th>
						</tr>
						<tr>
							<td colspan="2"><textarea rows="10" cols="50" name="desc" required></textarea></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><input type="button" value="이미지, 정보 등록" onclick="addTestMain(this.form)"></td>
						</tr>
					</tfoot>
				</table>
		</form>
		</div>
		
	
		<div style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto; " >
		</div>
		
	
	</div>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>