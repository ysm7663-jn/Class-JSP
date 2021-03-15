<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="회원비밀번호수정" name="title" />
</jsp:include>

<script>
	function fn_adminPwUpdate(f) {
		// var checkPw = '비밀번호 정규식';
		if(f.mPw.value == ${param.mPw}) {
			alert('기존 비밀번호와 동일합니다.');
			f.mPw.focus();
			return;
		}
		if(f.mPw.value == '') {
			alert('비밀번호를 입력해주세요.');
			f.mPw.focus();
			return;
		}
		alert('비밀번호수정을 진행합니다.');
		f.action = '/MyHome/adminPwUpdate.admin';
		f.submit();
	}
</script>

<form method="post">
	순번
	${param.mNo}<br/><br/>
	
	비밀번호<br/>
	<input type="text" name="mPw" /><br/><br/>

	성명<br/>
	${param.mName}<br/><br/>
	
	연락처<br/>
	${param.mPhone}<br/><br/>
	
	이메일<br/>
	${param.mEmail}<br/><br/>
	
	주소<br/>
	${param.mAddress}<br/><br/>
	
	가입일<br/>
	${param.mRegDate}<br/><br/>
	
	
	<%-- hidden --%>
	<input type="hidden" name="mNo" value="${param.mNo}" />
	<input type="hidden" name="page" value="${param.page}" />
	
	
	<input type="button" value="수정하기" onclick="fn_adminPwUpdate(this.form)"/>
	<input type="reset" value="다시작성하기" />
	<input type="button" value="취소" onclick="history.back();" />
</form>

<%@ include file="../template/footer.jsp" %>