<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/img/Sollind.png" rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>Solind</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<script type="text/javascript" src="http://192.168.0.126:5454/socket.io/socket.io.js"></script>
<script type="text/javascript" src="resources/jQuery/jQuery.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
<script type="text/javascript" src="resources/jQuery/homeJQ/homeRankingCompany.js"></script>
<script type="text/javascript" src="resources/js/homeJS/homeCheck.js"></script>
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
	<form action="Search.go" method="get" name="sc" onsubmit="return searchCheck();">
		<table id="homeSearchTable">
			<tr>
				<td id="searchButton">
					<button>
						<img src="resources/icon/search.png">
					</button>
				</td>
				<td id="searchInput">
					<input id="HomeSearchInput" placeholder="검색어 입력" name="search" autocomplete="off">
				</td>
			</tr>
		</table>
	</form>
	<table id="bestBoarderTable">
		<tr>
			<td>		
				<table id="bestBoarder">
					<tr>
						<td id="topicBest" colspan="3">
							<img src="resources/icon/bestCrown.png">&nbsp;주간 베스트
						</td>
					</tr>
					<c:forEach var="boardBest" items="${boards }" begin="0" end="9">
						<tr>
							<td id="boardBestType">
								<a href="/Sollind/goBoardHome?type=${boardBest.b_type }">${boardBest.b_type }</a>
							</td>
							<td id="boardBestTitle">
								<div class="box test">
									<a href="goBoardDetail?b_no=${boardBest.b_no }">
										&nbsp;&nbsp;${boardBest.b_title }
									</a>
								</div>
							</td>
							<td id="ddabongTD">
								<img src="resources/icon/ddabong.png">&nbsp;${boardBest.b_ddabong }
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td id="bestCompanyTD">
				<table id="bestCompanyTable">
					<tr>
						<td id="bestCompany" colspan="2">실시간 인기 회사</td>
					</tr>
					<c:forEach var="companyBest" items="${companys }" begin="0" end="10" varStatus="status">
						<tr>
							<td id="rankingCount">${status.count }</td><td id="rankingCompanyName"><a href="goCompanyDetailInfo?c_no=${companyBest.vr_c_no }">${companyBest.vr_c_name }</a></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<table id="HomeMainTable">
		<tr>
			<td>
				<table id="boardPartTable">
					<tr>
						<td class="boardPartTd">
						 	<table class="boardPartTableLeft">
						 		<tr>
						 			<td class="boardPartTitle">
						 				자유게시판&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=자유게시판">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2" colspan="2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartFree[i].b_no }">
																${boardPartFree[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartFree[i].b_date }
													</td>
												</tr>
											</c:forEach>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<td class="boardPartTd">
						 	<table class="boardPartTableRight">
						 		<tr>
						 			<td class="boardPartTitle">
						 				이직·커리어&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=이직·커리어">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr> 
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartCareer[i].b_no }">
																${boardPartCareer[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartCareer[i].b_date }
													</td>
												</tr>
											</c:forEach>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="boardPartTd">
						 	<table class="boardPartTableLeft">
						 		<tr>
						 			<td class="boardPartTitle">
						 				헬스&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=헬스">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartHealth[i].b_no }">
																${boardPartHealth[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartHealth[i].b_date }
													</td>
												</tr>
											</c:forEach>					
										</table>
									</td>
								</tr>
							</table>				
						</td>
						<td class="boardPartTd">
						 	<table class="boardPartTableRight">
						 		<tr>
						  			<td class="boardPartTitle">
						 				회사생활&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=회사생활">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartCompany[i].b_no }">
																${boardPartCompany[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartCompany[i].b_date }
													</td>
												</tr>
											</c:forEach>	
										</table>
									</td>
								</tr>
							</table>				
						</td>
					</tr>
					<tr>
						<td class="boardPartTd">
						 	<table class="boardPartTableLeft">
						 		<tr>
						 			<td class="boardPartTitle">
						 				여행&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=여행">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2"> 
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartTravel[i].b_no }">
																${boardPartTravel[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartTravel[i].b_date }
													</td>
												</tr>
											</c:forEach>	
										</table>
									</td>
								</tr>
							</table>				
						</td>
						<td class="boardPartTd">
						 	<table class="boardPartTableRight">
						 		<tr>
						 			<td class="boardPartTitle">
						 				알쓸신잡&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=알쓸신잡">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartInfo[i].b_no }">
																${boardPartInfo[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartInfo[i].b_date }
													</td>
												</tr>
											</c:forEach>	
										</table>
									</td>
								</tr>
							</table>				
						</td>
					</tr>
					<tr>
						<td class="boardPartTd">
						 	<table class="boardPartTableLeft">
						 		<tr>
						 			<td class="boardPartTitle">
						 				연애&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=연애">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartLove[i].b_no }">
																${boardPartLove[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartLove[i].b_date }
													</td>
												</tr>
											</c:forEach>	
										</table>
									</td>
								</tr>
							</table>				
						</td>
						<td class="boardPartTd">
						 	<table class="boardPartTableRight">
						 		<tr>
						 			<td class="boardPartTitle">
						 				스포츠&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						 				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						 				&ensp;&ensp;&ensp;&ensp;&ensp;
						 				<a class="boardPartMore" href="/Sollind/goBoardHome?type=스포츠">
						 				더보기 >
						 				</a>
						 			</td>
						 		</tr>
								<tr>
									<td class="boardPartTd2">
										<table class="boardPartLeft2">
											<c:forEach var="i" begin="0" end="4">
												<tr>
													<td class="boardPartTxt">
														<div class="box test">
															<a href="goBoardDetail?b_no=${boardPartSport[i].b_no }">
																${boardPartSport[i].b_title }
															</a>
														</div>
													</td>
													<td class="boardPartDate" align="right">
														${boardPartSport[i].b_date }
													</td>
												</tr>
											</c:forEach>	
										</table>
									</td>
								</tr>
							</table>				
						</td>
					</tr>
				</table>
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