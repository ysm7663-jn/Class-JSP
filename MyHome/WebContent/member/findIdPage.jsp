<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="아이디찾기" name="title" />
</jsp:include>

<script>
	
	// AJAX를 통한 ID찾기 
	// 페이지 로드 이벤트
	$(document).ready(function(){
		$('#findIdBtn').click(fn_findId); 		  // findIdBtn이라는 id를 가지고 있는 버튼을 클릭하면 안에 해당 함수를 호출한다.
	});
	
	function fn_findId() {
		$.ajax({
			url: '/MyHome/MemberFindId', 		  // 매핑(/MemberFindId)을 가진 command패키지의 별도의 Servlet으로 간다. // url : action 이동할 경로
			type: 'post',						  // 보내는 방법 : post
			data: 'mEmail=' + $('#mEmail').val(), // url로 보내는 파라미터
			dataType: 'text',					  // 받아오는 데이터의 타입
			success:function(responseText){  	  // 성공했을 때 responseText(받아오는데이터값)로 온다(founId가 온다(찾은아이디))
												  // responseText : 받아 오는 데이터
				if(responseText.trim() == 'no') { // trim() : 좌,우 공백제거								  
					$('#findIdResult').text('해당하는 회원 정보가 없습니다') 	  // setter로 텍스트를 넣는다.
					$('#findIdResult').css('color', 'red');
				} else {
					$('#findIdResult').text('회원님의 아이디는 "' + responseText + '"입니다.') 	
					$('#findIdResult').css('color', 'limegreen');
				}
			},
			error: function(){ alert('실패'); } 	  // 실패 시
		});
	}
	
</script>

<form>
	가입 당시 이메일을 입력하세요.<br/><br/>
	<%-- 제이쿼리에게 아이디를 알려주기 위해서 id 설정 --%>
	<input type="text" name="mEmail" id="mEmail" />
	<input type="button" value="아이디 찾기" id="findIdBtn" />
	<input type="button" value="로그인 하러가기" onclick="location.href='/MyHome/loginPage.member'"/>
</form>
<br/><br/>

<%-- 아이디 찾기 결과가 나타날 위치 / AJAX로 페이지 이동없이 데이터만 가져온다. --%>
<div id="findIdResult"></div>

<%@ include file="../template/footer.jsp" %>