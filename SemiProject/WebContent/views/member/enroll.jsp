<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<style>

       

        table {
            border-spacing: 15px;
            font-size: 20px;
            width: 50%;
            margin:0 auto;
        }

        th, td {
            text-align: left;
        }
        
        input {
            border-radius: 5px;
            height: 25px;
        }

        #enrollSubmit {
            background-color: #4575cb;
            color: white;
            border: 1px solid #4575cb;
            font-size: 15px;
            border-radius: 10px;
        }

        img {
            width: 30px;
            height: 20px;
            margin-right: 20px;
        }

        #top_btn {
            background-color: transparent;
            cursor: pointer;
            border: none;
        }
</style>

<section id="content">
    <div>        
            <h2 align="center"><button id="top_btn" onclick="location.href='${ pageContext.request.contextPath }/'"><img src="resources/images/direction.png" alt=""></button> 회원가입</h2> 
        
        <div>
        	<form name="memberEnrollFrm" action="${ pageContext.request.contextPath }/member/enroll" method="post">
	            <table>
	                <tr>
	                    <th>아이디</th>
	                    <td>
	                    	<input type="text" name="userId" id="newId" placeholder="내용을 입력해주세요" required>
	                    </td>
	                    <td>
	                    	<input type="button" id="checkDuplicate" value="중복검사" >
	                    </td>
	                </tr>
	                <tr>
	                    <th>비밀번호</th>
	                    <td>
	                    	<input type="password" name="userPwd" id="pass1" required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>비밀번호 확인</th>
	                    <td>
	                    	<input type="password" id="pass2">
	                    </td>
	                </tr>
	                <tr>
	                    <th>이름</th>
	                    <td>
	                    	<input type="text" name="userName" id="" placeholder="내용을 입력해주세요" required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>프로필 사진</th>
	                    <td></td>
	                    <td><input type="file" name="photo" id="photo"></td>
	                </tr>
	                <tr>
                    	<th>휴대폰</th>
                    	<td>
                    		<input type="tel" name="phone" id="phone" maxlength="11" placeholder="(-없이)01012345678">
                    	</td>
                	</tr>
                	<tr>
                    	<th>주소</th>
                    	<td><input type="text" name="address" id="address"></td>
                	</tr> 
	                <tr>
	                    <th>이메일</th>
	                    <td><input type="email" name="email" id="email" placeholder="abc@abc.com"></td>
	                </tr>
	                
	                <tr>
                    <td colspan="3" style="text-align: center;" >
                        <input type="submit" id="enrollSubmit" value="회원가입">	
                    </td>
                </tr>
	            </table>
            </form>
        </div>
    </div>
</section>
<script>
	// 아이디 중복 확인
	$(document).ready(() => {
		$("#checkDuplicate").on("click", () => {
			let userId = $("#newId").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/member/idCheck",
				dataType: "json",
				data: {
					userId
				},
				success: (data) => {
					console.log(data);
					
					if(data.duplicate === true) {
						alert("이미 사용중인 아이디 입니다.");
					} else {
						alert("사용 가능한 아이디 입니다.");						
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});		
	});
	
	
	
	
	
	
	
	

</script>
<jsp:include page="/views/common/footer.jsp" />