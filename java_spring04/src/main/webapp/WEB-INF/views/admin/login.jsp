<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("btnLogin").click(function() {
			let userid=$("#userid").val();
			let passwd=$("#passwd").val();
			if(userid == "") {
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return;
			}
			if(passwd == "") {
				alert("비번을  입력하세요");
				$("#passwd").focus();
				return;
			}
			document.form1.action="/spring04/admin/login_check.do";
			document.form1.submit();
		});
	});
</script>
	</head>
<body>
	<%@ include file="../include/menu.jsp" %>
	<h2>관리자 로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input id="userid" name="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id="passwd" name="passwd"></td>
			</tr>
			<tr >
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
					<c:if test="${message == 'error' }">
						<div style="color:red">
							아이디 또는 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
					<c:if test="${message == 'ㅣlogout' }">
						<div style="color:red">
							로그아웃 되었습니다.
						</div>
					</c:if>
					<c:if test="${message == 'ㅣnologin' }">
						<div style="color:red">
							로그인 하신 후 사용하세요
						</div>
					</c:if>
				</td>
				
			</tr>
		</table>
	
	</form>
</body>
</html>