<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="BBS삭제확인" name="title" />
</jsp:include>

<script>
	function fn_bbsDelete(f) {
		if ('${bbsDto.bbs_pw}' != f.bbs_pw.value) {
			alert('비밀번호를 확인하세요.');
			return;
		}
		if (confirm('삭제할까요?')) {
			f.action = '/MyHome/bbsDelete.bbs';
			f.submit();
		}
	}
</script>

<form method="post">
	삭제비밀번호<br/>
	<input type="password" name="bbs_pw" /><br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="page" value="${param.page}" />
	<input type="button" value="삭제하기" onclick="fn_bbsDelete(this.form)" />
</form>

<%@ include file="../template/footer.jsp" %>







