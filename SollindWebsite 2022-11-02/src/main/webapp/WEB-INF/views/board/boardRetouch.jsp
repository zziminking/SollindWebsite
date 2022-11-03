<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table id="boardRetouchTable">
	<form action="boardRetouchResult" name="boardRetouch" enctype="multipart/form-data" method="post" onsubmit="return boardRetouchCheck();">
			<tr>
				<td id="type" colspan="2">
					<select name="type">
						<option>${board2.b_type }</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="img" colspan="2">
					입력안할시 기존 이미지 사용<br>
					<input name="img" type="file" autocomplete="off">
					<input type="hidden" name="beforeFileName" value="${board2.b_img }">
				</td>
			</tr>
			<tr>
				<td id="title" colspan="2">
					<input type="hidden" name="token" value="${token }">
					<input type="hidden" name="boardNo" value="${board2.b_no }">
					<input type="text" name="title" placeholder="글 제목" value="${board2.b_title }">
				</td>
			</tr>
			<tr>
				<td id="txt" colspan="2">
					<textarea name="text" placeholder="글 내용">${board2.b_txt }</textarea>
				</td>
			</tr>
			<tr>
				<td id="retouch">
					<button>수정</button>
				</td>
	</form>
	<form action="boardDeleteResult" method="post" onsubmit="return boardDeleteCheck();">
				<td id="delete">
					<input type="hidden" name="b_no" value="${board2.b_no }">
					<input type="hidden" name="beforeFileName" value="${board2.b_img }">
					<button>삭제</button>
				</td>
			</tr>
	</form>
		</table>
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