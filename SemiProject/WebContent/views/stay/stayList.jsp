<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/views/common/header.jsp" />


<div class="container">
  <div class="contents">
    <h2 class="page-tit">숙박</h2>
    <div class="thumb-list">
      <h3>호텔</h3>
      <ul>
        <c:forEach var="hotel" items="${ hotelList }" begin="0" end="9">
	        <li>
	          <a href="#">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }/resources/images/stay/stay01.png" alt="">
	            </div>
	            <strong>${ hotel.name }</strong>
	            <p>${ hotel.content }</p>
	          </a>
	        </li>
	     </c:forEach>
      </ul>
      <button type="button" class="btn-more">더보기</button>
    </div>

    <div class="thumb-list">
      <h3>에어비엔비</h3>
      <ul>
      	<c:forEach var="airbnb" items="${ airbnbList }" begin="0" end="9">
	        <li>
	          <a href="#">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }/resources/images/stay/stay01.png" alt="">
	            </div>
	            <strong>${ airbnb.name }</strong>
	            <p>${ airbnb.content }</p>
	          </a>
	        </li>
	     </c:forEach>
      </ul>
      <button type="button" class="btn-more">더보기</button>
    </div>

    <div class="thumb-list">
      <h3>펜션</h3>
      <ul>
      	<c:forEach var="pension" items="${ pensionList }" begin="0" end="9">
	        <li>
	          <a href="#">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
	            </div>
	            <strong>${ pension.name }</strong>
	            <p>${ pension.content }</p>
	          </a>
	        </li>
	     </c:forEach>
      </ul>
      <button type="button" class="btn-more">더보기</button>
    </div>

    <div class="thumb-list">
      <h3>캠핑</h3>
      <ul>
        <c:forEach var="camping" items="${ campingList }" begin="0" end="9">
	        <li>
	          <a href="#">
	            <div class="img-thumb">
	              <img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
	            </div>
	            <strong>${ camping.name }</strong>
	            <p>${ camping.content }</p>
	          </a>
	        </li>
	     </c:forEach>
      </ul>
      <button type="button" class="btn-more">더보기</button>
    </div>

  </div>
</div>


<jsp:include page="/views/common/footer.jsp" />
