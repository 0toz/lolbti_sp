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
td {text-align: center;
	padding: 15px 10px;
	background-color: #F6F6F6;}
th {text-align: center;
	padding: 15px 10px;
	background-color: #B2CCFF;}
h2 {text-align: center;}
table {	width: 800px;
		margin: 10px auto;}

</style>


<script type="text/javascript">
	function QnA_write_go() {
		location.href = "QnA_write.do?qPage=${qPage}";
	}
</script>
</head>
<body>
<%@ include file="top.jsp" %>



<div id="all"><!-- 전체박스 -->
	<div> <!-- 바디박스1111 -->
		
		<div >
			<h2 style="margin-left: 60px; margin-right: auto; width: 280px; height: 50px;"> 문의 게시판</h2>
		</div>	
		<div style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto; " >
	
		</div>
	
	<table>
		<thead>
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 40%">제목</th>
				<th style="width: 20%">작성자</th>
				<th style="width: 20%">날짜</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr><td colspan="5"><h3>문의글이 존재하지 않습니다.</h3></td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${pvo.totalRecord-((pvo.nowPage-1)*pvo.numPerPage+vs.index)}</td>
							<td style="text-align: left">
								<a href="onelist.do?idx=${k.idx}&qPage=${qPage}">${k.title}</a></td>
							<td>${k.nickname }</td>
							<td>${k.reg.substring(0,10) }</td>
							<td>${k.hit }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<%-- 이전 --%> 
					<c:choose>
						<c:when test="${pvo.beginBlock <= pvo.pagePerBlock }">
							<span style="color: gray; padding: 5px; border: 1px solid gray">이전으로</span>
						</c:when>
						<c:otherwise>
							<span style="color: tomato; padding: 5px; border: 1px solid tomato">
								<a href="QnA_list.do?cPage=${pvo.beginBlock-pvo.pagePerBlock}">이전으로</a>
							</span>
						</c:otherwise>
					</c:choose> &nbsp;&nbsp; 
					<%-- 번호 --%> 
					<c:forEach begin="${pvo.beginBlock }" end="${pvo.endBlock }" var="k">
						<c:choose>
							<c:when test="${k==pvo.nowPage}">
								<span style="background-color: tomato; padding: 5px;">${k}</span>
							</c:when>
							<c:otherwise>
								<span style="color: tomato; padding: 5px;">
									<a href="QnA_list.do?cPage=${k}">${k}</a>
								</span>
							</c:otherwise>
						</c:choose>
					</c:forEach> &nbsp;&nbsp; 
					<%-- 다음 --%> 
					<c:choose>
						<c:when test="${pvo.endBlock >= pvo.totalPage }">
							<span style="color: gray; padding: 5px; border: 1px solid gray">다음으로</span>
						</c:when>
						<c:otherwise>
							<span style="color: tomato; padding: 5px; border: 1px solid tomato">
								<a href="QnA_list?cPage=${pvo.beginBlock+pvo.pagePerBlock}">다음으로</a>
							</span>
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<button onclick="QnA_write_go()">글쓰기</button>
				</td>
			</tr>
		</tfoot>
	</table>
	
	
	
	<%@ include file="footer.jsp" %>
	</div>
</div>
</body>
</html>