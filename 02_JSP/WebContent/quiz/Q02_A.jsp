<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
		<div>
			당신의 나이는?
			<input type="text" name="age">
			<input type="button" value="확인" onclick="fn_check(this.form)">
		</div>
	</form>
	
	<script type="text/javascript">
	
		function fn_check(f) {
			
			f.action='/02_JSP/quiz/Q02_B.jsp';
			f.submit();
			
		}
	
	</script>

</body>
</html>