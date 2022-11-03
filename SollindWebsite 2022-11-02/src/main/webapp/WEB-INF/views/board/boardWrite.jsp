<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardWriteResult" name="boardWrite" enctype="multipart/form-data" method="post" onsubmit="return boardWriteCheck();">
		<table id="boardWriteTable">
			<tr>
				<td id="type">
					<select name="type">
						<option>자유게시판</option>
						<option>이직·커리어</option>
						<option>헬스</option>
						<option>회사생활</option>
						<option>여행</option>
						<option>알쓸신잡</option>
						<option>연애</option>
						<option>스포츠</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="img">
					<input name="img" type="file" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td id="title">
					<input type="hidden" name="token" value="${token }">
					<input type="text" name="title" maxlength="25" autocomplete="off" placeholder="글 제목">
				</td>
			</tr>
			<tr>
				<td id="txt">
					<textarea name="text" maxlength="400" autocomplete="off" placeholder="글 내용"></textarea>
				</td>
			</tr>
			<tr>
				<td id="check">
					<button>글 작성 완료</button>
				</td>
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