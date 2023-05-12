<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="com.gdj59.bookmall.beans.BookVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookListOne</title>
<!-- 	부트스트랩코드 -->

</head>
<body>


<main>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">책번호</th>
      <th scope="col">책이름</th>
      <th scope="col">책가격</th>
      <th scope="col">재고</th>
      <th scope="col">카테고리</th>
      <th scope="col">누적구매회수</th>
      <th scope="col">수정</th>
    </tr>
  </thead>
  <tbody>
     <tr> 
      <th scope="row">${listOne.b_num}</th>
      <td>${listOne.b_name}</td>
      <td>${listOne.b_price}</td>
      <td>${listOne.b_stock}</td>
      <td>${listOne.b_category}</td>
      <td>${listOne.b_purchase}</td>
      <td><a href="${root }/book/bookUpdate?b_num=${listOne.b_num}">글 수정</a></td>
    </tr>
  </tbody>
</table>
</main>

</body>
</html>