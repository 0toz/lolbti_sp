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
	$(function() {
		function cartList() {
			$("#tbody").empty();
			$.ajax({
				url : "cartList.do",
				method : "post",
				dataType : "json",
				success : function(data) {
					var tbody="";
					var total = 0 ;
					$.each(data, function() {
						tbody += "<tr>";
						tbody += "<td><input type='checkbox' name='chk_id' id='"+this["id"]+"' p_num='"+this["p_num"]+"'></td>";
						tbody += "<td>"+this["p_num"]+"</td>";
						tbody += "<td>"+this["p_name"]+"</td>";
						tbody += "<td>"+this["p_price"]+" 원<br>";
						tbody += "<font style='color:red'>(세일가:"+this["p_saleprice"]+" 원)</font></td>";
						
						// 수정시  변경된 amount,  id , p_num 이 필요하다.
						tbody += "<td><input type='number' name='amount' class='amount' value='"+this["amount"]	+"' id='"+this["id"]+"' p_num='"+this["p_num"]+"'</td>";
						tbody += "<td>"+parseInt(this["p_saleprice"]) * parseInt(this["amount"])+" 원</td>";
						
						// 삭제시 id 와 p_num 이 필요하다.
						tbody += "<td><input type='button' value='삭제' class='delcart' id='"+this["id"]+"' p_num='"+this["p_num"]+"'></td>";
						tbody += "</tr>";
						total = total + (parseInt(this["p_saleprice"]) * parseInt(this["amount"]));
					});
					tbody += "<tr style='text-align: right;'>";
					tbody += "<td colspan='7' style='padding-right: 50px'>";
					tbody += "<h2> 총 결재액 : "  + total + " 원 </h2>";
					tbody += "</tr>";
					$("#tbody").append(tbody);
				},
				error : function() { alert("읽기실패");	}
			});
		}
		// 삭제
		$("table").on("click", ".delcart", function() {
			$.ajax({
				url : "deleteCart.do",
				method : "post",
				data : "id="+$(this).attr("id")+"&p_num="+$(this).attr("p_num"),
				dataType : "text",
				success : function(data) {
					if(data == '1'){
					   cartList();
					}
				},
				error: function() {
					alert("읽기실패");
				}
			});
		});
		
		// 수정
		$("table").on("change", ".amount", function() {
			$.ajax({
				url : "editCart.do",
				method : "post",
				data : "id="+$(this).attr("id")+"&p_num="+$(this).attr("p_num")
				        +"&amount="+$(this).val(),
				dataType : "text",
				success : function(data) {
					if(data == '1'){
					   cartList();
					}
				},
				error: function() {
					alert("읽기실패");
				}
			});
		});
		$("#chk").click(function() {
			var chk_id = [] ;
			var id = [] ;
			var p_num = [];
			$("input[name='chk_id']:checked").each(function() {
				chk_id.push($(this).val());
				id.push($(this).attr("id"));
				p_num.push($(this).attr("p_num"));
			});
			// 하나도 선택하지 않으면 
			if(chk_id.length==0){
				alert("선택 후 눌러 주세요");
				return false;
			}
			$.ajax({
				url : "chk_del.do",
				method : "post",
				data :{"id":id, "p_num":p_num},
				dataType : "text",
				success : function(data) {
					if(data == '1'){
					   cartList();
					}
				},
				error: function() {
					alert("읽기실패");
				}
			});
		});
		
		cartList();
	});
</script>
</head>
<body>
	<%-- 현재 페이지에서 다른 페이지 가져오기  --%>
	<%@ include file="top.jsp" %>
	
				<div class="myPageList" onclick="" onmouseover="">회원 관리</div>
				<div class="myPageList" onclick="" onmouseover="">QnA관리</div>
				<div class="myPageList" onclick="" onmouseover="">테스트 관리</div>
		<button id ="chk" style="text-align: right;" >선택삭제</button>
	<table>
		<h2> :: 장바구니 내용 :: </h2>
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
		<tbody id="tbody"></tbody>
	</table>

				
</body>

</html>