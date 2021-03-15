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
<link rel="stylesheet" href="../assets/style/addPlace.css" />
</head>
<body>

	<div class="wrap">
		<div class="head_wrap">
			<div id="head_title">
				장소추가
			</div>
		</div>
		<br/>
		<div class="body_wrap">
			<div class="input_box">
				장소 이름<br/>
				<input type="text" name="placeName" id="placeName" placeholder="장소명 입력" /><br/>
				
				카테고리<br/>
				<input type="text" list="categories" name="category" id="category" placeholder="이 장소에 가장 잘 맞는 카테고리 검색 및 선택" />
				<datalist id="categories">
					<option value="데이트" />			
					<option value="가족" />			
					<option value="분위기" />			
					<option value="조용함" />			
				</datalist>
				<br/><br/><br/><br/>
			</div>
			
			<div class="place_input_box">
				<span id="plcae_input_name">장소</span>
			<br/><br/><br/>
				도시<br/>
				<input type="text" name="cityName" id="cityName" placeholder="도시 입력" /><br/>
				
				지하철역<br/>
				<input type="text" name="stationName" id="stationName" placeholder="지하철역명 입력" /><br/>
				
				상세주소<br/>
				<input type="text" name="realAddress" id="realAddress" placeholder="도로명 및 건물 번호 입력" /><br/>
				
				추가주소정보<br/>
				<input type="text" name="addInfo" id="addInfo" placeholder="지번,교차로,플라자,광장 등" /><br/><br/>
				
				<div id="map">
				
				</div>
				<br/><br/>
			</div>
			<input type="button" value="전송하기" id="addPlace_submit_btn" />
			<input type="button" value="취소" id="cancel_btn" />
		</div>
	</div>

</body>
</html>

<%@ include file="../template/footer.jsp" %>