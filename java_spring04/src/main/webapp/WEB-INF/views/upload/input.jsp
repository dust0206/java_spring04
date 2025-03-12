<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
<style>
	iframe {
		width: 400px; height:200px; border: 1px; border-style: solid;
	}
</style>	
	</head>
<body>

	<%@ include file="../include/menu.jsp" %>
	<!-- 파일 첨부시 꼭 들어 가야 한다 - enctype="multipart/form-data" -->
	<form id="form1" action="/spring04/upload/upload.do" method="post" enctype="multipart/form-data" target="iframe1">
		<input type="file" name="file">
		<input type="submit" value="업로드">
	</form>
	
	<iframe name="iframe1"></iframe>	<!-- 내부프레임 -->
</body>
</html>