<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.gdj59.bookmall.beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.js"></script>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function mod(obj) {
		document.getElementById("user_pw").disabled = false;
		document.getElementById("user_address").disabled = false;
		document.getElementById("user_phone").disabled = false;
		document.getElementById("tr_btn_modify").style.display = "block";
		document.getElementById("tr_btn").style.display = "none";
	}
	function modifyMemberInfo(obj) {
		var aa = {
			user_id : "${userVO.user_id}",
			user_pw : document.getElementById("user_pw").value,
			user_address : document.getElementById("user_address").value,
			user_phone : document.getElementById("user_phone").value,
			user_maxPrice : "${userVO.user_maxPrice}",
			user_grade : "${userVO.user_grade}"
		};
		$.ajax({
			type : "post",
			url : "${contextPath}/api/updateMember.do",
			contentType : "application/json",
			data : JSON.stringify(aa),
			success : function(data, textStatus) {
				alert("수정성공");
				location.href = '${contextPath}/member/myPage.do';
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다.");
			},
			complete : function(data, textStatus) {
			}
		});
	}
 	function modifyCart(param1,param2,param3) {
		var aa = {
			ordercnt :document.getElementById(param1).value,
			b_name :param2
		};
	 	$.ajax({
			type : "post",
			url : "${contextPath}/api/modifyCart.do",
			contentType : "application/json",
			data : JSON.stringify(aa),
			success : function(data, textStatus) {
				console.log(data);
				if(data < 0 ){
					data = 0;
				document.getElementById(param1).value = data;
				alert("감소할 수량이 없습니다");
				}else{
					console.log(data);
					document.getElementById(param1).value = data.ordercnt-1;
					document.getElementById(param3).value = data.ordercnt*data.b_price;
					alert("1개 감소");
				}
			},
			error : function(data, textStatus) {
				alert("감소할 수량이 없습니다");
			},
			complete : function(data, textStatus) {
			} 
		}); 
	} 
 	function 완전삭제(param1){
 		console.log(param1);
 	$.ajax({
 		type:"post",
 		url:"${contextPath}/api/완전삭제.do",
 		data:{cart_id:param1}
 	}).done(function(HttpStatus){
 		alert("삭제 성공");
 		location.href="/bookmall/member/myPage.do";
 	}).fail(function(){
 		alert("삭제 실패");
 	}); 
 	}
</script>
<style>
#tr_btn_modify {
	display: none;
}
</style>
</head>
<body>
	<header class="navbar navbar-expand-md navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#">My Page</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#nav-menu">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="nav-menu">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/member/main.do">메인 페이지로</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/member/buy.do?user_num=${userVO.user_num}">구매내역보기</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<p>
	<p>
	<form name="frm" method="post">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
				<table class="table table-striped" style="width: 100%">
					<tr>
						<td width="150" align="center" bgcolor="gray">아이디</td>
						<td><input type="text" class="form-control"
								value="${userVO.user_id }" disabled /> <input type="hidden"
								name="user_id" value="${userVO.user_id}" /></td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="gray">비밀번호</td>
						<td><input type="password" class="form-control"
								value="${userVO.user_pw}" name="user_pw" id="user_pw" disabled />
						</td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="gray">주소</td>
						<td><input type="text" class="form-control"
								value="${userVO.user_address}" name="user_address"
								id="user_address" disabled /></td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="gray">휴대폰 번호</td>
						<td><input type="text" class="form-control"
								value="${userVO.user_phone}" name="user_phone" id="user_phone"
								disabled /></td>
					</tr>
					<tr>
						<td width="150" align="center" bgcolor="gray" rowspan="2">누적금액</td>
					</tr>
					<tr>
						<td><input type="text" class="form-control"
								name="user_maxPrice" value="${userVO.user_maxPrice}" disabled />
						</td>
					</tr>
					<tr>
						<td width=20% align=center bgcolor=gray>등급</td>
						<td><input type="text" class="form-control"
								value="${userVO.user_grade}" disabled /></td>
					</tr>
					<tr id="tr_btn">
						<td colspan=2 align=center>
							<button type="button" class="btn btn-primary" onClick="mod()">수정하기</button>
							<a
							href="${contextPath}/member/deleteMember.do?user_id=${userVO.user_id}">
								<button type="button" class="btn btn-danger">회원탈퇴</button>
						</a>
							<button type="button" class="btn btn-success"
								onclick="location.href='${contextPath}/payment/form'">결제하기</button>
						</td>
					</tr>
					<tr id="tr_btn_modify" style="display: none">
						<td colspan="2" align="center">
							<button type="button" class="btn btn-primary"
								onClick="modifyMemberInfo(frm)">수정반영하기</button> <br> <a
							href="${contextPath}/member/myPage.do">수정 취소</a>
						</td>
					</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	<div class="container">
		<h3>장바구니 내역</h3>
		<table class="table-striped mx-auto" style="width: 80%">
			<thead class="thead-light">
				<tr>
					<th scope="col">책 제목</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">카테고리</th>
					<th scope="col">작업</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty sessionScope.list}">
						<tr>
							<td colspan="5" style="text-align: center">장바구니 내역이 비어있습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="cart" items="${list}" varStatus="status">
							<tr>
								<td><input type="text" class="form-control"
									id="${cart.b_name}" value="${cart.b_name}" disabled /></td>
								<td><input type="text" class="form-control"
									id="${status.index}" value="${cart.b_price}원" disabled /></td>
								<td>
									<div class="input-group">
										<input type="text" class="form-control" id="${cart.cart_id}"
											value="${cart.ordercnt}" disabled />
										<div class="input-group-append">
											<button class="btn btn-outline-secondary" type="button"
												onClick="modifyCart(${cart.cart_id},'${cart.b_name}','${status.index}')">-</button>
										</div>
									</div>
								</td>
								<td><input type="text" class="form-control"
									value="${cart.b_category}" disabled /></td>
								<td><button class="btn btn-danger"
										onClick="완전삭제(${cart.cart_id})">완전삭제</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>