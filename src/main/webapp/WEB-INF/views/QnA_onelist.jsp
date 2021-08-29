<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOLBTi > QnA</title>
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

.ask_title{
font-size: 24px;
margin-top: 30px;
margin-bottom: 30px;
text-align: left;
color: #84b7b8;
}
.submit_btn{
border: 2px solid #84b7b8;
width: 100px;
height: 30px;
margin-left: auto;
margin-right: 30px;
margin-bottom: 20px;
}

</style>
<script type="text/javascript">
	function QnA_list_go(f) {
		f.action="list.do";
		f.submit();
	}
	function QnA_update_go(f) {
		f.action="update.do";
		f.submit();
	}
	function QnA_delete_go(f) {
		f.action="delete.do";
		f.submit();
	}
</script>

</head>
<body>
<%@ include file="top.jsp" %>



<div id="all"><!-- 전체박스 -->
	<div style="min-width: 750px;"> <!-- 바디박스1111 -->
		 
		<div >
		<h2 style="margin-left: 10px; margin-right: auto; width: 160px; height: 50px; color:#84b7b8;"> 문의하기</h2>
		</div>
		<div style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto; " >
		</div>
			
		<div class="ask_box">
			<div class="ask_title">
			제목 &nbsp : &nbsp<input type="text" style="width:500px; height: 30px;">&nbsp 작성일자&nbsp :&nbsp
			</div>	
			<div class="ask_article">
				<script src="//cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
				<textarea name="content" cols="50" rows="8"></textarea>
				<script type="text/javascript">
							CKEDITOR.replace('content');
				</script>
				
			</div>
			<div>첨부파일</div>
			<div style="text-align: left; height: 50px; padding: auto;">
				<input type="file" name="file_name">
			</div>
	
				
				
			<div class="submit_btn">
				<input type="button" value="수정" onclick="QnA_update_go(this.form)" />
				<input type="hidden" name="id" value="${id}"> 
				<input type="button" value="삭제" onclick="QnA_update_go(this.form)" />
				<input type="hidden" name="id" value="${id}"> 
	<!-- 이부분은 id가 맞을때만 보이도록하기 -->
	
	
				<input type="button" value="목록" onclick="QnA_list_go(this.form)" /> 
				<input type="hidden" name="qPage" value="${qPage}">
				</div>
		</div>
		
	</div>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>