<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginPage</title>
<script type="text/javascript" src="resources/js/memberJS/KimValidChecker.js"></script>
<script type="text/javascript" src="resources/js/memberJS/memberValidChecker.js"></script>
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
</head>
<body>
<form action="member.login" method="post" name="loginform" onsubmit="return logincheck()">
	<table id="loginTable" >
		<h1 align="center"><img src="resources/icon/SollindLogo.png"> 로그인</h1>
		<tr>
			<td>
				<input placeholder="아이디" name="m_id" maxlength="10" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td>
				<input placeholder="비밀번호" name="m_pw" type="password" maxlength="15">
			</td>
		</tr>
		<tr>
		<td><button>로그인</button></td>
		</tr>
	</table>
</form>
</body>
</html>