<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.gdj59.bookmall.beans.BookVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }' />
<%@ page import="java.util.List"%>

<table class="table table-striped">

	<thead>
		<tr>
			<th scope="col">책번호</th>
			<th scope="col">책이름</th>
			<th scope="col">카테고리</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty searchName}">
				<c:forEach items="${searchName}" var="bookVO">
					<tr>
						<th scope="row">${bookVO.b_num}</th>
						<td><a href='/BookMall//book/bookListOne?b_num=<c:out value='${bookVO.b_num}'/>'>
						<c:out value="${bookVO.b_name}"/></a></td>
						<td>${bookVO.b_category}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${not empty listCategory}">
						<c:forEach items="${listCategory}" var="bookVO">
							<tr>
								<th scope="row">${bookVO.b_num}</th>
								<td><a href='/BookMall//book/bookListOne?b_num=<c:out value='${bookVO.b_num}'/>'>
						<c:out value="${bookVO.b_name}"/></a></td>
								<td>${bookVO.b_category}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="bookVO">
							<tr>
								<th scope="row">${bookVO.b_num}</th>
								<td><a href='/BookMall/book/bookListOne?b_num=<c:out value='${bookVO.b_num}'/>'>
						<c:out value="${bookVO.b_name}"/></a></td>
								<td>${bookVO.b_category}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</c:otherwise>
		</c:choose>


	</tbody>
</table>


<div class>
	<nav aria-label="Page navigation example">
		<ul class="pagination">

			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.startPage-1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="page_item  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a class="page-link" href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</nav>
</div>


<form id='actionForm' action="/BookMall/book/bookList" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
</form>



<a href="${root}/book/bookIns?b_category=${b_category}"
	class="btn btn-success btn-lg active" role="button" aria-pressed="true">책등록</a>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {
							if (searchName==null) {
							self.location = "/BookMall/book/bookList";
								
							}
							else {
								self.location = "/BookMall/book/bookList/search";
							}	
						});

						var actionForm = $("#actionForm");

						$(".page_item a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});

					});
</script>


