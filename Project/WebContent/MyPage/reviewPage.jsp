<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header1.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<%-- css --%>
<link rel="stylesheet" href="../assets/style/common.css" />
<link rel="stylesheet" href="../assets/style/reviewPage.css" />
</head>
<body>

	<div class="wrap">
		<div class="head_wrap">
			<div class="img">upload</div>
			<div class="content">
				<div id="stationName">③김포공항역</div>
				오빠 시티뷰
			</div>
		</div>
		<br/><br/>
		<div class="body_wrap">
			<!-- 별점기능 --> 
			체험 평가<br/>
			<span id="point">○ ○ ○ ○ ○</span><br/><br/>
			
			<div class="input_title">리뷰남기기</div>
			<textarea rows="6" cols="30" name="review_content" id="review_content"></textarea><br/><br/>
			
			<div class="review">
				<div class="input_title">리뷰의 제목</div>
				<input type="text" name="review_title" id="review_title" /><br/><br/>
			</div>
			
			<div class="review">
				<div class="input_title">언제 다녀오셨나요?</div>
				<input type="text" name="review_when" id="review_when" /><br/><br/>
			</div>
			
			<div class="review">
				<div class="input_title">누구와 갔나요?</div>
				<input type="text" name="review_who" id="review_who" /><br/><br/>
			</div>
			<!-- ㅁ버튼이여도 되는지, 기분 여러개? 한 개? -->
			<div class="review">
				<div class="input_title">어떤 기분에 갔나요?</div>
				<input type="checkbox" name="feeling" value="loney">우울
				<input type="checkbox" name="feeling" value="normal">그냥조금
				<input type="checkbox" name="feeling" value="soso">쏘쏘
				<input type="checkbox" name="feeling" value="good">좋음
				<input type="checkbox" name="feeling" value="happy">행복
			</div>
			<br/><br/>
			<!-- jsp -->
			사진업로드<br/>
			<div id="img_upload"></div>
			<br/><br/>
			
			<input type="checkbox" name="agree" value="yes" />이 내용은 많은 데이터에 사용되어 마케팅, 공유의 목적으로 사용될 것입니다. 그래도 상관없으시면 체크해주세요.
			<br/><br/><br/>
			
			<input type="button" id="submit_btn" value="등록" onclick="location.href=''" />
			<input type="button" id="review_view_btn" value="리뷰미리보기" onclick="" />
		</div>
	</div>

</body>
</html>

<%@ include file="../template/footer.jsp" %>