<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	/* 로그인의 성공 실패 여부는 session의 loginDto 존재 유무를 확인하면 된다. */
	// session이 비어있으면 null이 아닌 ''로 비교해야한다.★★★★★
	// session도 '${param.mId}' 처럼 문자열로 받는다.
   if ('${loginDto}' != '') {
		alert('${param.mId}' + '님 환영합니다.');
		location.href = '/MyHome/index.member';
	} else {
		alert('제출된 정보와 일치하는 회원이 없습니다.');
		location.href = '/MyHome/loginPage.member';
	}
</script>