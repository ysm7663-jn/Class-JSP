<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 항상 header.jsp는 페이지의 제목을 받아온다.
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "마이MALL";  // 기본제목
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title%></title>
<link rel="stylesheet" href="../assets/style/common.css">
</head>
<body>
	<div class="head-wrap">
		<ul>
			<li>홈</li>
			<li>방명록</li>
			<li>게시판</li>
			<li>리뷰</li>
			<li>Q&A</li>
		</ul>
	</div>
	<!-- main-wrap 시작 -->
	<div class="wrap">
		<div class="main-wrap">