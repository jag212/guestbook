<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �ۺ���</title>
</head>
<body>
<form name="gblistForm" method="post">
<center>
<h3>���� ����Ʈ</h3>
	<table border="1px" bordercolor="#ffffff" cellpadding="1px">
		<tr>
			<td colspan="4" align="right">
				<input type="button" name="write" value="�۾���">
			</td>
		</tr>
		<tr>
			<td>
			<!-- List�� for�� ���� ���̺� -->
				<table bordercolor="#ffffff" border="1px" cellpadding="1px" width="500px;">
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
						<td align="center"><input type="password" name="password" size="10"></td>
						<td align="center" width="80px"><input type="button" name="mvmodify" value="�����ϱ�"
							onclick="javascript:mvmodify(${gbDto.seq});"></td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" name="write" value="�۾���">
			</td>
		</tr>
	</table>
</center>
</form>
</body>
</html>