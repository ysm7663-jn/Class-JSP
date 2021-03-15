<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_calc(f) {
		if (f.num1.value == '') {
			f.num1.value = 0;
		}
		if (f.num2.value == '') {
			f.num2.value = 0;
		}
		// 이동 경로 작성 (JSP로 이동)
		// /컨텍스트패스/JSP파일경로 (폴더명/파일명)
		f.action = '/02_JSP/ex02/Ex02_B.jsp';
		f.submit();
	}
</script>
</head>
<body>

	<h3>JSP로 데이터 보내기</h3>
	<form method="get">
		<label for="num1">첫 번째 정수</label>
		<input type="text" name="num1" id="num1" /><br/>
		<label for="num2">두 번째 정수</label>
		<input type="text" name="num2" id="num2" /><br/><br/>
		<input type="button" value="계산하기" onclick="fn_calc(this.form)" />
	</form>

</body>
</html>