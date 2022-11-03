<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sollind</title>
<link href="resources/img/Sollind.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="resources/css/homeCSS/pageIndex.css">
<link rel="stylesheet" href="resources/css/companyCSS/companycss.css">
<link rel="stylesheet" href="resources/css/companyCSS/companyDetailBoardcss.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<script type="text/javascript" src="resources/js/companyJS/companyDetail.js"></script>
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
									<a href="MemberHome.go" id="homeLogin">로그인</a>      
									<a href="Memberjoin.go" id="homeJoin">회원가입</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table id="companyDetailTableArea">
		<tr>
			<td align="center">
				<table id="companyNameTable">
					<tr>
						<td rowspan="3" class = "companyNameTableLogoTd" align="center">
							<img width="100px;" height="50px;" src="https://www.work.go.kr${companyInfo.c_logo }">
						</td>
						<td style="height: 50px;">
						</td>
					</tr>
					<tr>
						<td class = "companyNameTableTd1">
						${companyInfo.c_name }
						</td>
					</tr>
					<tr>
						<td class = "companyNameTableTd2">
						<img width="18px;" height="18px;" src="resources/img/companyImg/star.png">&nbsp;${companyInfo.c_score }
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<table id= companyMenuTable>
								<tr>
									<td align="center" class="companyMenuTableTd info" onclick="locationInfo(${companyInfo.c_no });">
										<span>회사정보</span>
									</td>
									<td align="center" class="companyMenuTableTd review" onclick="locationReview(${companyInfo.c_no });">
										<span>리뷰</span>
									</td>
									<td align="center" class="companyMenuTableTd board" onclick="locationBoard(${companyInfo.c_no });">
										<span>게시글</span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br>
			</td>
		</tr>
	</table>
	<table id="companyBoardTableArea">
	  	<c:forEach var="cb" items="${companyBoards}">
	    	<tr class="companyBoardTableAreaTr">
	       		<td align="center">
					<table class="companyBoardTable">
						<tr>
							<td colspan="2" class="companyBoardType">
	       						<div align="center">${cb.b_type }</div>
							</td>
						</tr>
						<tr>
	       					<td class="companyBoardTitle" align="left">
	       						<a href="goBoardDetail?b_no=${cb.b_no }">${cb.b_title }</a>&nbsp;
	       						<c:if test="${sessionScope.loginMember.m_id==cb.b_m_id }">
		       						<a href="goBoardRetouch?b_no=${cb.b_no }"><button>수정</button></a>
	       						</c:if>
	       					</td>
	       					<td rowspan="2" class="companyBoardImg" align="center">					
								<a href="goBoardDetail?b_no=${cb.b_no }">${cb.b_img }</a>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td class="companyBoardTxt" align="left" valign="middle">
	       						<a href="goBoardDetail?b_no=${cb.b_no }">${cb.b_txt }</a>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td class="companyBoardDdabong">
	       						<img src="resources/icon/ddabong.png">&nbsp;${cb.b_ddabong }
	       					</td>
	       					<td align="right" class="companyBoardDate">
								${fn:substring(cb.b_m_id,0,1) }*******&nbsp;<fmt:formatDate value="${cb.b_date }" pattern="yyyy.MM.dd"/>
	       					</td>
	       				</tr>
					</table>
					<hr>
					<br>
				</td>
	    	</tr>
	  	</c:forEach>
	</table>
	<br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
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
						<td class="endTxt">
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