<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<jsp:include page="/views/common/header.jsp" />

    <div class="container">
        <div class="contents">
            <h2 class="page-tit">여행후기</h2>
            <div class="reviewTitle">
                <div id="reviewTitle">${ review.rv_title }</div>
                <div id="reviewHits">조회수 ${ review.rv_hits }</div>
                <div class="reviewWriteInf">
                    <div id="reviewType">${ review.rv_type }</div>
                    <div id="userName">작성자 ${ review.mem_nm }</div>
                    <div id="reviewUploadDate">${ review.rv_date }</div>
                </div>
            </div>
            <div class="reviewContents">
                ${ review.rv_content }
            </div>
            <!-- 
            <div id="form-commentInfo">
                <div id="comment-count">댓글 <span id="count">0</span></div>
                <input id="comment-input" placeholder="댓글을 입력해 주세요."></input>
                <button type="submit" id="btn-commentSubmit">등록</button>
            </div>
             -->
            <div id="comment-container">
	            <div class="comment-editor">
		            <form action="${ pageContext.request.contextPath }/review/comment" method="POST" id="frm-comment">
		            	<input type=hidden name="rv_no" value="${ review.rv_no }">
		            	<textarea name="cm_content" id="commentContent" rows="3" cols="55"></textarea>
		            	<button type="submit" id="btn-insert">등록</button>
		            </form>
	            </div>
	            <table id="tbl-comment">
			    	<c:forEach var="comment" items="${ review.comments }">
				    	<tr class="level1">
				    		<td>
				    			<sub class="comment-writer"><c:out value="${ comment.mem_nm }"/></sub>
				    			<sub class="comment-date"><fmt:formatDate type="date" value="${ comment.cm_date }"/></sub>
				    			<br>
				    			<c:out value="${ comment.cm_content }"/>
				    		</td>
				    		<td>
				    			<c:if test="${ ! empty loginMember && loginMember.mem_nm == comment.mem_nm }">
			    					<button id="#btn-commentdelete">삭제</button>
		    					</c:if>
				    		</td>
				    	</tr>
			    	</c:forEach>
	            </table>
	            <div>
            </div>
                <button id="btn-list"onclick = "location.href = '/views/review/reviewList.jsp' ">목록</button>
            </div>
        </div>
    </div>


<jsp:include page="/views/common/footer.jsp" />
