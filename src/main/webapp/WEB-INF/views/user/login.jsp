<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:if test="${not empty msg}">
<script>
        alert("${msg}");
    </script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
</head>
	<style>
		body {
			height: 100%;
			display: flex;
			align-items: center;
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}

		.form-signin {
			width: 100%;
			max-width: 330px;
			padding: 15px;
			margin: auto;
		}

		.form-signin .checkbox {
			font-weight: 400;
		}

		.form-signin .form-floating:focus-within {
			z-index: 2;
		}

		.form-signin input[type="email"] {
			margin-bottom: -1px;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 0;
		}

		.form-signin input[type="password"] {
			margin-bottom: 10px;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
		}
	</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="login_proc.do" method="post">
			<h1 class="h3 mb-3 fw-normal">BookMall</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디" required>
				<label for="user_id"></label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호" required>
				<label for="user_pw"></label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=6b6b2d261e1bd0e80490d3c31e576b12&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code"><img src="../image/kakao_login_medium (1).png"></a>
			<a href="join.do" class="mt-3 mb-3">회원가입</a>
		</form>
	</main>
</body>
</html>

	<br>
</body>
</html>
		