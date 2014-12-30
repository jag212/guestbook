<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �ۺ���</title>
<script type="text/javascript">
function mvwrite(){
	document.location.href="${root}/mvwrite.html";
}
function mvmodify(seq){
	var password = document.getElementById("pass"+seq).value;
	document.gblistForm.password.value = password;
	if(document.gblistForm.password.value==""){
		alert("��й�ȣ�� �Է��ϼ���");
		return;
	} else{
		document.gblistForm.seq.value=seq;
		document.gblistForm.action="${root}/mvmodify.html";
		document.gblistForm.submit();
	}
}
</script>
</head>
<body>
<form name="gblistForm" method="post">
<input type="hidden" name="seq">
<input type="hidden" name="password">
<center>
<h3>���� ����Ʈ</h3>
	<table width="500px">
		<tr>
			<td colspan="4" align="right">
				<input type="button" name="write" value="�۾���" onclick="javascript:mvwrite();">
			</td>
		</tr>
		<tr>
			<td align="center">
			<c:if test="${gbList.size()==0}">
				�ۼ��� ���� �����ϴ�.
			</c:if>
			<c:if test="${gbList.size()!=0}">
			<!-- List�� for�� ���� ���̺� -->
				<table width="500px;">
					<c:forEach var="gbDto" items="${gbList}">
					<tr>
						<td>E-Mail : </td>
						<td>${gbDto.email}</td>
						<td>�����ۼ� : </td>
						<td>${gbDto.logtime}</td>
					</tr>
					<tr>
						<td colspan="4">${gbDto.content}</td>
					</tr>
					<tr>
						<td>������ ������¥ : </td>
						<td>${gbDto.modilog}</td>
						<td align="center"><input type="password" id="pass${gbDto.seq}" size="10" maxlength="16"></td>
						<td align="center" width="80px"><input type="button" value="�����ϱ�"
							onclick="javascript:mvmodify(${gbDto.seq});"></td>
					</tr>
					<tr>
						<td colspan="4" height="1px" bgcolor="#888888"></td>
					</tr>
					</c:forEach>
				</table>
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" name="write" value="�۾���" onclick="javascript:mvwrite();">
			</td>
		</tr>
	</table>
</center>
</form>
</body>
</html>