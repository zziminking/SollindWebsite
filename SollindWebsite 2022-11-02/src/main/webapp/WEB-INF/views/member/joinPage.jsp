<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinPage</title>
<script type="text/javascript" src="resources/js/memberJS/JQuery.js"></script>
<script type="text/javascript" src="resources/js/memberJS/KimValidChecker.js"></script>
<script type="text/javascript" src="resources/js/memberJS/memberValidChecker.js"></script>
<link rel="stylesheet" href="resources/css/memberCSS/join.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/memberJS/joinaddr.js"></script>
</head>
<body>
	<h1 align="center"><img src="resources/icon/SollindLogo.png">&nbsp;회원가입 </h1>
	<form action="completejoin.do" method="post"  onsubmit="return validcheck();" enctype="multipart/form-data"name="joinform">

	<table id ="jointable">
		<tr>
			<td align="center"><input name="m_id" placeholder="ID"
				autocomplete="off" maxlength="10" id="joinID"></td>
		</tr>
		<tr>
			<td align="center"><input name="m_pw" placeholder="PW"
				maxlength="20" type="password"></td>
		</tr>
		<tr>
			<td align="center"><input name="m_pwcheck" placeholder="PWcheck"
				maxlength="20" type="password"></td>
		</tr>
		<tr>
			<td align="center"><input name="m_name" placeholder="name"
				autocomplete="off"></td>
		</tr>
		<tr>
		<td align="center" id="birthTd"> 
		<input name="m_birth1"  placeholder="ex)931016" >  
		<input name="m_birth2"  placeholder="x" >
		</td>
		</tr>
		<tr>
			<td align="center">
			<input name="m_addr1" placeholder="우편번호" autocomplete="off"  id="joinaddr1" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td align="center">
			<input name="m_addr2" placeholder="주소" autocomplete="off"  id="joinaddr2" readonly="readonly">
			</td>
		</tr>	
		<tr>
			<td align="center">
			<input name="m_addr3" placeholder="상세주소" autocomplete="off" >
			</td>
		</tr>
		<tr>
				<td id="filebox">
				<label for="photo">업로드</label>
				<!--  <img src="resources/img/${sessionScope.loginMember.m_photo }">--> 
				<input type="file" name="m_photo" id="photo"></td>
			</tr>
		<tr>
		<td align="center" id="joinbutton"><button>가입</button></td>
		</tr>
	</table>
		</form>
</body>
</html>