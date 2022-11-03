<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePage</title>
<link rel="stylesheet" href="resources/css/memberCSS/update.css">
<script type="text/javascript" src="resources/js/memberJS/JQuery.js"></script>
<script type="text/javascript"
	src="resources/js/memberJS/KimValidChecker.js"></script>
<script type="text/javascript"
	src="resources/js/memberJS/memberValidChecker.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/memberJS/joinaddr.js"></script>
</head>
<body>
	<h1 align="center">
		<img src="resources/icon/SollindLogo.png">&nbsp;회원정보수정
	</h1>
	<form action="update.do" method="post" onsubmit="return validcheck();"
		enctype="multipart/form-data" name="joinform">
		<table id="updateTB">
			<tr>
				<td align="center" colspan="2"><input name="m_id"
					placeholder="ID" autocomplete="off" maxlength="10" id="joinID"
					value="${sessionScope.loginMember.m_id }"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input name="m_pw"
					placeholder="PW" maxlength="20" type="password"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input name="m_pwcheck"
					placeholder="PWcheck" maxlength="20" type="password"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input name="m_name"
					placeholder="name" autocomplete="off"
					value="${sessionScope.loginMember.m_name }"></td>
			</tr>
			<tr>
				<td align="center" id="birthTd" colspan="2"><input
					name="m_birth1" placeholder="ex)931016" maxlength="6"> <input
					name="m_birth2" placeholder="x" maxlength="1"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input name="m_addr1"
					placeholder="우편번호" autocomplete="off" id="joinaddr1"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input name="m_addr2"
					placeholder="주소" autocomplete="off" id="joinaddr2"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input name="m_addr3"
					placeholder="상세주소" autocomplete="off"></td>
			</tr>
			<tr>
				<td align="center" id="filebox" colspan="2"><label for="photo">업로드</label>
					<!--  <img src="resources/img/${sessionScope.loginMember.m_photo }">-->
					<input type="file" name="m_photo" id="photo"></td>
			</tr>
			<tr>
				<td id="buttonTD" align="right"><button id=button1>정보수정</button></td>
				<td id="aTD" align="left"><a href="delete.go" id="deleteA">회원탈퇴</a></td>
			</tr>
		</table>
	</form>
</body>
</html>