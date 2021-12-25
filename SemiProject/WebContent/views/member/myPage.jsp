<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/views/common/header.jsp" />

<style>
		.member-section {
    	display: flex;
    	flex-direction: column;
    	margin-top: 20px;
    	margin-bottom: 50px;
    	text-align:center;
	}
	
		.memberInfo {
    	font-weight: 500;
    	font-size: 35px;
    	line-height: 30px;
    	color: lightsalmon;
    	
    	}
    	
        table {
            border-spacing: 15px;
            font-size: 20px;
            width: 50%;
            margin:0 auto;
            color: lightsalmon;
            margin-bottom: 50px;
        }
        th, td {
            text-align: left;
        }
        
        input {
            border-radius: 5px;
            height: 25px;
        }
        
        .button-section {
        
        text-align: center;
        margin-bottom: 20px;
        
        
        }
        
        .update-button {
        
        text-align: center;
        margin-bottom: 50px;
        
        }
        
        #updatePwd {
            padding: 10px;
    		width: 150px;
    		font-size: 14px;
	    	color: white;
    		background-color: lightsalmon;
    		margin-bottom:30px;
    		border-radius: 10px;
    		border: none;
        }
        
        #btnDelete {
        
            padding: 10px;
    		width: 150px;
    		font-size: 14px;
	    	color: white;
    		background-color: lightsalmon;
    		margin-bottom:30px;
    		border-radius: 10px;
    		border: none;
        
        }
        
        #updateMem {
    		padding: 10px;
    		width: 200px;
    		font-size: 15px;
	    	color: white;
    		background-color: lightsalmon;
    		margin-bottom:50px;
    		border-radius: 10px;
    		border: none;
        }
        
        
        

</style>

<div class="frame">
    <div class="member-section">
            <span class=memberInfo>회원 정보</span>
    </div>
    
    <div>
    <!-- 정보 수정 누르면 이동 -->
    <form id="memberFrm" action="${ pageContext.request.contextPath }/member/update" method="post">
    <!-- 서버로 보내야하나 공개 하지않을 경우  -->
    <%--
    <input type="hidden" name="userNo" value="${loginMember.no }">
     --%>
    <table>
           <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="userId" id="newId" 
                    	value="${ loginMember.id }" readonly required >
                </td>
            </tr>
            
           	<tr>
                <th>이름</th>
                <td>
                    <input type="text" name="userName" id="userName" 
                    	value="${ loginMember.name }"required>	
                </td>
            </tr>
            
            <div class="profile">
            <tr>
                <th>프로필 사진</th>
                <%-- 
                <td>
                	<img id="profile-image" colspan="2" rowspan="2" src="${ pageContext.request.contextPath }/resources/images/profile/profile_image.jpg" alt="">
                </td>
                --%>	
                <td></td>
                <td>
                    <input type="file"  name="uploadfile" id="file">	
				</td>
				
				<%-- 	
				<td>
                     <input type="button"  value="기본사진">
                </td>
                --%>	   
            </tr>
            </div>
            
            <tr>
            	<th>전화번호</th>
            	<td>
            		<input type="tel" name="phone" id="phone" 
            		value="${ loginMember.phone }" maxlength="11">
            	</td>
            </tr>
            
            <tr>
            	<th>이메일</th>
            	<td>
            		<input type="email" name="email" id="email"
                    	value="${ loginMember.email }">
            	</td>
            </tr>
            
            <tr>
            	<th>주소</th>
            	<td>
            		<input type="text" name="address" id="address"
            		value="${ loginMember.address }">
            	</td>
            </tr>
            
 
    </table>
    
            <div class="button-section">
	        <button type="button" id="updatePwd">비밀번호변경</button>
	        <input type="button" id="btnDelete" value="탈퇴">
	        </div>
	        
	        <div class="update-button">
	        <input type="submit" id="updateMem" value="정보수정">
	        </div> 
</form>
</div>
</div>

<script>
	$(document).ready(() => {
		$("#updatePwd").on("click", () => {
			const url = "${ pageContext.request.contextPath }/member/updatePwd";
			const status = "left=700px,top=400px,width=600px,height=400px";
			
			// 새로운 창 
			open(url, "", status);
		});
		
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 탈퇴하시겠습니까?")) {
				location.replace("${ pageContext.request.contextPath }/member/delete");
			}
		});
	});

</script>
<jsp:include page="/views/common/footer.jsp" />