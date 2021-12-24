<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<jsp:include page="/views/common/header.jsp" />

    <div class="container">
        <div class="contents">
            <h2 class="page-tit">여행후기</h2>
            <div class="reviewTitle">
                <div id="reviewTitle">${ review.rv_title }</div>
                <div class="reviewWriteInf">
                    <div id="reviewGroup">${ review.rv_type }</div>
                    <div id="userName">${ member.name }</div>
                    <div id="reviewUploadDate">${ review.rv_date }</div>
                    <div id="reviewHits">${ review.rv_hits }</div>
                </div>
            </div>
            <div class="reviewContents">
                ${ review.rv_content }
            </div>
            <div id="form-commentInfo">
                <div id="comment-count">댓글 <span id="count">0</span></div>
                <input id="comment-input" placeholder="댓글을 입력해 주세요."></input>
                <button id="btn-commentSubmit">등록</button>
            </div>
            <div class="comments">
                <div id="commentWriter">김이영 ${ comment.cm_writer }</div>
                <div id="commentContent">우와 맛있을거 같아요! ${ comment.cm_content }</div>
                <div id="commentSubmitDate">2021-12-22 ${ comment.cm_submitdate }</div>
                <button id="btn-commentdelete">삭제</button>
            </div>
            <div>
                <button id="btn-list"onclick = "location.href = '/views/review/reviewList.jsp' ">목록</button>
            </div>
        </div>
    </div>


<jsp:include page="/views/common/footer.jsp" />