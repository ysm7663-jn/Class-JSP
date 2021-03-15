<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header1.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/style/common.css" />
<link rel="stylesheet" href="../assets/style/21page.css" />
</head>
<body>

	<div class="wrap">
		<div class="head_wrap">
			<div class="head_title">
				<div id="title">내 블로그</div>
			</div>
			<div class="head_content">
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
			</div>
			<br/>
			<input type="button" value="더보기" name="more_btn" id="more_btn" onclick="" />
		</div>
		
		<div class="head_wrap">
			<div class="head_title">
				<div id="title">내 리뷰</div>
			</div>
			<div class="head_content">
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
				<div class="box_box">
					<div class="choice"></div>
					<div class="choice"></div>
				</div>
			</div>
			<br/>
			<input type="button" value="더보기" name="more_btn" id="more_btn" onclick="" />
		</div>
	</div>

</body>
</html>

<%@ include file="../template/footer.jsp" %>