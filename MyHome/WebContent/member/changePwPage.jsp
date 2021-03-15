<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호변경" name="title" />
</jsp:include>

<script type="text/javascript">
	
	$(function(){
		$('#changePwBtn').click(fn_changePw);
	});
	
	function fn_changePw() {
		if ($('#mPw').val() == '') {
			alert('비밀번호를 입력하세요.');
			$('#mPw').focus();
			return;
		}
		if ($('#mPw').val() != $('#mPw2').val()) {
			alert('비밀번호 입력을 확인하세요.');
			return;
		}
		
		$.ajax({
			url: '/MyHome/MemberChangePw', 	  // 하나의 서블릿을 만든다.(command)
			type: 'post',
			// data: 'mPw=' + $('#mPw').val() + '&mNo=' + $('#mNo').val(), // JSON으로 보낸다 // 폼.serialize()
			data: $('#f').serialize(), 		  // 2개이상 파라미터 보낼 경우 사용       // form전체를 보낸다.
			dataType: 'text',				  // 받는 데이터의 타입("yes","no" == text)			   // (보내는타입 : ContentType)
			success: function(responseText) { // responseText에는 no,yes가 들어있다.
				if (responseText.trim() == 'no') {
					alert('비밀번호가 변경되지 않았습니다.');
				} else {
					alert('새로운 비밀번호로 변경되었습니다.');
					location.href = '/MyHome/loginPage.member';
				}
			},
			error: function(){ alert('실패'); }
		});
	}
	
</script>

<form id="f">
	<label for="mPw">새로운 비밀번호 입력</label><br/>
	<input type="password" id="mPw" name="mPw" /><br/><br/>
	<label for="mPw2">비밀번호 확인</label><br/>
	<input type="password" id="mPw2" /><br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="mNo" id="mNo" value="${param.mNo}" />
	
	<input type="button" value="비밀번호 변경" id="changePwBtn" />
</form>

<%@ include file="../template/footer.jsp" %>
