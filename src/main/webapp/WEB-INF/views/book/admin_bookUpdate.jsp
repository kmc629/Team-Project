<%@page import="org.apache.ibatis.annotations.Update"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.gdj59.bookmall.beans.BookVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Update</title>
</head>
<body>
<%
	BookVO bookVo = (BookVO)request.getAttribute("update");
%>	

<form method="post" action="/book/bookUpdate">
	<label for="b_num">번호</label>
	<input type="number" id="b_num" name="b_num" value="${update.b_num}" readonly>
	<br>
	<label for="b_name">책제목</label>
	<input type="text" id="b_name" name="b_name" value="${update.b_name}">
	<br>
	<label for="b_price">가격</label>
	<input type="number" id="b_price" name="b_price" min="0" value="${update.b_price}">
	<br>
	<label for="b_stock">재고</label>
	<input type="number" id="b_stock" name="b_stock" min="0" value="${update.b_stock}">
	<br>
	<label for="b_category">카테고리</label>
	<input type="text" id="b_category" name="b_category" value="${update.b_category}">
	<br>
	<label for="b_purchase">누적구매횟수</label>
	<input type="number" id="b_purchase" name="b_purchase" min="0" value="${update.b_purchase}">
	<br>
	<input type="submit" value="수정완료">
</form>

</body>
</html>