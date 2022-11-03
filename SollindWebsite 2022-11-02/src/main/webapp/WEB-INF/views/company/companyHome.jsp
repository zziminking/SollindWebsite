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
<link rel="stylesheet" href="resources/css/companyCSS/companyhome.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<link rel="stylesheet" href="resources/css/index.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
<script type="text/javascript" src="resources/jQuery/companyJQ/companyhome.js"></script>
<script type="text/javascript" src="resources/js/companyJS/companyHome.js"></script>
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
									<a  id="homeLogin">로그인</a>      
									<a href="Memberjoin.go" id="homeJoin">회원가입</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table id = "companyBannerTable">
		<tr>
			<td align="center" class="companyBannerTd" onclick="goAI();">
				AI로 회사등급 확인해보기
			</td>
		</tr>
	</table>
	<table id = "companytable">
		<tr class="companySearchTr">
			<td align="center" valign="top" colspan="3">
				<div id="companySearchTitle">회사 정보를 검색해보세요</div>
				<div id="companySearchSubTitle">실제 회사의 리뷰를 달아보세요</div>
				<input type="text" class="companySearch" placeholder="회사이름을 검색하세요" name="c_search" autocomplete="off">					
			</td>
		</tr>
		<tr class= companySearchResultTableAreaTr>
			<td colspan="3" align="center" class="companySearchResultTableAreaTd">
				<table id="companySearchResultTableArea">
					<tr>
						<td align="center" id="companySearchResultTableTdd">
						
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="left" id="companyInfoTitle">별점 높은 회사</td>
		</tr>
		<c:set var="i" value="0" />
		<c:set var="j" value="3" />
	  	<c:forEach items="${companys }" var="com">
	    	<c:if test="${i%j == 0 }">
	    	<tr class="companyInfoTableAreaTr">
	    	</c:if>
	       		<td align="center">
					<table id="companyInfoTable">
						<tr id="companyInfoTr">
							<td align="center" valign="middle" id="companyInfoLogoTd" rowspan="2">
								<a href="goCompanyDetailInfo?c_no= ${com.c_no }">
									<img src="https://www.work.go.kr${com.c_logo }">
								</a>
							</td>
							<td align="center" valign="middle" class="companyInfoTd" colspan="2">
								<a href="goCompanyDetailInfo?c_no=${com.c_no }">${com.c_name }</a><br>
							</td>
						</tr>
						<tr>
							
							<td align="right" valign="top" class="companyInfoTd starScore">
								<span><img width="18px" height="18px;" src="resources/img/companyImg/star.png"></span>
							</td>
							<td align="left" valign="top" class="companyInfoTd score">
								<div>
									${com.c_score }
								</div>
							</td>
						</tr>
					</table>
				</td>
	    	<c:if test="${i%j == j-1 }">
	    		</tr>
	    	</c:if>
	    	<c:set var="i" value="${i+1 }" />
	  	</c:forEach>
	</table>
	<br>
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
	<br>
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