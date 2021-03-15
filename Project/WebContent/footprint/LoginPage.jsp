<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- css --%>
<%--
<link rel="stylesheet" href="assets/style/LoginPage.css">
 --%>
<style type="text/css">
	* {
		box-sizing: border-box;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	body {
		background: gray;
	}
	
	.lgn_background {
		text-align: center;
	}
	
	.lgn_main {
		background: white;
		position: relative;
		width: 600px;
		height: 600px;
		border-radius: 10px;
		text-align: center;
		margin: 0px auto;
		top: 150px;
	}
	
	.lgn_text {
		padding-top: 30px;
		font-size: 40px;
		font-weight: bold;
	}
	
	.input_text {
		width: 450px;
		height: 80px;
		background: silver;
		border-radius: 10px;
		font-size: 25px;
		padding-left: 20px;
		border-width: 0px;
	}
	
	.input_text:nth-of-type(1) {
		margin-top: 30px;
	}
	.input_text:nth-of-type(2) {
		margin: 10px 0px 20px 0px;
	}
	
	.lgn_main_middle {
		border-radius: 10px;
		float: left;
		margin-left: 75px;
	}
	.lgn_main_middle > img {
		width: 105px;
		height: 60px;
		border-radius: 10px;
	}
	
	.lgn_main_middle > img:nth-of-type(2){
		margin: 0px 5px 0px 10px;
	}
	
	.lgn_main_middle > img:nth-of-type(3){
		margin: 0px 10px 0px 5px;
	}
	
	.lgn_main_middle_right{
		text-align: center;
		line-height: auto;
	}
	
	.fas {
		border: 1px solid silver;
		width: 100px;
		height: 70px;
		border-radius: 10px;
		font-size: 50px;
	}
	
	.input_keep_lgn {
		float: left;
	}
	
	.lgn_main_bottom {
		margin-top: 70px;
		bottom: 30px;	
	}
	
	.lgn_main_bottom > a:nth-of-type(2) {
		margin: 0px 20px;
	}
	
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
</head>
<body>
<form method="post">
	<div class="lgn_background">
		<div class="lgn_main">
			<div class="lgn_main_top">
				<div class="lgn_text">로그인</div>
				<input type="text" id="lgn_id" class="input_text" name="lgn_id" placeholder="이메일" /><br/>
				<input type="password" id="lgn_pw" class="input_text" name="lgn_pw" placeholder="비밀번호" />
			</div>
			<div class="lgn_main_middle">
				<img src="../assets/images/kakao_logo.jpg" />
				<img src="../assets/images/naver_logo.jpg" />
				<img src="../assets/images/facebook_logo.jpg" />
				<img src="../assets/images/google_logo.jpg" />
				<br/>
				<div class="input_keep_lgn">
					<input type="checkbox" id="lgn_ing" value=""/><label for="lgn_ing">로그인 유지</label>
				</div>
			</div>
			<div class="lgn_main_middle_right">
				<i class="fas fa-long-arrow-alt-right" name="lgn_go_btn"></i>
			</div>
			<div class="lgn_main_bottom">
				<a href="" >아이디 찾기</a>
				<a href="" >비밀번호 찾기</a>
				<a href="" >회원가입</a>
			</div>
		</div>
	</div>
</form>

</body>
</html>