<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOLBTi > Rules</title>
<style type="text/css">
#all {
	padding-left: 160px;
	padding-right: 160px;
}

a:hover {
	color: #f1edd4;
}

.r_title {
	font-size: 30px;
	color: #84b7b8;
	font-weight: bold;
}

.r_sub {
	margin-top: 20px;
	margin-left: 60px;
	margin-right: 60px;
	height: auto;
	padding: 100px;
}
</style>

<script type="text/javascript">

	function join_ok(f) {
		f.action = "join_ok.do";
		f.submit();
	}
	function chk_id_overlap(f){
		f.action = "chk_id_overlap.do";
		f.submit();
	}
	  function pwdChk() {
		    var pw1 = document.getElementById( 'pwd' ).value;
		    var pw2 = document.getElementById( 're_pwd' ).value;
		    if(pw.length<4 || pw.length>10){
		    	alert('비밀번호 4글자이상 10글자 이하로입력해주세요')
		    	document.getElementById('pw').value='';
		    }else if ( pw1 != pw2 ) {
		      alert( '다시입력한 비밀번호와 일치하지않습니다' );
		      #{pwd} ="";
		      #{re_pwd} ="";
		      #{pwd}.focus();
		      return false;
		    }
	  }
	 
	
	
</script>

</head>
<body>
	<%@ include file="top.jsp"%>



	<div id="all">
		<!-- 전체박스 -->
		<div>
			<!-- 바디박스1111 -->

			<div>
				<h2
					style="margin-left: 60px; margin-right: auto; width: 280px; height: 50px;">
					로그인</h2>
			</div>
			<div
				style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto;">
			</div>

			<p
				style="text-align: left; font-size: 30pt; margin-bottom: 15px; font-weight: bold;">회원가입</p>
			<div class="bodybox">
				<table id="Join-table">
					<tr>
						<td class="td-head">ID</td>
						<td style="width: 35%;"><input type="text" name="id" value=""></td>
						<td style="width: 30%;"><input type="button" name="chk_id_overlap" value="중복확인"onclick="chk_id_overlap(this.form)"></td>
					</tr>
					<tr style="border: 2px solid black;">
						<td class="td-head">PASSWORD</td>
						<td style="width: 35%;"><input type="password" id="pwd" name="pwd" value=""></td>
						<td rowspan="2" style="width: 30%;"><div class="alertMsgBox"></div></td>
					</tr>
					<tr>
						<td class="td-head">PASSWORD 재입력</td>
						<td><input type="password" id="re_pwd" name="re_pwd"
							value=""></td>
						<td> <input type="button" value="비밀번호재입력확인" onclick="pwdChk()"></td>	
					</tr>
					<tr>
						<td colspan="3"
							style="border-bottom: 2px solid lightgray; padding-top: 30px;"></td>
						<tr>
						
					<tr>
						<td colspan="3" style=" padding-bottom : 30px;"></td>
						
					<tr>				
						
					<tr>
							<td class="td-head">이메일 주소</td>
							<td> <input type="email" id="email" name="email" value="">			
							</td>
						</tr>
						<tr>
							<td class="td-head">닉네임</td>
							<td><input type="text" id="nickname" name="nickname" value=""></td>
							<td style="width: 30%;"><input type="button" name="nickname-overlapTest" value="중복확인" onclick="chk_overlap(this.form)"></td>
						</tr>
						<tr>
							<td class="td-head">성별</td>
							<td>
							<input type="radio" name="gender" value="남">&nbsp 남성 &nbsp&nbsp&nbsp
					  		 <input type="radio" name="gender" value="여">&nbsp 여성
					  		 </td>
						</tr>
						<tr>
							<td class="td-head">주민등록번호</td>
							<td style="width: 30%;"><input type="text" id="RR_Num"
							name="RR_Num" value="" size="8" maxlength="6">&nbsp-&nbsp
							<input style="width:10px;" type="text" id="RR_Num_2"
							name="RR_Num_2" value="" size="1" maxlength="1"> ******</td>
						
						</tr>
					</table>
					<div>
	
					</div>

				</div>
				<input type="button" value="회원가입" onclick="join_ok(this.form)">
	
		<div
							style="border-bottom: 2px solid #84b7b8; width: 1000px; height: 2px; margin-left: auto; margin-right: auto; ">
		</div>
		
	</div>
	
<%@ include file="footer.jsp"%>

					</div>

</body>
</html>