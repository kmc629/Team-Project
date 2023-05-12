<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
</head>
<body>
	<h1>결제가 완료되었습니다!</h1>
	<h2>구매하신 상품 목록</h2>
	<table>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
			<c:forEach var="item" items="">
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
	</table>
	<hr>
	<h3>총 결제 금액 :  원</h3>
</body>
</html>
