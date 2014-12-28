<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
function GBwrite(){
	if(document.gbwriteForm.email.value == ""){
		alert("E-Mail�� �Է��ϼ���");
		return;
	}else if(!mailCheck(document.gbwriteForm.email.value)){
		return;
	}else if(document.gbwriteForm.password.value == ""){
		alert("��й�ȣ�� �Է��ϼ���");
		return;
	}else if(document.gbwriteForm.content.value == ""){
		alert("������ �Է��ϼ���");
		return;
	}else if(document.gbwriteForm.content.value.length > 1000){
		alert("������ 1000����Ʈ������ �ۼ� �����մϴ�");
		return;
	}else{
		document.gbwriteForm.action = "${root}/write.html";
		document.gbwriteForm.submit();
	}
}
function mailCheck(mail) {
	re=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// ���� ������ �����Ϸ��� �ּ� 6�� �̻��̾�� ��.
	if(mail.length<6 || !re.test(mail)) {
		alert("E-Mail �ּҸ� ���Ŀ� �°� �Է��ϼ���");
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
<h3>���� ����</h3>
<form action="" method="post" name="gbwriteForm">
<table>
	<tr>
		<td>E-Mail : </td>
		<td><input type="text" name="email" size="20px"></td>
		<td>��й�ȣ : </td>
		<td><input type="password" name="password" size="16px" maxlength="16"></td>
	</tr>
	<tr>
		<td colspan="4"><textarea name="content" rows="12" cols="70"></textarea></td>
	</tr>
	<tr>
		<td colspan="4"> * ��й�ȣ�� �ִ� 16���Դϴ�.<br> ** ���� 1000����Ʈ������ �ۼ������մϴ�.</td>
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input type="button" name="write" value="�۾���" onclick="javascript:GBwrite();">
			<input type="reset" value="�����" style="margin-right: 25px;">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>