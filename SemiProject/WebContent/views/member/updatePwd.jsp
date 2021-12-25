<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
<style>
    .updatepwd-section {
        display: flex;
        flex-direction: column;
        margin-top: 40px;
        margin-bottom: 40px;
        text-align: center;
    }

    .updatePwd {
        font-weight: 500px;
        font-size: 35px;
        line-height: 20px;
        color: lightsalmon;
    }

    table {
        margin: 0 auto;
        border-spacing: 20px;
        font-size: 15px;
        color: lightsalmon;
    }

    tr, td {
        text-align: center;
    }

    .pwdbtn-section {
        text-align: center;
        margin-bottom: 50px;
    }
    
    #updatePwdBtn {
        padding: 10px;
        width: 100px;
        font-size: 15px;
        color: white;
        background-color: lightsalmon;
        margin-bottom: 30px;
        border-radius: 10px;
        border: none;
    }

    #closeBtn {
        padding: 10px;
        width: 100px;
        font-size: 15px;
        color: white;
        background-color: lightsalmon;
        margin-bottom: 30px;
        border-radius: 10px;
        border: none;
    }
</style>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>

    <div class="updatepwd-section">
        <span class="updatePwd">비밀번호 변경</span>
    </div>
    
	<div id="updatePassword-container">
		<form action="${ pageContext.request.contextPath }/member/updatePwd" method="post">
        <table>
        	  
            <tr>
                <th>현재 비밀번호</th>
                <td>
                    <input type="password" name="nowPwd" id="nowPwd">
                </td>
            </tr>
             
            

            <tr>
                <th>새 비밀번호</th>
                <td>
                    <input type="password" name="newPwd" id="newPwd" required>
                </td>
            </tr>

            <tr>
                <th>새 비밀번호 확인</th>
                <td>
                    <input type="password" name="checkPwd" id="checkPwd">
                </td>
            </tr>
            
            <div class="pwdbtn-section"></div>
            <tr>
                <td colspan="2">
                    <input type="submit" id="updatePwdBtn" value="변경" onclick="return validate();">
                    &nbsp;
                    <input type="button" id="closeBtn" value="닫기" onclick="self.close();">
                </td>
            </tr>
        </div>
        </table>
			<input	type="hidden" name="userId">	
		</form>
	</div>
	<script>
	
		// 비밀번호 일치 확인 
		function validate() {
			let pass1 = $("#pass1").val();
			let pass2 = $("#pass2").val();
			
			if(pass1.trim() != pass2.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pass1").val("");
				$("#pass2").val("");
				$("#pass1").focus();
				
				return false;
			}
		}
	</script>
</body>
</html>
