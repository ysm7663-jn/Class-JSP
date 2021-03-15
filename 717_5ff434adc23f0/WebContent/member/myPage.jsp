<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>

<script>
	
	$(function(){
		$('#updatePwBtn').click(fn_updatePw);
		$('#updateBtn').click(fn_update);
	});
	
	function fn_updatePw() {
		if ('${loginDto.mPw}' != $('#mPw0').val()) {
			alert('비밀번호를 확인하세요.');
			return;
		}
		if ('${loginDto.mPw}' == $('#mPw').val()) {
			alert('같은 비밀번호로 변경할 수 없습니다.');
			return;
		}
		if ($('#mPw').val() == '') {
			alert('비밀번호를 입력하세요.');
			$('#mPw').focus();
			return;
		} else if ($('#mPw').val() != $('#mPw2').val()) {
			alert('비밀번호를 확인하세요.');
			return;
		}
		$.ajax({
			url: '/MyHome/MemberChangePw',
			type: 'post',
			data: $('#f').serialize(),
			dataType: 'text',
			success: function(responseText){
				if (responseText.trim() == 'no') {
					$('#updatePwResult').text('비밀번호가 변경되지 않았습니다.').css('color', 'red');
				} else {
					$('#updatePwResult').text('비밀번호가 변경되었습니다.').css('color', 'blue');
					$('#mPw0').val('');
					$('#mPw').val('');
					$('#mPw2').val('');
				}
			},
			error: function(){ alert('실패'); }
		});
	}
	
	function fn_update() {
		if ('${loginDto.mName}' == $('#mName').val() &&
			'${loginDto.mEmail}' == $('#mEmail').val() &&
			'${loginDto.mPhone}' == $('#mPhone').val() &&
			'${loginDto.mAddress}' == $('#mAddress').val()) {
			alert('변경할 회원 정보가 없습니다.');
			return;
		}
		if ($('#mEmail').val() == '') {
			alert('이메일은 필수입니다.');
			return;
		}
		$.ajax({
			url: '/MyHome/MemberUpdate',
			type: 'post',
			data: $('#f').serialize(),
			dataType: 'json',
			success: function(responseObj) {
				if (responseObj.result) {
					alert('회원 정보가 수정되었습니다.');
					location.href = '/MyHome/myPage.member';
				} else {
					alert('회원 정보가 수정되지 않았습니다.');
				}
			},
			error: function(){ alert('실패'); }
		});
	}
	
</script>

<form id="f">

	아이디<br/>
	${loginDto.mId}<br/><br/>
	
	현재 비밀번호<br/>
	<input type="password" name="mPw0" id="mPw0" /><br/><br/>
	
	비밀번호 변경<br/>
	<input type="password" name="mPw" id="mPw" /><br/><br/>
	
	비밀번호 확인<br/>
	<input type="password" name="mPw2" id="mPw2" />
	<input type="button" value="비밀번호 변경" id="updatePwBtn"/>
	<span id="updatePwResult"></span><br/><br/>
	
	성명<br/>
	<input type="text" name="mName" id="mName" value="${loginDto.mName}" /><br/><br/>
	
	이메일<br/>
	<input type="text" name="mEmail" id="mEmail" value="${loginDto.mEmail}" /><br/><br/>
	
	전화번호<br/>
	<input type="text" name="mPhone" id="mPhone" value="${loginDto.mPhone}" /><br/><br/>
	
	주소<br/>
	<input type="text" name="mAddress" id="mAddress" value="${loginDto.mAddress}" /><br/><br/>
	
	가입일<br/>
	${loginDto.mRegDate}<br/><br/>
	
	<%-- hidden --%>
	<input type="hidden" name="mNo" value="${loginDto.mNo}" />
	<input type="hidden" name="mId" value="${loginDto.mId}" />
	<input type="hidden" name="mRegDate" value="${loginDto.mRegDate}" />
	
	<input type="button" value="정보 수정하기" id="updateBtn" />
	<input type="button" value="되돌아가기" onclick="location.href=document.referrer" />
	
</form>

<%@ include file="../template/footer.jsp" %>