<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.getRequestDispatcher("/ex02/Ex03_C.jsp").forward(request, response);
%>

<%-- JSP에서 사용할 수 있는 JSP 액션태그가 있습니다. --%>
<%-- 액션 태그들은 jsp를 prefix 값으로 가집니다. --%>

<%--
	1. 액션 태그를 이용해서 forward 할 수 있습니다.
	2. 파라미터를 추가해서 이동할 수 있습니다.
	   원래 request의 파라미터 + 새로운 파라미터
	3. 새로운 파라미터를 추가할 때 param 태그를 사용합니다.
--%>

<jsp:forward page="/ex02/Ex03_C.jsp">
	<jsp:param value="100" name="num3" />
</jsp:forward>