<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<div class="container">
    <div class="menu-bar">
        <ul>
            <li><a href="${ pageContext.request.contextPath }/spot/spotList">여행지</a></li>
            <li><a href="${ pageContext.request.contextPath }/stay/stayList">숙박</a></li>
            <li><a href="${ pageContext.request.contextPath }/food/foodList">맛집</a></li>
            <li><a href="${ pageContext.request.contextPath }/board/myPlanner">마이 플래너</a></li>
            <li><a href="${ pageContext.request.contextPath }/review/reviewList">여행 후기</a></li>
        </ul>
    </div>
    
    <div class="contents">
        <div class="search">
            <input type="text" placeholder="떠나고 싶은 여행지를 입력해주세요.">
            <button type="submit" title="검색"></button>
        </div>
        
        <div class="select-map">
            <img src="${ pageContext.request.contextPath }/resources/images/map.png" alt="" class="img-map">
            <ul class="location-list">
            <li><a href="#">추자도</a></li>
            <li><a href="#">차귀도</a></li>
            <li><a href="#">비양도</a></li>
            <li><a href="#">한경면</a></li>
            <li><a href="#">한림읍</a></li>
            <li><a href="#">애월읍</a></li>
            <li><a href="#">제주시</a></li>
            <li><a href="#">조천읍</a></li>
            <li><a href="#">구좌읍</a></li>
            <li><a href="#">우도</a></li>
            <li><a href="#">성산읍</a></li>
            <li><a href="#">표선면</a></li>
            <li><a href="#">남원읍</a></li>
            <li><a href="#">서귀포시</a></li>
            <li><a href="#">중문</a></li>
            <li><a href="#">안덕면</a></li>
            <li><a href="#">대정읍</a></li>
            <li><a href="#">가파도</a></li>
            <li><a href="#">마라도</a></li>
            </ul>
        </div>

        <div class="thumb-list spot">
            <h3>여행지</h3>
            <ul>
		      	<c:forEach var="spot" items="${ spotList }" begin="0" end="7">
			        <li>
			          <a href="${ pageContext.request.contextPath }/spot/spotDetail">
			            <div class="img-thumb">
			              <img src="${ pageContext.request.contextPath }${ spot.imgPath }${ spot.no }.png" alt="">
			            </div>
			            <strong>${ spot.title }</strong>
			            <p>${ spot.content }</p>
			          </a>
			        </li>
		        </c:forEach>
	      	</ul>
        </div>

        <div class="thumb-list">
            <h3>숙박</h3>
            <ul>
		      	<c:forEach var="stay" items="${ stayList }" begin="0" end="7">
			        <li>
			          <a href="">
			            <div class="img-thumb">
			              <img src="${ pageContext.request.contextPath }${ stay.imgPath }${ stay.no }.png" alt="">
			            </div>
			            <strong>${ stay.title }</strong>
			            <p>${ stay.content }</p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>

        <div class="thumb-list">
            <h3>맛집</h3>
            <ul>
		      	<c:forEach var="rest" items="${ restList }" begin="0" end="7">
			        <li>
			          <a href="">
			            <div class="img-thumb">
			              <img src="${ pageContext.request.contextPath }${ rest.imgPath }${ rest.no }.png" alt="">
			            </div>
			            <strong>${ rest.title }</strong>
			            <p>${ rest.content }</p>
			          </a>
			        </li>
		        </c:forEach>
      		</ul>
        </div>

        <div class="thumb-list">
            <h3>여행 후기</h3>
            <ul>
            <li>
                <a href="#">
	                <div class="img-thumb">
	                    <img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
	                </div>
	                <strong>닭머르 해안에서 일몰 즐기기</strong>
	                <p>닭머르 해안은 어쩌고 저쩌고 시간에 가면 일몰을 볼 수 있어요. 블라블라.닭머르 해안은 어쩌고 저쩌고 시간에 가면 일몰을 볼 수 있어요. 블라블라.</p>
                </a>
            </li>
            <li>
                <a href="#">
	                <div class="img-thumb">
	                    <img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
	                </div>
	                <strong>닭머르 해안에서 일몰 즐기기 닭머르 해안에서 일몰 즐기기</strong>
	                <p>닭머르 해안은 어쩌고 저쩌고 시간에 가면 일몰을 볼 수 있어요. 블라블라.</p>
                </a>
            </li>
            <li>
                <a href="#">
	                <div class="img-thumb">
							<img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
						</div>
	                <strong>닭머르 해안에서 일몰 즐기기</strong>
	                <p>닭머르 해안은 어쩌고 저쩌고 시간에 가면 일몰을 볼 수 있어요. 블라블라.</p>
                </a>
            </li>
            <li>
                <a href="#">
	                <div class="img-thumb">
	                    <img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
	                </div>
	                <strong>닭머르 해안에서 일몰 즐기기</strong>
	                <p>닭머르 해안은 어쩌고 저쩌고 시간에 가면 일몰을 볼 수 있어요. 블라블라.</p>
                </a>
            </li>
            <li>
                <a href="#">
	                <div class="img-thumb">
	                    <img src="${ pageContext.request.contextPath }/resources/images/spot/spot01.png" alt="">
	                </div>
	                <strong>닭머르 해안에서 일몰 즐기기</strong>
	                <p>닭머르 해안은 어쩌고 저쩌고 시간에 가면 일몰을 볼 수 있어요. 블라블라.</p>
                </a>
            </li>
            </ul>
        </div>

    </div>
</div>
 
<jsp:include page="/views/common/footer.jsp" />