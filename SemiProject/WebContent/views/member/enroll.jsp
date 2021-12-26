<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:include page="/views/common/header.jsp" />

<style>

       	#E-title {
       		margin-top: 5%;
       	}

        table {
            border-spacing: 0px;
            font-size: 15px;
            width: 35%;
            margin-top: 5%;
            margin-bottom: 10%;
            margin-left: 42.5%;
            padding: 0px;
            border: hidden;
        }

        th, td {
            text-align: left;
            border-spacing: 0px;
            padding: 0px;
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
            margin: 10px; 
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
            <h2 align="center" id="E-title"><button id="top_btn" onclick="location.href='javascript:history.back();'"><img src="${ pageContext.request.contextPath }/resources/images/direction.png" alt=""></button> 회원가입</h2> 
        
        <div>
        	<form name="memberEnrollFrm" action="${ pageContext.request.contextPath }/member/enroll" method="post">
	            <table>
	                <tr>
	                    <th style="width: 100px">아이디</th>
	                    <td style="width: 150px;">
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
	                    	<input type="password" id="pass2" required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>이름</th>
	                    <td>
	                    	<input type="text" name="userName" id="" placeholder="내용을 입력해주세요" required>
	                    </td>
	                </tr>	                
	                <tr>
                    	<th>휴대폰</th>
                    	<td>
                    		<input type="tel" name="phone" id="phone" maxlength="11" placeholder="(-없이)01012345678" required>
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
	                
	                <tr><td>
	                </td>
                    <td colspan="3">
                        <input type="submit" id="enrollSubmit" value="회원가입" style="margin-left: 50px">	
                    </td>
                    <td></td>
                   
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