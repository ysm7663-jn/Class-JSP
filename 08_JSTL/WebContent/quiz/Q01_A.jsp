<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 하나에 한 방식 밖에 안 된다 -->
	<%--
		 문제1. 나이를 속성으로 Q01_B.jsp 전달해서 
		 7세 이하: 미취학아동
		 13세 이하 : 초등학생
		 16세 이하 : 중학생
		 19세 이하 : 고등학생
		 20세 이상 : 성인 
	--%>

	<c:set var="age" value="10" scope="request" />		

	<jsp:forward page="Q01_B.jsp" />
		 

	<%-- 문제. 정수 값을 "파라미터"로 Q01_B.jsp 전달해서 절대값을 출력하시오. --%>

	<!-- 	<form action="Q01_B.jsp">
			<input type="text" name="n" />
			<button>전송</button>
		</form> -->
	
</body>
</html>