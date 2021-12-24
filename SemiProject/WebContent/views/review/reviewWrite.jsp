<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/views/common/header.jsp" />


<div class="container">
	<div class="contents">
		<h2 class="page-tit">여행후기</h2>

		<div class="reviewWrite">
			<form action="write.jsp" method="post">
				<div class="form-group">
					<input type="text" class="form-control" id="title"
						placeholder="제목을 입력해 주세요." name="title" required="required">
				</div>
				<div class="form-group">
					<select id="select-group">
						<option value="여행지">여행지</option>
						<option value="맛집">맛집</option>
						<option value="숙소">숙소</option>
					</select>
					<!-- api로 텍스트 내 옵션.. -->
				</div>
				<div id="form-writer">작성자 이름</div>
				<div class="form-group">
					<textarea class="form-control" rows="15" id="form-content"
						name="content" placeholder="내용 작성"></textarea>
				</div>
				<div>
					<button type="submit" id="btn-rv_submit">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/views/common/footer.jsp" />
