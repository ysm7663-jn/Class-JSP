<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
		int age = Integer.parseInt(request.getParameter("age"));
	%>

	<h1>성인</h1>
	
	당신의 나이는 <%=age %>이므로 주류 구매가 가능합니다.	<br/>
	
	<a href="<%= request.getContextPath() %>/test/q02_A.jsp">처음으로 이동하기</a>

</body>
</html>