<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 쓰기</title>
</head>
<body>
<center>
<form action="" method="post" name="gbwirteForm">
<table>
	<tr>
		<td>E-Mail : </td>
		<td><input type="text" size="20px"></td>
		<td>비밀번호 : </td>
		<td><input type="password" size="16px" maxlength="16"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea rows="12" cols="70"></textarea></td>
	</tr>
	<tr>
		<td colspan="4"> * 비밀번호는 최대 16자입니다.<br> ** 글은 1000바이트까지만 작성가능합니다.</td>
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input type="button" name="write" value="글쓰기">
			<input type="reset" value="지우기">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>