<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/memberCSS/login.css">
<script type="text/javascript" src="resources/jQuery/jQuery.js"></script>
<script type="text/javascript" src="resources/jQuery/memberJQ/loginMove.js"></script>
</head>
<body>
	<table id="boardDetailTable">
		<tr>
			<td colspan="2" id="info">[${board2.b_type }]&nbsp;${fn:substring(board2.b_m_id,0,1) }*******&nbsp;<fmt:formatDate value="${board2.b_date }" pattern="yyyy.MM.dd hh:mm:ss"/></td>
		</tr>
		<tr>
			<th colspan="2" id="title">
				${board2.b_title }
				<c:if test="${sessionScope.loginMember.m_id==board2.b_m_id }">
					<a href="goBoardRetouch?b_no=${board2.b_no }"><button>수정</button></a>
				</c:if>
			</th>
		</tr>
		<c:if test="${board2.b_img ne 'noImage' }">
			<tr>
				<td colspan="2" id="img"><img src="resources/img/boardImg/${board2.b_img }"></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2" id="txt">${board2.b_txt }</td>
		</tr>
		<tr>
			<td colspan="2" id="mbti"><input type="text" readonly="readonly" >&nbsp;<button id="mbtiBTN">mbti예측</button></td>
		</tr>
		<tr>
			<td colspan="2" id="data">
			<c:choose>
				<c:when test="${ddabong!=null }">
					<c:choose>
						<c:when test="${ddabong.bd_m_id eq sessionScope.loginMember.m_id and ddabong.bd_ddabong == 1}">
							<input id="first" type="hidden" value="${ddabong.bd_no }">
							<img src="resources/icon/ddabongCheck.png" >&nbsp;<span>${board2.b_ddabong }</span></td>
						</c:when>
						<c:otherwise>
							<input id="first" type="hidden" value="${ddabong.bd_no }">
							<img src="resources/icon/ddabong.png" >&nbsp;<span>${board2.b_ddabong }</span></td>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<input id="first" type="hidden" value="first">
					<img src="resources/icon/ddabong.png" >&nbsp;<span>0</span></td>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<form action="replyWriteResult" name="writeReply" method="post" onsubmit="return replyCheck();">
			<td id="insertReply">
				<input id="boardNo" type="hidden" name="b_no" value="${board2.b_no }">
				<input type="hidden" name="br_b_no" value="${board2.b_no }">
				<input id="replyID" type="hidden" name="br_m_id" value="${sessionScope.loginMember.m_id }">
				<input type="hidden" name="token" value="${token }">
				<textarea id="reply" name="br_txt" maxlength="80" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="댓글을 남겨주세요"></textarea>
			</td>
			<td id="insertReplyBTN">
				<button id="replyInsertBTN" >입력</button>
			</td>
			</form>
		</tr>
		<tr>
			<td colspan="2">
				<table id="replyTable">
		<c:forEach var="boardReply" items="${boardReply2 }">
			<c:choose>
				<c:when test="${sessionScope.loginMember.m_id==boardReply.br_m_id }">
					<form action="replyUpdateResult" name="replyUpdateResult" method="post" onsubmit="return replyCheck2();">
						<tr>
							<td colspan="2">
								<input type="hidden" name="b_no" value="${board2.b_no }">
								<textarea class="myReply" type="text" name="br_txt">${boardReply.br_txt }</textarea>
								<input type="hidden" id="userID" name="br_no" value="${boardReply.br_no }">
								<input type="hidden" name="token" value="${token }">
								<input type="hidden" name="beforeReply" value="${boardReply.br_txt }">
							</td>
						</tr>
						<tr>
							<td>
								<button class="replyUpdateBTN">수정</button>
							</td>
					</form>
					<form action="replyDeleteResult" method="post" onsubmit="return boardDeleteCheck();">
							<td>
								<input type="hidden" name="br_no" value="${boardReply.br_no }">
								<input type="hidden" name="b_no" value="${board2.b_no }">
								<button class="replyDeleteBTN">삭제</button>
							</td>
						</tr>
					</form>
						<tr>
							<td class="data" colspan="2">
								${fn:substring(boardReply.br_m_id,0,1) }*******&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${boardReply.br_date }" pattern="yyyy.MM.dd hh:mm:ss"/>
							</td>
						</tr>
						<tr>
							<td class="space" colspan="2">
							</td>
						</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="replyTXT" colspan="2">
							${boardReply.br_txt }
						</td>
					</tr>
					<tr>
						<td class="data" colspan="2">
							${fn:substring(boardReply.br_m_id,0,1) }*******&nbsp;&nbsp;&nbsp;${boardReply.br_date }
						</td>
					</tr>
					<tr>
						<td class="space" colspan="2">
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
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