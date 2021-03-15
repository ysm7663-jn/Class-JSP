<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${param.result}' > 0) {
		alert('댓글이 등록되었습니다.');
		// 1페이지에 새글이 등록되어 나타나기때문에 굳이 page정보를 파라미터에 안붙여도 된다.
		location.href='/MyHome/boardListPage.board?page=${param.page}';
	} else {
		alert('댓글이 등록되지 않았습니다.');
		history.back();
	}
</script>