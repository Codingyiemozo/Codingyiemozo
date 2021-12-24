<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
 	<h5>작성 출력 페이지</h5>
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
	<h2 align="center">나 혼자 제주도 간다(1박 2일)</h2>
	출발일 :   <!-- 데이터 받아올 수 있게 -->
	<br>
	도착일 :
	<br>
	여행일 :
	<br><br><br>
	<hr>
</section>
<!-- -------------------------------------------------- -->
<section>
	<div class="outer">
		<div class="inner" id="first">
			<h2 class="sch-date">1일차</h2> <!-- 1일차 -->
			<!-- 입력한거 받아오는거 출력 -->
			
			
		</div>
		
		<div class="inner" id="second">
			<h2 class="sch-date">2일차</h2>    <!--   2일차   -->
			<!-- 입력한거 받아오는거 출력 -->
		
		
		</div>
	
	
	
	</div>

</section>

	<button> 플래너 수정 및 추가</button>



<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<jsp:include page="/views/common/footer.jsp" />