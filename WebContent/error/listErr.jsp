<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 목록 로딩 실패</title>
</head>
<body>
<center>
글 목록을 불러오는데 실패하였습니다..<br>
5초 후 다시 이동합니다....
</center>
<script type="text/javascript">
setTimeout("location.href='/guestbook/list.html'",5000);
</script>
</body>
</html>