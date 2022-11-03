<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sollind</title>
<link href="resources/img/Sollind.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="resources/css/homeCSS/pageIndex.css">
<link rel="stylesheet" href="resources/css/boardCSS/boardMain.css">
<link rel="stylesheet" href="resources/css/boardCSS/boardDetail.css">
<link rel="stylesheet" href="resources/css/boardCSS/boardWrite.css">
<link rel="stylesheet" href="resources/css/boardCSS/boardRetouch.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<script type="text/javascript" src="resources/jQuery/jQuery.js"></script>
<script type="text/javascript" src="resources/jQuery/boardJQ/boardDetail.js"></script>
<script type="text/javascript" src="resources/jQuery/boardJQ/boardMain.js"></script>
<script type="text/javascript" src="resources/js/boardJS/ValidCheckerNMS.js"></script>
<script type="text/javascript" src="resources/js/boardJS/boardCheck.js"></script>
<script type="text/javascript" src="resources/js/boardJS/boardReview.js"></script>
<script type="text/javascript" src="resources/js/homeJS/homeCheck.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
<script type="text/javascript" src="resources/js/homeJS/yoonValidChecker.js"></script>
</head>
<body>
	<table id="homeTable">
		<tr>
			<td id="tableTitle">
				<table id="main">
					<tr>
						<td id="companyName">
							<a href="/Sollind/">
								<img src="resources/img/Sollind.png">ollind
							</a>
						</td>
						<td id="home">
							&nbsp;&nbsp;<a href="/Sollind/">홈</a>
							&nbsp;&nbsp;&nbsp;<a href="goBoardHome">게시판</a>
							&nbsp;&nbsp;&nbsp; <a href="goCompanyHome">회사정보</a>
						</td>
						<td id="searchNew">
							<form action="Search.go" method="get" name="sc" onsubmit="return searchCheck();">
								<table id="searchMain">
									<tr>
										<td id="searchInput">
											<button>
												<img src="resources/icon/search.png">
											</button>
											<input placeholder="검색어 입력" name="search" autocomplete="off" id="HomeSearchInput">
										</td>
									</tr>
								</table>
							</form>
						</td>
						<td align="right" id="loginTable">
							<c:choose>
								<c:when test="${sessionScope.loginMember!=null }">
									<a href="goBoardWrite" id="homeGoWrite">글쓰기</a>
									<a href="member.logout" class="homeLogined">로그아웃</a>      
									<a href="update.go" class="homeLogined">개인정보</a>           
								</c:when>
								<c:otherwise>
									<a id="homeLogin">로그인</a>      
									<a href="Memberjoin.go" id="homeJoin">회원가입</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<jsp:include page="${boardPage }"></jsp:include>
	<table id="backgroundTb">
		<tr><td>
		</td></tr>
	</table>
	<form action="member.login" method="post" name="loginform" onsubmit="return logincheck()">
	<table id="loginTb" >
		<tr>
			<td align="center" id="loginText">로그인하세요</td>
		</tr>
		<tr>
			<td>
				<input placeholder="아이디" name="m_id" maxlength="10" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td>
				<input placeholder="비밀번호(영어+숫자)" name="m_pw" type="password" maxlength="15">
			</td>
		</tr>
		<tr>
			<td><button>로그인</button></td>
		</tr>
	</table>
	</form>
</body>
</html>