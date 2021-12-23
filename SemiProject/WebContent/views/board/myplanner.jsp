<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<style>
        .label {
            margin: 20px;
        }
        .sch-date {
            margin: 20px;
            padding-left: 20px;
        }

        .outer {
            position: relative;
            /* top: 100px;
            left: 100px;
            border: 1px solid; */
        }

        #first {
            display: inline-block;
            width: 40%;
            height: 500px;
        }

        #second {
            display: inline-block;
            width: 40%;
            height: 500px;
        }

        .outer {
            margin-top: 50px;
        }
        
        .inner {
            margin-left: 70px;
        }

        .schedule {
            size: 20px;
        }
        
        .schedule {
            margin: 20px;
        }

        #planner-btn {
            background-color: skyblue;
            border: 1px solid skyblue;
            color: white;
            font-size: 15px;
            border-radius: 10px;
            width: 200px;
            height: 50px;
            cursor: pointer;
            float: right;
            margin-right: 100px;
        }
        
</style>

<section>
		<br>
        <h1>마이 플래너</h1>
        <br>
        <hr>
        <h2 align="center">나 혼자 제주도 간다(1박 2일)</h2>
        <label class="label">출발일</label><input type="text" id="s-date" readonly><br><br>
        <label class="label">도착일</label><input type="text" id="s-date" readonly><br><br>
        <hr>
        
        <div class="outer">
            <div class="inner" id="first">
                <h2 class="sch-date">1일차</h2>
                <ul style="font-size: 30px;">
                    <li class="schedule">
                        <input type="text" id="d1s1" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d1s2" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d1s3" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d1s4" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d1s5" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d1s6" readonly>
                    </li>
                </ul>
                
            </div>
            <div class="inner" id="second">
                <h2 class="sch-date">2일차</h2>
                <ul style="font-size: 30px;">
                    <li class="schedule">
                        <input type="text" id="d2s1" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d2s2" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d2s3" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d2s4" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d2s5" readonly>
                    </li>
                    <li class="schedule">
                        <input type="text" id="d2s6" readonly>
                    </li>
                </ul>
        		<button id="planner-btn" onclick="location.href='${ pageContext.request.contextPath }/board/Write'">플래너 수정 및 추가</button>
            </div>
        </div>
        

    </section>

<jsp:include page="/views/common/footer.jsp" />