<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />


<style>
        #loginSubmit {
            background-color: #4575cb;
            border: 1px solid #4575cb;
            color: white;
            width: 100px;
            height: 50px;
            margin-bottom: 2ex;
        }
        #loginFrm {
        	margin-top: 50px;
        	margin: 50px auto 0;
        }
        #loginFrm table {
            margin:0 auto;
            border:1px solid black;
            width: 30%
        }

        #l-menu {
            margin-top: 20px;
            text-align: center;
            
        }

        .l-btn {
            background-color: transparent;
            border: none;
            cursor: pointer;
        }

        tr {
            line-height: 300%;
        }
</style>

<div class="container">
 <section id="contents" class="contents">
 	<h2 class="page-tit">로그인</h2>
 	<form id="loginFrm" action="${ pageContext.request.contextPath }/member/login" method="post">
 	
		<table>
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." ></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
 				<input type="submit" id="loginSubmit" value="Login">
				</td>
			</tr>
		</table>
		
		<div id="l-menu">
            <input class="l-btn" type="button" value="회원가입" onclick="location.href='${ path }/member/enroll'"> |
            <input class="l-btn" type="button" value="아이디 찾기" onclick="location.href='${ path }/member/search'">
        </div>
	 	
 	
 	</form>
 	
 </section>
</div>
 
<jsp:include page="/views/common/footer.jsp" />