<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<input id="myBoardStandard" type="hidden" value="${boardTo[0].b_no }">
	<input id="user" type="hidden" value="${sessionScope.loginMember.m_id }">
	<table id="boardType">
		<tr>
			<c:choose>
				<c:when test="${nowType==\"\" }">
		       		<td id="type1" style="color: black;">전체</td>
				</c:when>
				<c:otherwise>
		       		<td id="type1">전체</td>
				</c:otherwise>
			</c:choose>
			<c:forEach var="typeList" items="${typeList }" varStatus="status">
				<c:choose>
					<c:when test="${typeList==nowType }">
			       		<td id="type${status.count+1}" style="color: black;">${typeList }</td>
					</c:when>
					<c:otherwise>
			       		<td id="type${status.count+1}">${typeList }</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>
	</table>
	<table id="boardTable">
		<c:forEach var="board" items="${boardTo }">
			<c:if test="${i%j == 0 }">
	    		<tr>
	    	</c:if>
	    	<c:choose>
				<c:when test="${i%j == 0 }">
		       		<td class="boardTableTd" style="border-right: solid 2px #E0E0E0;">
				</c:when>
				<c:otherwise>
		       		<td class="boardTableTd">
				</c:otherwise>
			</c:choose>
	       			<table class="eachBoardTable">
	       				<tr>
	       					<td class="eachBoardTitle" align="left">
	       						<c:choose>
									<c:when test="${fn:length(board.b_title) > 15}">
							       		<a href="goBoardDetail?b_no=${board.b_no }">${fn:substring(board.b_title,0,15) }...</a>&nbsp;
									</c:when>
									<c:otherwise>
							       		<a href="goBoardDetail?b_no=${board.b_no }">${board.b_title }</a>&nbsp;
									</c:otherwise>
								</c:choose>
	       						<c:if test="${sessionScope.loginMember.m_id==board.b_m_id }">
		       						<a href="goBoardRetouch?b_no=${board.b_no }"><button>수정</button></a>
	       						</c:if>
	       					</td>
	       					<td rowspan="2" class="eachBoardImg" align="center">
		       					<c:if test="${board.b_img ne 'noImage' }">
									<img src="resources/img/boardImg/${board.b_img }">
								</c:if>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td class="eachBoardTxt" align="left" valign="middle">
		       					<c:choose>
									<c:when test="${fn:length(board.b_txt) > 50}">
							       		<a href="goBoardDetail?b_no=${board.b_no }">${fn:substring(board.b_txt,0,50) }...</a>
									</c:when>
									<c:otherwise>
							       		<a href="goBoardDetail?b_no=${board.b_no }">${board.b_txt }</a>
									</c:otherwise>
								</c:choose>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td class="eachBoardDdabong">
	       						<img src="resources/icon/ddabong.png">&nbsp;${board.b_ddabong }
	       					</td>
	       					<td align="right" class="eachBoardDate">
								${fn:substring(board.b_m_id,0,1) }*******&nbsp;${board.b_date }
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
</body>
</html>