<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />




<nav class="navbar navbar-expand navbar-dark bg-dark"
	aria-label="Second navbar example">
	<div class="container-fluid">
		<a class="navbar-brand" href="${root }" style="font-size: 35px"><b>BookMall</b></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${root }/book/bookList">전체</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${root }/book/bookList?b_category=1">소설</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${root }/book/bookList?b_category=2">자기계발</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${root }/book/bookList?b_category=3">역사</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${root }/book/bookList?b_category=4">과학</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="${root }/book/bookList?b_category=5">문학</a>
				</li>
			</ul>
			<c:choose>
				<c:when test="${isLogOn}">
					<div class="btn-group">
						<button type="button" class="btn btn-light"
							onclick="location.href='${root}/member/myPage.do'">회원정보</button>
						<button type="button" class="btn btn-light"
							onclick="location.href='${root}/member/logout.do'">로그아웃</button>
						&nbsp &nbsp
					</div>
				</c:when>
				<c:otherwise>
					<div class="btn-group">
						<button type="button" class="btn btn-light"
							onclick="location.href='${root}/member/loginPage.do'">로그인</button>
						<button type="button" class="btn btn-light"
							onclick="location.href='${root}/member/join.do'">회원가입</button>
						&nbsp &nbsp
					</div>
				</c:otherwise>
			</c:choose>

			<form id='searchForm' role="search"
				action="${root}/book/bookList/search" method="get">
				<input type="text" name='keyword'
					value='<c:out value='${pageMaker.cri.keyword}'/>' /> <input
					type='hidden' name='pageNum'
					value='<c:out value='${pageMaker.cri.pageNum}'/>' /> <input
					type='hidden' name='amount'
					value='<c:out value='${pageMaker.cri.amount}'/>' />

				<button class='btn btn-light' type="submit">Search</button>
			</form>
		</div>

	</div>
</nav>

