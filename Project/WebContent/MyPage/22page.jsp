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
<link rel="stylesheet" href="../assets/style/22page.css" />
</head>
<body>

	<div class="wrap">
		<div class="head_wrap">
			<div class="head_title">
				<div id="title">찜리스트</div>
			</div>
			
			<div class="station_wrap">
				<div id="station_name"><a href="">광진역2</a></div>
				<div id="station_name"><a href="">서울역1</a></div>
				<div id="station_name"><a href="">강변역1</a></div>
				<div id="station_name"><a href="">여의나루역2</a></div>
			</div>
			
			<div id="line"> </div>
			
			
			<div class="head_content">
				<div class="box_box">
					<div class="choice"><a href="">이미지</a></div>
					<div class="choice"><a href="">내용</a></div>
				</div>
				<div class="box_box">
					<div class="choice"><a href="">이미지</a></div>
					<div class="choice"><a href="">내용</a></div>
				</div>
				<div class="box_box">
					<div class="choice"><a href="">이미지</a></div>
					<div class="choice"><a href="">내용</a></div>
				</div>
				<div class="box_box">
					<div class="choice"><a href="">이미지</a></div>
					<div class="choice"><a href="">내용</a></div>
				</div>
				<div class="box_box">
					<div class="choice"><a href="">이미지</a></div>
					<div class="choice"><a href="">내용</a></div>
				</div>
			</div>
			<br/>
			<input type="button" value="더보기" name="more_btn" id="more_btn" onclick="" />
		</div>
	</div>
</body>
</html>

<%@ include file="../template/footer.jsp" %>