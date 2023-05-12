<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.js"></script>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/css/bootstrap.css">
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${root}">메인</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="${root}/member/myPage.do">마이페이지</a></li>
    </ul>
  </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-6">
        <p><p>
            <h3>주문자 정보</h3>
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="id" class="col-sm-3 control-label">아이디</label>
                    <div class="col-sm-9">
                        <input type="text" name="id" class="form-control" value="${userVO.user_id}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="tel" class="col-sm-3 control-label">전화번호</label>
                    <div class="col-sm-9">
                        <input type="text" name="tel" class="form-control" value="${userVO.user_phone}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="grade" class="col-sm-3 control-label">회원등급</label>
                    <div class="col-sm-9">
                        <input type="text" name="grade" class="form-control" value="${userVO.user_grade}">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-6">
        <p><p>
            <h3>배송지</h3>
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">배송지</label>
                    <div class="col-sm-9">
                        <input type="text" name="address" class="form-control" value="${userVO.user_address}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">배송 요청사항</label>
                    <div class="col-sm-9">
                        <select class="form-control">
                            <option selected="selected">배송 시 요청사항을 선택해주세요.</option>
                            <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                            <option value="부재 시 택배함에 넣어주세요.">부재 시 택배함에 넣어주세요.</option>
                            <option value="문 앞에 놓아주세요.">문 앞에 놓아주세요.</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <hr>

    <h3 id="orderInfo">주문 정보</h3>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>책번호</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>주문금액</th>
                </tr>
            </thead>
            <c:forEach var="cart" items="${cartList}">
                <tr>
                    <td id="bookNum">${cart.b_num}</td>
                    <td id="productName">${cart.b_name}</td>
                    <td id="count">${cart.ordercnt}</td>
                    <td id="price">${cart.b_price}</td>
                </tr>
            </c:forEach>
        </table>
        <button id="payBtn" onclick="requestPay('${string}','${totalPrice }')">결제하기</button>
</div>
<script>
var IMP = window.IMP;
IMP.init("imp87880182"); // 예: imp00000000

function requestPay(totalName , totalPrice) {
	  // IMP.request_pay(param, callback) 결제창 호출
	  var productName = $("#productName").text();
	  var price = parseInt($("#price").text());

	  IMP.request_pay({
	    pg: "kakaopay",
	    pay_method: "card",
	    merchant_uid: "merchant_" + new Date().getTime(),
	    name: totalName,
	    amount: totalPrice,
	    buyer_name: "${userVO.user_id}",
	    buyer_tel: "${userVO.user_phone}",
	    buyer_addr: "${userVO.user_address}",
	  },  function(rsp) {
		  console.log(rsp);
	        // 결제검증
	        $.ajax({
	            type : "POST",
	            url : "/BookMall/payment/success/" + rsp.imp_uid,
	            headers: {"content-type": "application/json"},
	        }).done(function(data) {
				console.log(data);
	            if(rsp.paid_amount == data.response.amount){
	                alert("결제 및 결제검증완료");

	                //결제 성공 시 비즈니스 로직
	                $("#orderInfo").html('결제 완료');
	                $("#payBtn").hide();
					
	            } else {
	                alert("결제 실패");
	            }
	        });
	    });
	}
  </script>


</body>
</html>