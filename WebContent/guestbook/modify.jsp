<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �� �����ϱ�</title>
<script type="text/javascript">
function GBwrite(){
	if(document.gbwriteForm.password.value == ""){
		alert("��й�ȣ�� �Է��ϼ���");
		return;
	}else if(document.gbwriteForm.content.value == ""){
		alert("������ �Է��ϼ���");
		return;
	}else if(document.gbwriteForm.content.value.length > 1000){
		alert("������ 1000����Ʈ������ �ۼ� �����մϴ�");
		return;
	}else{
		document.gbwriteForm.action = "${root}/modify.html";
		document.gbwriteForm.submit();
	}
}
function GBdelete(){
	if(confirm("���� �����Ͻðڽ��ϱ�?")){
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
<h3>���� �� �����ϱ�</h3>
<form name="modifyForm" method="post">
<input type="hidden" name="seq" value="${gbDto.seq}">
<table>
	<tr>
		<td>E-Mail : </td>
		<td>${gbDto.email}</td>
		<td>��й�ȣ : </td>
		<td><input type="password" name="password" size="16px" maxlength="16" value="${gbDto.password}"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea name="content" rows="12" cols="70">${gbDto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="4"> * ��й�ȣ�� �ִ� 16���Դϴ�.<br> ** ���� 1000����Ʈ������ �ۼ������մϴ�.</td>
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input type="button" name="write" value="�����ϱ�" onclick="javascript:GBmodify();">
			<input type="button" value="�ۻ���" style="margin-right: 25px;" onclick="GBdelete();">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>