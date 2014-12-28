<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 글 수정하기</title>
<script type="text/javascript">
function GBwrite(){
	if(document.gbwriteForm.password.value == ""){
		alert("비밀번호를 입력하세요");
		return;
	}else if(document.gbwriteForm.content.value == ""){
		alert("본문을 입력하세요");
		return;
	}else if(document.gbwriteForm.content.value.length > 1000){
		alert("본문은 1000바이트까지만 작성 가능합니다");
		return;
	}else{
		document.gbwriteForm.action = "${root}/modify.html";
		document.gbwriteForm.submit();
	}
}
function GBdelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		document.gbwriteForm.action = "${root}/delete.html";
		document.gbwriteForm.submit();
	} else{
		return;
	}
}
</script>
</head>
<body>
<center>
<h3>방명록 글 수정하기</h3>
<form name="modifyForm" method="post">
<input type="hidden" name="seq" value="${gbDto.seq}">
<table>
	<tr>
		<td>E-Mail : </td>
		<td>${gbDto.email}</td>
		<td>비밀번호 : </td>
		<td><input type="password" name="password" size="16px" maxlength="16" value="${gbDto.password}"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea name="content" rows="12" cols="70">${gbDto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="4"> * 비밀번호는 최대 16자입니다.<br> ** 글은 1000바이트까지만 작성가능합니다.</td>
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input type="button" name="write" value="수정하기" onclick="javascript:GBmodify();">
			<input type="button" value="글삭제" style="margin-right: 25px;" onclick="GBdelete();">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>