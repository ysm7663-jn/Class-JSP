<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="신규회원추가" name="title" />
</jsp:include>

<script>
	function fn_adminInsertMember(f) {
		if(
		   f.mPw.value == '' ||
		   f.mName.value == '' ||
		   f.mPhone.value == '' ||
		   f.mEmail.value == '' ||
		   f.mAddress.value == '') {
			alert('정확한 정보를 입력해주세요.');
			return;
		}
		f.action = '/MyHome/adminInsertMemberUpdate.admin';
		f.submit();
	}
</script>

<form method="post">

	<h3>신규 회원 추가</h3>
	
	순번<br/>
	<input type="hidden" name="mNo" />
	
	아이디<br/>
	<input type="text" name="mId" /><br/><br/>
	
	비밀번호<br/>
	<input type="text" name="mPw" /><br/><br/>
	
	성명<br/>
	<input type="text" name="mName" /><br/><br/>
	
	연락처<br/>
	<input type="text" name="mPhone" /><br/><br/>
	
	이메일<br/>
	<input type="text" name="mEmail" /><br/><br/>
	
	주소<br/>
	<input type="text" name="mAddress" /><br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="mId" value="${loginDto.mId}" />
	
	<input type="button" value="작성완료" onclick="fn_adminInsertMember(this.form)" />
	<input type="reset" value="다시작성" />
	<input type="button" value="목록으로이동" onclick="location.href='/MyHome/boardListPage.board?page=${param.page}'" />

</form>

<%@ include file="../template/footer.jsp" %>