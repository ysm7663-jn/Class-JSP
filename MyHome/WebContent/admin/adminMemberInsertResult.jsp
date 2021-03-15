<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0) {
		alert('새로 추가되었습니다.');
		location.href='/MyHome/adminMemberListPage.admin?page=' + ${param.page};
	} else {
		alert('다시 시도하세요.');
		history.back();
	}
</script>