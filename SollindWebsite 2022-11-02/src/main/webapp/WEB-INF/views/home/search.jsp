<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link href="resources/img/Sollind.png" rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>SearchPage</title>
<link rel="stylesheet" href="resources/css/homeCSS/pageIndex.css">
<link rel="stylesheet" href="resources/css/homeCSS/search.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<link rel="stylesheet" href="resources/css/homeCSS/home.css">
<script type="text/javascript" src="resources/js/homeJS/homeCheck.js"></script>
<script type="text/javascript" src="resources/js/homeJS/yoonValidChecker.js"></script>
<script type="text/javascript" src="resources/jQuery/jQuery.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
<script type="text/javascript" src="resources/jQuery/homeJQ/searchEvent.js"></script>
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
	<table id="searchText">
		<tr>
			<td>
				<input  id="searchResult" type="hidden" value="${sessionScope.search }">
				<h3>${sessionScope.search } 검색결과</h3>
			</td>
		</tr>
	</table>
	<c:if test="${searchEmpty != 0}">
		<table id="searchCompany">
			<tr>
				<td>
					<c:forEach items="${searchCompanys }" var="sc" begin="0" end="1">
						<table id="companyHead">
							<tr>
								<td class="borderName">
									회사	
								</td>
							</tr>
						</table>
						<table id="companyMain">
							<tr>
								<td>
									<table>
										<tr>
											<td id="companyLogo">						
												<a href="goCompanyDetailInfo?c_no=${sc.c_no }"><img src="https://www.work.go.kr${sc.c_logo }"></a>
											</td>
											<td id="companyName">
												<a href="goCompanyDetailInfo?c_no=${sc.c_no }"><img src="resources/icon/star.png">&nbsp;${sc.c_score }<br>${sc.c_name }</a>
											</td>
										</tr>
									</table>
									<table id="companyInfo">
										<tr>
											<td colspan="2">
												<a href="goCompanyDetailInfo?c_no=${sc.c_no }">규모 : ${sc.c_size }</a>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<a href="goCompanyDetailInfo?c_no=${sc.c_no }">사원 : ${sc.c_people }</a>
											</td>				
										</tr>	
										<tr>
											<td colspan="2">
												<a href="goCompanyDetailInfo?c_no=${sc.c_no }">홈페이지 : ${sc.c_homepage }</a>
											</td>				
										</tr>
									</table>
									<table id="companyTextTable">
										<tr>
											<td align="left" id="companyText">
												<a href="goCompanyWriteReview?c_no=${sc.c_no }">${sc.c_name } 리뷰를 남겨보실래요?</a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</c:forEach>
				</td>
			</tr>
		</table>
	</c:if>
	<c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<c:if test="${searchEmpty != 0}">
		<table id="searchBorder">
			<tr>
				<td colspan="2">
					<table id="searchBorderPartTable">
						<tr>
							<td class="borderName">
								<input type="hidden" value="${boardType }" id="boardType">
								<c:choose>
									<c:when test="${boardType==\"\" }">
										<h4>전체 ▽</h4><p>
									</c:when>
									<c:otherwise>
										<h4>${boardType }  ▽</h4><p>
									</c:otherwise>
								</c:choose>
								<table class="BoardPartCountTable">
									<c:choose>
										<c:when test="${boardType==\"\" }">
											<tr>
									       		<td class="type0" style="color: black;">전체</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
									       		<td class="type0">전체</td>
											</tr>
										</c:otherwise>
									</c:choose>
									<c:forEach var="typeList" items="${typeList }" varStatus="status">
										<c:choose>
											<c:when test="${typeList==boardType }">
												<tr>
										       		<td class="type${status.count}" style="color: black;">${typeList }</td>											
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
										       		<td class="type${status.count}">${typeList }</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>	
			<c:forEach items="${searchBoards }" var="sb">
				<c:if test="${i%j == 0 }">
		    		<tr>
		    	</c:if>
				<c:choose>
	       			<c:when test="${searchBoards.size() == 1}">
			       		<td align="center">
			       			<table id="searchBorderTable1">
								<tr>
			       					<td colspan="2" id="searchBorderType" align="left">
			       						<a href="goBoardDetail?b_no=${sb.b_no }">${sb.b_type }</a>
			       					</td>
			       				</tr>
			       				<c:if test="${sb.b_img != 'noImage' }">
			       					<tr>
			       						<td class="searchBorderTitle" align="left">
			       							<div class="box test">
			       								<a href="goBoardDetail?b_no=${sb.b_no }">${sb.b_title }</a>
			       							</div>
			       						</td>
				       					<td rowspan="2" class="searchBorderImg" align="center">					
											<a href="goBoardDetail?b_no=${sb.b_no }">
												<img src="resources/img/boardImg/${sb.b_img }">
											</a>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td class="searchBorderTxt" align="left" valign="middle">
				   							<div class="box test">			       						
			  									<a href="goBoardDetail?b_no=${sb.b_no }">
			  										${sb.b_txt }
			  									</a>
			  								</div>     					
			       						</td>
			       					</tr>
			       					<tr>
			       						<td class="searchBorderDdabong">
				       						&nbsp;${fn:substring(sb.b_m_id,0,1) }*******
				       						&nbsp;&nbsp;<img src="resources/icon/ddabong.png">&nbsp;${sb.b_ddabong }
				    	   				</td>
			       						<td align="right" class="searchBorderDate">
											${sb.b_date }
			       						</td>
			       					</tr>
		       					</c:if>
				       			<c:if test="${sb.b_img == 'noImage' }">
				      				<tr>
					       				<td class="searchBorderTitle" align="left" colspan="2">
					       					<div class="box test">
					       						<a href="goBoardDetail?b_no=${sb.b_no }">
					       							${sb.b_title }
					       						</a>
					       					</div>
					       				</td>
				       				</tr>
				      				<tr>
				       					<td class="searchBorderTxt" align="left" valign="middle" colspan="2">
				       						<div class="box test">
				       							<a href="goBoardDetail?b_no=${sb.b_no }">
				       								${sb.b_txt }
				       							</a>
				       						</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td class="searchBorderDdabong">
				       						&nbsp;${fn:substring(sb.b_m_id,0,1) }*******
				       						&nbsp;&nbsp;<img src="resources/icon/ddabong.png">&nbsp;${sb.b_ddabong }
				    	   				</td>
					       				<td align="right" id="searchBorderDate2">
											${sb.b_date }
					       				</td>
					     			</tr>			
				       			</c:if>
							</table>
						</td>		       				
		       			</c:when>
		       			<c:otherwise>
		       			<td id="searchBorderTd2">
				       		<table id="searchBorderTable2">
				       			<tr>
				       				<td colspan="2" id="searchBorderType" align="left">
				       					<a href="goBoardDetail?b_no=${sb.b_no }">${sb.b_type }</a>
				       				</td>
				       			</tr>
			       				<c:if test="${sb.b_img != 'noImage' }">
				      				<tr>
					       				<td class="searchBorderTitle" align="left">
					       					<div class="box test">
					       						<a href="goBoardDetail?b_no=${sb.b_no }">
					       							${sb.b_title }
					       						</a>
					       					</div>
					       				</td>
					   					<td rowspan="2" class="searchBorderImg" align="center">					
											<a href="goBoardDetail?b_no=${sb.b_no }">
												<img src="resources/img/boardImg/${sb.b_img }">
											</a>
					     				</td>
				       				</tr>
				      				<tr>
				       					<td class="searchBorderTxt" align="left" valign="middle">
				       						<div class="box test">
				       							<a href="goBoardDetail?b_no=${sb.b_no }">
				       								${sb.b_txt }
				       							</a>
				       						</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td class="searchBorderDdabong">
				       						&nbsp;${fn:substring(sb.b_m_id,0,1) }*******
				       						&nbsp;&nbsp;<img src="resources/icon/ddabong.png">&nbsp;${sb.b_ddabong }
				    	   				</td>
					       				<td align="right" id="searchBorderDate">
											${sb.b_date }
					       				</td>
					     			</tr>
				       			</c:if>
				       			<c:if test="${sb.b_img == 'noImage' }">
				      				<tr>
					       				<td class="searchBorderTitle" align="left" colspan="2">
					       					<div class="box test">
					       						<a href="goBoardDetail?b_no=${sb.b_no }">
					       							${sb.b_title }
					       						</a>
					       					</div>
					       				</td>
				       				</tr>
				      				<tr>
				       					<td class="searchBorderTxt" align="left" valign="middle" colspan="2">
				       						<div class="box test">
				       							<a href="goBoardDetail?b_no=${sb.b_no }">
				       								${sb.b_txt }
				       							</a>
				       						</div>
				       					</td>
				       				</tr>
				       				<tr>
				       					<td class="searchBorderDdabong">
				       						&nbsp;${fn:substring(sb.b_m_id,0,1) }*******
				       						&nbsp;&nbsp;<img src="resources/icon/ddabong.png">&nbsp;${sb.b_ddabong }
				    	   				</td>
					       				<td align="right" id="searchBorderDate2">
											${sb.b_date }
					       				</td>
					     			</tr>			
				       			</c:if>
					   		</table>	
			      		</td>
			      	</c:otherwise>
				</c:choose>
						</td>
			    	<c:if test="${i%j == j-1 }">
			    		</tr>
			    	</c:if>
			    	<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</table>
	</c:if>
	<c:if test="${searchEmpty == 0}">
		<table id="noSearch">
			<tr>
				<td>
					<table>
						<tr>
							<td class="borderName">
								<c:choose>
									<c:when test="${boardType==\"\" }">
										<h4>전체 ▽</h4><p>
									</c:when>
									<c:otherwise>
										<h4>${boardType }  ▽</h4><p>
									</c:otherwise>
								</c:choose>
								<table class="BoardPartCountTable">
									<c:choose>
										<c:when test="${boardType==\"\" }">
											<tr>
									       		<td class="type0" style="color: black;">전체</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
									       		<td class="type0">전체</td>
											</tr>
										</c:otherwise>
									</c:choose>
									<c:forEach var="typeList" items="${typeList }" varStatus="status">
										<c:choose>
											<c:when test="${typeList==boardType }">
												<tr>
										       		<td class="type${status.count}" style="color: black;">${typeList }</td>											
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
										       		<td class="type${status.count}">${typeList }</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
					<img src="resources/icon/noSearch.png" id="noSearchImg">
					<h1 id="noSearchText" align="center">검색결과가 없음</h1>
				</td>
			</tr>
		</table>
	</c:if>
	<br><br><br><br><br><br><br><br>
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