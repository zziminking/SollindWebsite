<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/img/Sollind.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<link rel="stylesheet" href="resources/css/homeCSS/pageIndex.css">
<link rel="stylesheet" href="resources/css/companyCSS/companyAI.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
<script type="text/javascript" src="resources/jQuery/companyJQ/companyhome.js"></script>
<script type="text/javascript" src="resources/js/companyJS/companyAI.js"></script>
<script type="text/javascript" src="resources/jQuery/companyJQ/companyAI.js"></script>
<script type="text/javascript" src="resources/js/companyJS/seoValidChecker.js"></script>
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
	<table id="companyAITitleTable">
		<tr>
			<td>
				회사 등급 예측
			</td>
		</tr>
	</table>
	<table id = "companyAITableArea" border="1">
		<tr>
			<td align="center">
				<table id = "companyAITable" border="1">
					<tr>
						<td align="center" class="companyAITd1" colspan="3">
							회사명 : <input id="companyAIName" type="text" placeholder="회사명">&nbsp;&nbsp;
							등급 : <input id="companyGrade" type="text" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td align="center" class="companyAITd1">
							매출액(억원) : <input id="companyAIInfo1" type="text" value="0">
						</td>
						<td align="center" class="companyAITd1">
							영업이익률(%) : <input id="companyAIInfo2" type="text" value="0">
						</td>
						<td align="center" class="companyAITd1">
							순이익률(%) : <input id="companyAIInfo3" type="text" value="0">
						</td>
					</tr>
					<tr>
						<td align="center" class="companyAITd1">
							부채비율(%) : <input id="companyAIInfo4" type="text" value="0">
						</td>
						<td align="center" class="companyAITd1">
							당좌비율(%) : <input id="companyAIInfo5" type="text" value="0">
						</td>
						<td align="center" class="companyAITd1">
							유보율(%) : <input id="companyAIInfo6" type="text" value="0">
						</td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<table id="companyAIStarScoreTable" border="1">
								<tr>
									<td align="center" class="companyAITd2">
										복지 및 급여(별점) :<br><br>
										<input id="companyAIStar1" type="text" maxlength="3" value="0">
									</td>
									<td align="center" class="companyAITd2">
										업무와 삶의 균형(별점) :<br><br>
										<input id="companyAIStar2" type="text" maxlength="3" value="0">
									</td>
									<td align="center" class="companyAITd2">
										사내문화(별점) :<br><br>
										<input id="companyAIStar3" type="text" maxlength="3" value="0">
									</td>
									<td align="center" class="companyAITd2">
										승진 기회 및 가능성(별점) :<br><br>
										<input id="companyAIStar4" type="text" maxlength="3" value="0">
									</td>
									<td align="center" class="companyAITd2">
										경영진(별점) :<br><br>
										<input id="companyAIStar5" type="text" maxlength="3" value="0">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td id="aiButtonTd" align="center" colspan="3">
							<button id="aiButton">입력</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br><br><br><br><br>
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
	<table id="endInfo">
		<tr>
			<td id="endTable">
				<table id="main">
					<tr>
						<td id="infoImg" rowspan="3">
							<a href="https://soldesk.com/index.asp" target="_blink">
								<img src="resources/img/soldeskImage.png" id="infoName">
							</a>
						</td>
						<td class="info">
							위치 : 서울특별시 서울시 강남구 봉은사로 119 성옥빌딩 5층, 6층&emsp;
						</td>
						<td>
							교육문의 : 1544-0714&emsp;
						</td>
						<td>
							시험문의 : 02-6901-7010					
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>