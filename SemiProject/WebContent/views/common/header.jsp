<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<header>
		<div class="member-container">
			<c:if test="${ empty loginMember }">
				<button class="btn" onclick="location.href='${ path }/member/login'">로그인</button> |
				<button class="btn" onclick="location.href='${ path }/member/enroll'">회원가입</button>
			</c:if>
			<c:if test="${ !empty loginMember }">
				<table>
					<tr>
						<td colspan="2">
							${ loginMember.name } 님 안녕하세요.
						</td>
					</tr>
					<tr>
						<td>
							<button>내 정보</button>
						</td>
						<td>
							<button onclick="location.replace('${ path }/logout')">로그아웃</button>
						</td>
					</tr>
				</table>
			</c:if>
		</div>	
	</header>