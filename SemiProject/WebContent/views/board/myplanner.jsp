<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="/views/common/header.jsp" />
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
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
        <h1>진짜 마이 플래너(--일단은 페이지는 고정하기로함--)</h1>
        <br>
        <hr>
        <h2 align="center">나 혼자 제주도 간다(1박 2일)</h2>
        
        <form>
			<!-- 여행 제목을 입력해주세요.. -->
			<label><input type="text" name="travel_title" placeholder="여행제목을 입력해주세요."></label> <br>
			<!-- 출발일 -->
			<label for="dateIn">여행 시작 날짜 : </label> 
        	<input type="date" name="dateIn" id="dateIn" onchange="call()"> <br>
        	<!-- 등록일 -->
			<label for="dateIn">여행 끝 날짜 : </label> 
        	<input type="date" name="dateIn2" id="dateIn2" onchange="call()" > <br>  	<!-- value="${ now }"일단 아님 -->
        	
        	<br>
        	<input type="submit" value="계획 추가" > <!-- 얘를 누르면 밑에 뭐가 1일차 2일차 등등이 생김 -->
        	
        	
        	<!-- 출발일과 등록일의 차이 구현? -->
        	<script>
        	 function call(){
        
        	var sdd = document.getElementById("dateIn").value; //출발일 :2021-12-20
    		var edd = document.getElementById("dateIn2").value;//등록일 :2021-12-22 (총3일차)
   			var ar1 = sdd.split('-'); //-문자를 빼는것 : 20211220
    		var ar2 = edd.split('-'); //-문자를 뺴는것 : 20211222
    		var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
   			 var dif = da2 - da1;
    		var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
   			
 			if(sdd && edd){
   			document.getElementById('days').value = parseInt(dif/cDay)+1 //20일, 21일 22일 총3일차니까 +1해주었다.
   			//call 함수 호출후에 두 날짜의 차이를 days에 넣어줌.
			 }
        	}
        	
        	 </script>
        	<br> 
        	총 <input type="text" id="days" size="2" style="text-align:center;">일 의 여행계획입니다.<br><br><br><!-- 이건걍넣어봄 -->
        	      	
			
			</form>

        <hr>
        
        <div class="outer">
            <div class="inner" id="first">
                <h2 class="sch-date">1일차</h2> <!-- 1일차 -->
                
                <script>
                var arrInput = new Array(0);
                var arrInputValue = new Array(0);

                function addInput() {
                	arrInput.push(arrInput.length);
               	arrInputValue.push("");
               	display();
               }

               function display() {
               	document.getElementById('parah').innerHTML="";
               for (intI=0;intI<arrInput.length;intI++) {
                 document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
               	}
               }

               function saveValue(intId,strValue) {
               	arrInputValue[intId]=strValue;
               }  

               function createInput(id,value) {
               	return "<input type='text' id='test "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='여행 계획을 입력하세요."+ 

               	value +"'><br>";
               	}

               function deleteInput() {
               if (arrInput.length > 0) { 
                  arrInput.pop(); 
                  arrInputValue.pop();
               } 
               display(); 
               }
                
                </script>
                <p>계획 추가(+),삭제(-)</p><BR>
			<form action ="/board/myplanner" method = "post" enctype="multipart/form-data"> <!-- 데이터 넘겨주는폼 -->
			<input type="button" value="추가" onclick="addInput();" />
			<input type="button" value="삭제" onclick="deleteInput();"/>

		
			<div id="parah"></div>
			</form>
            </div>
            
            
            
            
            <div class="inner" id="second">
            <h2 class="sch-date">2일차</h2>    <!--   2일차   -->
			 <script>
				 
			 var arrInput2 = new Array(0);
			 var arrInputValue2 = new Array(0);

			 function addInput2() {
			 	arrInput2.push(arrInput2.length);
				arrInputValue2.push("");
				display2();
			}

			function display2() {
				document.getElementById('parah2').innerHTML="";
			for (intI=0;intI<arrInput2.length;intI++) {
			  document.getElementById('parah2').innerHTML+=createInput2(arrInput2[intI], arrInputValue2[intI]);
				}
			}

			function saveValue2(intId,strValue) {
				arrInputValue2[intId]=strValue;
			}  

			function createInput2(id,value) {
				return "<input type='text' id='test " + id +"' onChange='javascript:saveValue2("+ id +",this.value)' value='여행 계획을 입력하세요."+ 

				value +"'><br>";
				}

			function deleteInput2() {
			if (arrInput2.length > 0) { 
			   arrInput2.pop(); 
			   arrInputValue2.pop();
			}
			display2(); 
			}

				</script>
 			<p>계획 추가(+),삭제(-)</p><BR>




			<input type="button" value="추가" onclick="addInput2();" />
			<input type="button" value="삭제" onclick="deleteInput2();"/>
			<input type="submit" value="전송"/>

			<div id="parah2"></div>

				<br><br><br><br><br><br>
				
				<a href="#" onclick="location.href='/views/board/myplanWrite.jsp';">이동 버튼(저장)</a>
				
        		<button type="button" id="planner-btn" onclick="location.href='${ pageContext.request.contextPath }/board/myPlanWrite'">
        		 저장 </button><!-- 왜 이동안하냐? -->
            </div>
        </div>
        

    </section>

<jsp:include page="/views/common/footer.jsp" />