<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.js"></script>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<script>
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = '(' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('roadAddress').value = fullRoadAddr;
						document.getElementById('jibunAddress').value = data.jibunAddress;
					}
				}).open();
	}
</script>
<script>
	function overLap() {
		var user_id = $("#user_id").val();
		if (user_id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : true,
			url : "${contextPath}/member/overLap.do",
			dataType : "text",
			data : {
				user_id : user_id
			},
			success : function(result) {
				console.log(result);
				if (result <= 0) {
					alert("사용할 수 있는 ID입니다.");
					$('#doubleCheck').prop("disabled", true);
					$('#user_id').val(user_id).prop("readonly", true);
				} else {
					alert("사용할 수 없는 ID입니다.");
					$('#user_id').val(" ");
				}
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다.");
			}
		});
	}

	function register() {
		var isDisabled = $('#doubleCheck').prop("disabled");
		var user_pw = $('#user_pw').val();
		var zipcode = $('#zipcode').val();
		var roadAddress = $('#roadAddress').val();
		var jibunAddress = $('#jibunAddress').val();
		var namujiAddress = $('#namujiAddress').val();
		var hp2 = $('#hp2').val();
		var hp3 = $('#hp3').val();
		if (isDisabled != true) {
			alert("id 중복확인을 하세요");
			return;
		}if(user_pw == "") {
			alert("비밀번호를 입력하세요");
			return;
		}
		 if(zipcode == "" ){
			 alert("주소를 입력하세요");
				return;
		 }
		 if(roadAddress == "" ){
			 alert("주소를 입력하세요");
				return;
		 }
		 if(jibunAddress == "" ){
			 alert("주소를 입력하세요");
				return;
		 }
		 if(namujiAddress == "" ){
			 alert("주소를 입력하세요");
				return;
		 }
		if(hp2 == "" ) {
			alert("휴대폰 번호 입력하세요");
			return;
		}
		if(hp3=="") {
			alert("휴대폰 번호 입력하세요");
			return;
		}
		 else {
			var form = $('#frmLogin');
			form.method = "post";
			form.action = "join_proc.do";
			form.submit();
		}  
	}
</script>

<title>Insert title here</title>

</head>
<link rel="shortcut icon" href="#">
<body>
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-md-6 col-lg-5 mt-5">
				<h1 class="text-center mb-4"> 회원가입</h1>
				<form id="frmLogin" action="join_proc.do" method="post">
					<div class="form-group">
						<label for="user_id">아이디</label>
						<div class="input-group">
							<input type="text" id="user_id" name="user_id" class="form-control">
							<div class="input-group-append">
								<button class="btn btn-secondary" type="button" id="doubleCheck" onClick="overLap()">중복확인</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="user_pw">비밀번호</label>
						<input id="user_pw" type="password" name="user_pw" class="form-control">
					</div>
					<div class="form-group">
						<label for="zipcode">주소</label>
						<div class="input-group">
							<input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호">
							<div class="input-group-append">
								<button class="btn btn-secondary" type="button" onclick="address()">우편번호찾기</button>
							</div>
						</div>
						<p>
							<label for="roadAddress">지번 주소</label>
							<input type="text" id="roadAddress" name="roadAddress" class="form-control" size="50" required>
						</p>
						<p>
							<label for="jibunAddress">도로명 주소</label>
							<input type="text" id="jibunAddress" name="jibunAddress" class="form-control" size="50" required>
						</p>
						<p>
							<label for="namujiAddress">나머지 주소</label>
							<input id="namujiAddress" type="text" name="namujiAddress" class="form-control" size="50" required>
						</p>
					</div>
					<div class="form-group">
						<label for="hp2">휴대폰 번호</label>
						<div class="input-group">
							<select class="form-control" name="hp1">
								<option>010</option>
								<option>011</option>
							</select>
							<input id="hp2" size="10px" type="text" name="hp2" class="form-control" required>
							<input id="hp3" size="10px" type="text" name="hp3" class="form-control" required>
						</div>
					</div>
					<div class="text-center">
						<button type="button" onclick="register()" class="btn btn-primary btn-lg btn-block">회원가입</button>
						<p><p><p>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>