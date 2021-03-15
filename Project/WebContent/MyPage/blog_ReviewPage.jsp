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
<link rel="stylesheet" href="../assets/style/blog_ReviewPage.css" />
</head>
<body>

	<form>
		<div class="wrap">
			<div class="head_wrap">
				<div class="head_title">
					<div class="content">
						<div id="stationName">③김포공항역</div>
						오빠 시티뷰	
					</div>
				</div>
			</div>
			<br/>
			<div class="body_wrap">
				<div class="index_box">
					<input type="text" name="blog_when" id="blog_when" placeholder="언제 다녀오셨나요?" />
					<input type="text" name="blog_feeling" list="felling" id="blog_feeling" placeholder="어떤 기분에 갔나요?" />
					<datalist>
						<option value ="우울"/>
						<option value ="그냥 조금"/>
						<option value ="쏘쏘"/>
						<option value ="좋음"/>
						<option value ="행복"/>
					</datalist>
					
					
					<br/>
					
					<input type="text" name="blog_title" id="blog_title" placeholder="제목을 입력해주세요." />
				</div>
				<br/><br/>
				<!-- textarea인거 같은데 안에 +사진/글 어떻게 넣을지 -->
				<textarea rows="70" cols="90" name="blog_content" id="blog_content">

				</textarea>
			</div>
			<br/>
			<input type="button" value="등록" id="submit_btn" onclick="" />
			<input type="button" value="블로그미리보기" id="blog_view_btn" onclick="" />
		</div>
	</form>

</body>
</html>

<%@ include file="../template/footer.jsp" %>