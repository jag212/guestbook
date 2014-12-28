<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 쓰기</title>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
function GBwrite(){
	if(document.gbwriteForm.email.value == ""){
		alert("E-Mail을 입력하세요");
		return;
	}else if(!mailCheck(document.gbwriteForm.email.value)){
		return;
	}else if(document.gbwriteForm.password.value == ""){
		alert("비밀번호를 입력하세요");
		return;
	}else if(document.gbwriteForm.content.value == ""){
		alert("본문을 입력하세요");
		return;
	}else if(document.gbwriteForm.content.value.length > 1000){
		alert("본문은 1000바이트까지만 작성 가능합니다");
		return;
	}else{
		document.gbwriteForm.action = "${root}/write.html";
		document.gbwriteForm.submit();
	}
}
function mailCheck(mail) {
	re=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 위의 조건을 만족하려면 최소 6자 이상이어야 함.
	if(mail.length<6 || !re.test(mail)) {
		alert("E-Mail 주소를 형식에 맞게 입력하세요");
		mail.select();
		mail.focus();
		return false;
	} else {
		return true;
	}
}
</script>
</head>
<body>
<center>
<h3>방명록 쓰기</h3>
<form action="" method="post" name="gbwriteForm">
<table>
	<tr>
		<td>E-Mail : </td>
		<td><input type="text" name="email" size="20px"></td>
		<td>비밀번호 : </td>
		<td><input type="password" name="password" size="16px" maxlength="16"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea name="content" rows="12" cols="70"></textarea></td>
	</tr>
	<tr>
		<td colspan="4"> * 비밀번호는 최대 16자입니다.<br> ** 글은 1000바이트까지만 작성가능합니다.</td>
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input type="button" name="write" value="글쓰기" onclick="javascript:GBwrite();">
			<input type="reset" value="지우기" style="margin-right: 25px;">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>