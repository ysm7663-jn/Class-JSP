<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="게시물수정" name="title" />
</jsp:include>

<script>
 function fn_bbsUpdate(f) {
	 // session에 올라가있는 비밀번호랑 비교
	 if('${bbsDto.bbs_pw}' != f.bbs_pw.value) {
		 alert('비밀번호를 확인하세요.');
		 f.bbs_pw.focus();
		 return;
	 }
	 f.action = '/MyHome/bbsUpdate.bbs';
	 f.submit();
 }
</script>

<form method="post">
	작성자<br/>
	${bbsDto.bbs_writer}"<br/><br/>
	
	작성IP<br/>
	${bbsDto.bbs_ip}"<br/><br/>
	
	작성일<br/>
	${bbsDto.bbs_date}"<br/><br/>
	
	제목<br/>
	<%-- session에 올라가 있는 제목이 값으로 설정 --%>
	<input type="text" name="bbs_title" value="${bbsDto.bbs_title}" /><br/><br/>
	
	내용<br/>
	<textarea rows="3" cols="40" name="bbs_content">${bbsDto.bbs_content}</textarea><br/><br/>
	
	수정비밀번호
	<input type="password" name="bbs_pw" />
	
	<%-- hidden 
	 bbs_no를 통해 게시물을 알아내고 수정한다.
	 page는 파라미터로 보내고 있다. 즉 파라미터로 받으면 된다.
	 page는 view에서 어떤 페이지번호를 보고있는지 확인하기 위해서 파라미터로 보낸다.
	--%>
	<input type="hidden" name="bbs_no" value="${bbsDto.bbs_no} "/>
	<input type="hidden" name="page" value="${param.page} "/>
	
	<input type="button" value="게시물수정하기" onclick="fn_bbsUpdate(this.form)" />
	<%-- page를 가지고 해당페이지로 이동한다. --%>
	<input type="button" value="목록으로이동하기" onclick="location.href='/MyHome/bbsListPage.bbs?page=${param.page}'"/>
	
</form>

<%@ include file="../template/footer.jsp" %>