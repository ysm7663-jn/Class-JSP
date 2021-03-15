<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function fn_update(f) {
		if (f.title.value == '') {
			alert('제목은 필수입니다.');
			f.title.focus();
			return;
		}
		if ('${param.title}' == f.title.value  && '${param.content}' == f.content.value) {
			alert('수정할 내용이 없습니다.');
		}
		f.action = '/15_DBCP/update.do';
		f.submit();
	}

</script>
</head>
<body>

	<h3>${param.no}번 게시글을 수정합니다.</h3>
	<form method="post">
		작성자<br/>
		${param.writer}<br/><br/>
		
		제목<br/>
		<input type="text" name="title" value="${param.title}" /><br/><br/>
		
		내용<br/>
		<textarea rows="5" cols="50" name="content">${param.content}</textarea><br/><br/>
		
		조회수<br/>
		${param.hit}<br/><br/>
		
		작성일<br/>
		${param.postDate}<br/><br/>
		
		<input type="hidden" name="no" value="${param.no}" />
		
		<input type="button" value="수정하기" onclick="fn_update(this.form)" />
		<input type="reset" value="다시작성" />
		<input type="button" value="취소하기" onclick="alert('취소합니다.'); history.back()" />
		<input type="button" value="목록으로이동" onclick="location.href='/15_DBCP/listPage.do'" />
	</form>

</body>
</html>