<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOLBTi > result > top</title>
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
}
.psy_link { 
	display: block;
	width: 500px;
	height: auto;
	float: right;
	letter-spacing: 8px
 }
.test_list{
	width: 80%;
	margin: 30px;
	height: auto;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
}
.test_list_mini{
width: 192px;
 height: 108px;
 margin: auto;
 
}


</style>
<script type="text/javascript">

function lane_go(lane) {
	
	
	lane.action="test_result.do";
	lane.submit();
	}

</script>

</head>
<body>
<%@ include file="top.jsp" %>



<div id="all"><!-- 전체박스 -->
	<div> <!-- 바디박스1111 -->
		
		<div >
		<h2 style="margin-left: 60px; margin-right: auto; width: 180px; height: 50px;"> 테스트 결과</h2>
		</div>	
	<div style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto; " >
		</div>
			
		<div class="result">
			<div style="padding: 30px;">
			<img alt="테스트 이미지" src="/resources/images/lane.png">
			</div>
			<div class="r_title">
				라인테스트 결과들보기
			</div>	
			<div class="r_sub">
				<div><img alt="탑 이미지" src="/resources/images/top.png" name="lane" id="top"  onclick="lane_go(top)"></div>
				<div><img alt="정글 이미지" src="/resources/images/jungle.png" name="lane" id="jungle"  onclick="lane_go(lane)"></div>	
				<div><img alt="미드 이미지" src="/resources/images/mid.png" name="lane" id="mid"  onclick="lane_go(mid)"></div>
				<div><img alt="원딜 이미지" src="/resources/images/ADcarry.png" name="lane" id="ADcarry"  onclick="lane_go(ADcarry)">	</div>
				<div><img alt="서폿 이미지" src="/resources/images/sup.png" name="lane" id="sup"  onclick="lane_go(sup)"></div>	
			</div>
		
		</div>
		
	
<%@ include file="footer.jsp" %>
</div>
</body>
</html>