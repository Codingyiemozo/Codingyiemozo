<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/views/common/header.jsp" />


<div class="container">
  <div class="contents">
    <h2 class="page-tit">여행지</h2>
    
    <p>게시글 번호: ${ board.no }</p> <br>
    <p>게시글 제목: ${ board.title }</p> <br>
    <p>여행지 형태: ${ board.type }</p> <br>
    <p>이미지 경로: ${ board.imgPath }</p> <br>
    <p>여행지 주소: ${ board.addr }</p> <br><br>
    <p>가격: ${ board.price }</p> <br><br>
    <p>휴무일: ${ board.offday }</p> <br><br>
    <p>내용: ${ board.content }</p> <br>
    <p>위도(x): ${ board.xlat }</p> <br><br>
    <p>경도(y): ${ board.ylong }</p> <br><br>
    <p>지역: ${ board.local }</p> <br><br>
    
    
    <p>슬라이드에 넣을 이미지</p>
    <img src="${ pageContext.request.contextPath }${ board.imgPath }${ board.no }_1.png" alt="">
    <img src="${ pageContext.request.contextPath }${ board.imgPath }${ board.no }_2.png" alt="">
    <img src="${ pageContext.request.contextPath }${ board.imgPath }${ board.no }_3.png" alt="">
    

  </div>
</div>


<jsp:include page="/views/common/footer.jsp" />

