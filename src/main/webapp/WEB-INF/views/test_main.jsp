<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOLBTi > test</title>
<style type="text/css">

#all{
  padding-left: 160px;
  padding-right : 160px;

}
a:hover{
color: #f1edd4;
}
.psytest_img {
	width: 80%;
	height: auto;
	padding: 30px;
   }
.psy_title { 
	font-size: 30px;
	color: #879fde;
}
.psy_submit {
	border: 2px solid aliceblue;
	background-color: white;
	width: 110px;
	height: 50px;
	text-align: center;
	padding: 10px;
	font-size: 20px;
 }
.psy_sub {
	font-size: 18px;
	color: #84b7b8; 
}
.psy_link { 
	display: block;
	width: 500px;
	height: auto;
	float: right;
	letter-spacing: 8px
 }
.psytest{
	text-align: left;
	padding: 30px;
    display: grid;
    grid-template-columns: 1fr 150px;
}

</style>

<script type="text/javascript">
/* 	function give_pi(){
		String pi;
		Calendar cal = Calendar.getInstance();
		pi = cal.get(Calenar.YEAR)+ (cal.get(Calenar.MONTH)+1)+cal.get(Calenar.DAY_OF_MONTH) + Math.random()*9999
	} */
	const d = new Date(year, month, day, hours);
	document.getElementById("pi").innerHTML =
		d + (String)Math.floor(Math.random() * 1000);
	
	function test_go(f) {
		f.action="test_go.do";
		/* give_pi(); */
		f.submit();
		
	}
	


</script>

</head>
<body>
<%@ include file="top.jsp" %>



<div id="all">
	<div>
	<input type="hidden"  id="pi" name="pi">
	
		<div >
			<img  class="psytest_img" alt="당신을위한 라인은 어디?" src="/resources/images/lane.jpg" >
		</div>
		<div class="psytest">
			<div>
				<div class="psy_title">
					당신을 위한 라인은 어디?
				</div>	
				<div class="psy_sub">
					이것은 당신의 성격을 기반으로하여 당신에게 적합한 라인을 추천해줍니다.
				</div>
			</div>
			<div class="psy_submit">
					<input type="hidden"  value="라인테스트" name="test_name">
					<input type="button" value="테스트하기" onclick="test_go(this.form)" />
			</div>
		</div>
			<div class="psy_link">
				<a href=""><img alt="카카오톡" src="/resources/images/kakao.png"></a>
				<a href=""><i class="fab fa-facebook-square" style="font-size:48px;"></i></a>
				<a href=""><i class="fab fa-twitter-square" style="font-size:48px;"></i></a>
				<a href=""><i class="fas fa-link" style="font-size:40px; "></i></a>
			</div>
	</div>
	<div>
		<div>
			<img class="psytest_img" alt="당신을위한 라인은 어디?" src="/resources/images/whereUR.jpg">
		</div>
		<div class="psytest">
			<div>
				<div class="psy_title">
					당신의 인생 챔피언은 누구?
				</div>	
				<div class="psy_sub">
					이것은 당신의 성격을 기반으로하여 당신에게 어울리는 챔피언을 추천해줍니다.
				</div>
			</div>
			<div class="psy_submit">
				<a href="">시작하기</a>
			</div>
		</div>
			<div class="psy_link">
				<a href=""><img alt="카카오톡" src="/resources/images/kakao.png"></a>
				<a href=""><i class="fab fa-facebook-square" style="font-size:48px;"></i></a>
				<a href=""><i class="fab fa-twitter-square" style="font-size:48px;"></i></a>
				<a href=""><i class="fas fa-link" style="font-size:40px; "></i></a>
			</div>
	</div>
	

<%@ include file="footer.jsp" %>
</div>
</body>
</html>