<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${result eq true}">
	<%-- 성공시 이동 --%>
	<jsp:forward page="guestViewPage.jsp" />
</c:if>

<c:if test="${result eq false}">
	<%-- 실패시 이동 --%>
	<script>
		alert('방명록을 열 수 없습니다. 다시 시도하세요.');
		location.href = '/MyHome/guestListPage.guest';
	</script>
</c:if>