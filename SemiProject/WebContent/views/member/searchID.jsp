<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div {
            margin: 15px;
            border: 1px solid gray;
            padding: 10px;
            text-align: center;
        }

        div table {
            margin:0 auto;
        }
        #btn1 {
            margin-right: -4px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
            background-color: skyblue;
            color: white;
        }
        #btn2 {
            margin-left: -3px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            background-color: transparent;
            color: skyblue;
        }

        .tb_btn {
            background-color: transparent;
            color: skyblue;
            border-radius: 10px;
            border: 1px solid skyblue;
        }
        
        #btn_group button{
            border: 1px solid skyblue;
            display: inline-block;
            height: 50px;
            width: 150px;
            font-size: 2.5ex;
            cursor: pointer;
        }

        #top_btn {
            background-color: transparent;
            cursor: pointer;
            border: none;
        }

        #btn_group {
            height: 50px;
        }

        #submit {
            height: 50px;
            width: 285px;
            border-radius: 10px;
            background-color: skyblue;
            color: white;
            border: 1px solid skyblue;
            font-size: 2.5ex;
        }

        img {
            width: 30px;
            height: 20px;
            margin-right: 20px;
        }
        
    </style>
</head>
<body>
    <div style="font-size: 20px;">
        <button id="top_btn"><img src="./resources/화살표.png" alt=""></button> 아이디 / 비밀번호 찾기
    </div>

    <div id="btn_group">
        <button id="btn1">아이디 찾기</button>
        <button id="btn2">비밀번호 찾기</button>
    </div>

    <div>
        <form action="">
            <table >
                <tr>
                    <td>
                        <input type="number" name="" id="" placeholder="휴대전화번호 입력('-'제외)">
                    </td>
                    <td>
                        <button class="tb_btn" style="width: 100%;">인증번호 전송</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="number" name="" id="" placeholder=" 인증번호 입력">
                    </td>
                    <td>
                        <button class="tb_btn" style="width: 100%;">확인</button>
                    </td>
                </tr>
            </table>
            
        </div>
        <div>
            <input id="submit" type="submit" value="아이디 찾기">
        </div>
    </form>
            
</body>
</html>