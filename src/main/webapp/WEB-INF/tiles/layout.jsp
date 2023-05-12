<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/metisMenu/metisMenu.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="${pageContext.request.contextPath}/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/vendor/reply/reply.js"></script>
    

<%-- <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.js"></script>
<meta charset="UTF-8">
<%-- <link type="text/css" rel="stylesheet"href="<%=request.getContextPath()%>/css/bootstrap.min.css"> --%>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath}/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
<title>Insert title here</title>
</head>
<body>

	<div id="top"><tiles:insertAttribute name="top" /></div>
    <div id="main"><tiles:insertAttribute name="mid" ignore="true" /></div>   
    <div id="bookList"><tiles:insertAttribute name="content" ignore="true" /></div>  
    <div id="reply"><tiles:insertAttribute name="reply" /></div>
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
  
       


    <!-- Custom Theme JavaScript -->
    
	
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    
   
</body>
</html>