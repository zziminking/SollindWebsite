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
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<link rel="stylesheet" href="resources/css/companyCSS/companycss.css">
<link rel="stylesheet" href="resources/css/companyCSS/companyDetailcss.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<script type="text/javascript" src="resources/jQuery/jQuery.js"></script>
<script type="text/javascript" src="resources/js/companyJS/companyDetail.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
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
			<tr>
				<td align="center">
					<table id="companyDetailTable">
						<tr>
							<td colspan="4" id="companyTitle" align="center">
								${companyInfo.c_name }&nbsp;소개
							</td>
						</tr>
						<tr>
							<td align="left" class="companyDetailIndex">
								홈페이지
							</td>
							<td align="center">
								<a href="${companyInfo.c_homepage }" target="_blink">${companyInfo.c_homepage }</a>
							</td>
							<td align="left" class="companyDetailIndex">
								업종
							</td>
							<td align="center">
								${companyInfo.c_cate }
							</td>
						</tr>
						<tr>
							<td align="left" class="companyDetailIndex">
								주소
							</td>
							<td align="center">
								${companyInfo.c_addr }
							</td>
							<td align="left" class="companyDetailIndex">
								설립연도
							</td>
							<td align="center">
								${companyInfo.c_open }
							</td>
						</tr>
						<tr>
							<td align="left" class="companyDetailIndex">
								직원수
							</td>
							<td align="center">
								${companyInfo.c_people }
							</td>
							<td align="left" class="companyDetailIndex">
								연매출
							</td>
							<td align="center">
								${companyInfo.c_asset }
							</td>
						</tr>
					</table>
					<br>
					<hr>
					<br>
				</td>
			</tr>
	</table>
	<table id="companyShowReviewTableArea">
		<tr>
			<td align="center">
				<table class="companyShowReviewTable">
					<tr>
						<td align="right" class="goWriteReviewATd">
							<a href="goCompanyWriteReview?c_no=${companyInfo.c_no }">리뷰 쓰러가기</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<c:forEach var="cr" items="${companyReviews }" begin="0" end="0">
					<c:if test="${companyReviews != null }">
						<table id="companyShowReview">
							<tr>
								<td align="center" rowspan="6" style="width: 150px; padding-top: 10px;" valign="top">
									<c:forEach begin="0" end="${cr.cr_score - 1}">
										<img width="18px;" height="18px;" src="resources/img/companyImg/star.png">
									</c:forEach>
									<c:forEach begin="1" end="${5 - cr.cr_score }">
										<img width="18px;" height="18px;" src="resources/img/companyImg/star2.png">
									</c:forEach>
									<span style="font-size: 18pt;">${cr.cr_score }</span>
								</td>
								<td align="center" style="padding-top: ">
									<div class="box companyShowReviewTitle">${cr.cr_title }</div>
								</td>
							</tr>
							<tr>
								<td align="right" style="padding-bottom: 10px">
									<span>${fn:substring(cr.cr_m_id,0,1) }*******</span>&nbsp;&nbsp;
									<fmt:formatDate value="${cr.cr_date }" type="date" dateStyle="short"/>
								</td>
							</tr>
							<tr>
								<td align="left" >
									<span style="font-size: 15pt; font-weight: 900; padding-left: 10px;">장점</span>
								</td>
							</tr>
							<tr>
								<td align="left" style="padding: 10px;">
									<span class="box companyShowReviewText">${cr.cr_advantage }</span>
								</td>
							</tr>
							<tr>
								<td align="left">
									<span style="font-size: 15pt; font-weight: 900; padding-left: 10px;">단점</span>
								</td>
							</tr>
							<tr>
								<td align="left" style="padding: 10px;">
									<span class="box companyShowReviewText">${cr.cr_weakness }</span>
								</td>
							</tr>
						</table>
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td align="center">
				<c:forEach var="cr" items="${companyReviews }" begin="0" end="0">
					<c:if test="${companyReviews != null }">
						<table class="companyShowReviewTable">
							<tr>
								<td align="center" class="goWriteReviewATd">
									<a href="goCompanyDetailReview?c_no=${cr.cr_c_no }">리뷰 더보기</a>
								</td>
							</tr>
						</table>
						<br>
						<hr>
						<br>
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
	<table id="companyBoardTableArea">
		<c:set var="ii" value="0" />
		<c:set var="jj" value="2" />
	  	<c:forEach var="cb" items="${companyBoards}" begin="0" end="1">
	    	<c:if test="${ii%jj == 0 }">
	    		<tr class="companyBoardTableAreaTr">
	    	</c:if>
	       		<td align="center">
					<table class="companyBoardTable">
						<tr>
							<td colspan="2" class="companyBoardType">
	       						<div align="center">${cb.b_type }</div>
							</td>
						</tr>
						<tr>
	       					<td class="box companyBoardTitle" align="left">
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
	       						<a href="goBoardDetail?b_no=${cb.b_no }">
	       							<div>${cb.b_txt }</div>
	       						</a>
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
				</td>
	    	<c:if test="${ii%jj == jj-1 }">
	    		</tr>
	    	</c:if>
	    	<c:set var="ii" value="${ii+1 }" />
	  	</c:forEach>
	  	<tr>
	  		<td align="center" colspan="2">
	  			<c:forEach var="cb" items="${companyBoards }" begin="0" end="0">
					<c:if test="${companyBoards != null }">
						<table class="companyShowReviewTable">
							<tr>
								<td align="center" class="goWriteReviewATd">
									<a href="goCompanyDetailBoard?c_no=${companyInfo.c_no }">게시글 더보기</a>
								</td>
							</tr>
						</table>
					</c:if>
				</c:forEach>
	  		</td>
	  	</tr>
	</table>
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