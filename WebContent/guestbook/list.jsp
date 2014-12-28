<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>방명록 글보기</title>
<script type="text/javascript">
function mvwrite(){
	document.location.href="${root}/mvwrite.html";
}
function mvmodify(seq){
	if(document.gblistForm.password.value==""){
		alert("비밀번호를 입력하세요");
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
<center>
<h3>방명록 리스트</h3>
	<table border="1px" bordercolor="#ffffff" cellpadding="1px">
		<tr>
			<td colspan="4" align="right">
				<input type="button" name="write" value="글쓰기" onclick="javascript:mvwrite();">
			</td>
		</tr>
		<tr>
			<td align="center">
			<c:if test="${gbList==null}">
				작성된 글이 없습니다.
			</c:if>
			<c:if test="${gbList!=null}">
			<!-- List의 for문 돌릴 테이블 -->
				<table bordercolor="#ffffff" border="1px" cellpadding="1px" width="500px;">
					<c:forEach var="gbDto" items="${gbList}">
					<tr>
						<td>E-Mail : </td>
						<td>${gbDto.email}</td>
						<td>최초작성 : </td>
						<td>${gbDto.logtime}</td>
					</tr>
					<tr>
						<td colspan="4">${gbDto.content}</td>
					</tr>
					<tr>
						<td>마지막 수정날짜 : </td>
						<td>${gbDto.modilog}</td>
						<td align="center"><input type="password" name="password" size="10" maxlength="16"></td>
						<td align="center" width="80px"><input type="button" value="수정하기"
							onclick="javascript:mvmodify(${gbDto.seq});"></td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" name="write" value="글쓰기" onclick="javascript:mvwrite();">
			</td>
		</tr>
	</table>
</center>
</form>
</body>
</html>