<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sollind</title>
<link href="resources/img/Sollind.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="resources/css/homeCSS/pageIndex.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<link rel="stylesheet" href="resources/css/companyCSS/companycss.css">
<link rel="stylesheet"
	href="resources/css/companyCSS/companyreviewcss.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/companyJS/seoValidChecker.js"></script>
<script type="text/javascript" src="resources/js/companyJS/companyReview.js"></script>
<script type="text/javascript" src="resources/jQuery/companyJQ/writeReview.js"></script>
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
	<br>
	<br>
		<table id="companyReviewWriteTableArea">
			<tr>
				<td align="center">
					<table id="companyReviewWriteNameTable">
						<tr>
							<td align="center" class="cRWName">[ ${companyInfo.c_name } ]에 대해 리뷰를 작성하세요</td>
						</tr>
						<tr>
							<td align="center">
								<table id="companyReviewWriteTable">
									<form action="WriteCompanyReview" name="companyReviewWriteForm" method="post" onsubmit="return check(this);">
										<tr>
											<td class="cRWScore" align="right">
												<img class="star1" width="30px;" height="30px;" src="resources/img/companyImg/star.png">
												<img class="star2" width="30px;" height="30px;" src="resources/img/companyImg/star.png">
												<img class="star3" width="30px;" height="30px;" src="resources/img/companyImg/star.png">
												<img class="star4" width="30px;" height="30px;" src="resources/img/companyImg/star.png">
												<img class="star5" width="30px;" height="30px;" src="resources/img/companyImg/star.png">
												<input class="starScore" name="cr_score" type="hidden" value="5">
												<input name="c_no" type="hidden" value="${companyInfo.c_no }">
												<input name="cr_c_no" type="hidden" value="${companyInfo.c_no }">
												<input name="companyWriteToken" type="hidden" value="${token }">
											</td>
											<td class="cRWId" align="right" valign="bottom">
												작성자 : ${sessionScope.loginMember.m_id }
											</td>
										</tr>
										<tr>
											<td align="center" colspan="2" class="cRWTitleArea">
												<textarea name="cr_title" class="cRWTitle" placeholder="제목 (최대 20 자)" maxlength="20" ></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center" class="cRWTextArea">
												<textarea class="cRWText" name="cr_advantage" placeholder="장점(최대 180 자)" maxlength="180" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center" class="cRWTextArea">
												<textarea class="cRWText" name="cr_weakness" placeholder="단점(최대 180 자)"maxlength="180" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center" class="cRWbuttonTd">
												<button class="cRWbutton">작성</button>
											</td>
										</tr>
									</form>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<br><br>
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