<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
<style>
    body{
       background-image: url(<%=request.getContextPath()%>/resources/js/whitewater.jpg); 
       background-size: 300%;
    }
    .container{
      padding: 30px; margin: 120px auto; width: 700px;
    }
    h1{
      font-size: 40px; text-align: center; font-weight: bold;
      font-style: italic; letter-spacing: 0; color: #000;  margin-bottom : 40px;
    }
    .address .form-control{
        margin-bottom: 5px;
    }
    #jumin1, #jumin2{
        display: inline;
    }
    .birth .form-control{
        display: inline;
    }
    .error{
    	color:red;
    }
</style>
</head>
<body>
    <form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
        <div class="box1">
            <h1>SignUp</h1>
            <div class="form-group">
            <label>아이디</label>
            <input type="text" class="form-control" placeholder="아이디" id="id" name="me_id">
            </div>
            <button type="button" class="id-dup-btn mb-3 col-12 btn btn btn-outline-secondary">아이디 중복 확인</button>
            <div class="form-group">
            <label>비밀번호</label>
            <input type="password" class="form-control" placeholder="비밀번호" id="pw" name="me_password">
            </div>
            <div class="form-group">
                <label>비밀번호 재확인</label>
                <input type="password" class="form-control" placeholder="비밀번호" id="pw2" name="me_password2">
            </div>
            <div class="form-group">
                <label>이름</label>
                <input type="text" class="form-control" placeholder="이름" id="name" name="me_name">
            </div>
            <div class="form-group">
                <label>닉네임</label>
                <input type="text" class="form-control" placeholder="닉네임" id="nickname" name="me_nickname">
            </div>
        </div>

        <div class="box2">
            <div class="form-group address">
                <label>주소</label>
                <input class="form-control"type="text" id="sample4_postcode" placeholder="우편번호">
                <input class="form-control"type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input class="form-control"type="text" id="sample4_roadAddress" placeholder="도로명주소">
                <input class="form-control"type="text" id="sample4_jibunAddress" placeholder="지번주소">
                <span class="form-control"id="guide" style="color:#999;display:none"></span>
                <input class="form-control"type="text" id="sample4_detailAddress" placeholder="상세주소">
                <input class="form-control"type="text" id="sample4_extraAddress" placeholder="참고항목">
                <input type="hidden" name="me_address">
                <input type="hidden" name="me_jAddress">
            </div>
            <div class="form-group">
            <label>전화번호</label>
            <input type="text" class="form-control" placeholder="전화번호" id="phone" name="me_phone">
            </div>
            <div class="form-group">
            <label>성별</label>
            <select class="form-control" name="me_gender" id="gender">
            	<option>성별</option>
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select>
            </div>
            <div class="form-group birth">
            <label>생년월일</label> <br>
                <input class="form-control col-5" type="year" placeholder="년(4자)" maxlength="4">
                <select class="form-control col-2" name="month">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
                <input class="form-control col-4" type="day" placeholder="일" maxlength="2">
                <input type="hidden" name="me_birth">
            </div>
            <div class="form-group" name=" me_resident_num">
                <label>주민번호</label> <br>
                <input type="text" placeholder="주민번호" id="jumin1" class="form-control col-5" maxlength="6"> - 
                <input type="password" placeholder="주민번호" id="jumin2" class="form-control col-5" maxlength="7">
                <input type="hidden" name="me_resident_num">
            </div>
            <div class="form-group">
                <label>이메일</label>
                <input type="text" class="form-control" placeholder="이메일" id="email" name="me_email">
            </div>
        </div>
        <button class="btn btn-info col-12">회원가입</button>
    </form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
$(function(){
	/*
	 $('form').submit(function(){
	    
	 })
	 $('form').submit(function(){
	 
	 })
*/
	$("form").validate({
	    rules: {
	        me_id: {
	            required : true,
	            regex : /^[a-z0-9_-]{5,20}$/
	        },
	        me_password: {
	            required : true,
	            regex: /^[a-z0-9!@#]{8,16}$/i
	        },
	        me_password2: {
	            required : true,
	            equalTo : pw
	        },
	        me_name: {
	            required : true
	        },
	        me_nickname: {
	            required : true
	        },
	        me_gender: {
	        	required : true
	        },
	        me_phone: {
	        	required : true
	        },
	        me_birth : {
	        	required : true
	        },
	        me_resident_num: {
	        	required : true
	        },	        
	        me_email: {
	            required : true,
	            email : true
	        }
	    },
	    //규칙체크 실패시 출력될 메시지
	    messages : {
	        me_id: {
	            required : "필수 정보입니다.",
	            regex : "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."
	        },
	        me_password: {
	            required : "필수 정보입니다.",
	            regex : "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
	        },
	        me_password2: {
	            required : "필수 정보입니다.",
	            equalTo : "비밀번호와 일치하지 않습니다."
	        },
	        me_name: {
	            required : "필수 정보입니다."
	        },
	        me_nickname: {
	            required : "필수 정보입니다."
	        },
	        me_gender: {
	        	required : "필수 정보입니다."
	        },
	        me_phone: {
	        	required : "필수 정보입니다."
	        },
	        me_birth : {
	        	required : "필수 정보입니다."
	        },
	        me_resident_num: {
	        	required : "필수 정보입니다."
	        },
	        me_email: {
	            required : "필수 정보입니다.",
	            email : "메일규칙에 어긋납니다."
	        }
	    }, submitHandler: function(form){
	 
	    	 var sp = $('input[id=sample4_postcode]').val();
		     var road = $('input[id=sample4_roadAddress]').val();
		     var jibun = $('input[id=sample4_jibunAddress]').val();
		     var detail = $('input[id=sample4_detailAddress]').val();
		     var extra = $('input[id=sample4_extraAddress]').val();
		     var address = sp+", "+road+" "+detail+" "+extra;
		     var jAddress = sp+", "+jibun+" "+detail+" "+extra;
		     $('[name=me_address]').val(address);
		     $('[name=me_jAddress]').val(jAddress);
		     
		     var year = $('[type=year]').val();
		     var month = $('[name=month]').val();
		     var day = $('[type=day]').val();
		     var birth = year+"년"+month+"월"+day+"일";
		     $('[name=me_birth]').val(birth);
		     
		     var jumin1 = $('#jumin1').val();
		     var jumin2 = $('#jumin2').val();
		     var jumin = jumin1+jumin2;
		     $('[name=me_resident_num]').val(jumin);
		 
		     $('form').submit();
	    }
	});
 $('.id-dup-btn').click(function(){
   	var id = $('[name=me_id]').val();
   	var res = memberService.idCheck(contextPath, id);
   	if(res == 0)
   		alert('올바른 아이디를 입력하세요.');
   	else if(res == 1)
   		alert('가입 가능한 아이디입니다.');
   	else
   		alert('이미 가입된 아이디입니다.');
   })
})

$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "Please check your input."
);
	
var contextPath = '<%=request.getContextPath()%>';
var memberService = (function(){
	function idCheck(contextPath, id){
		var flag = -1;
		$.ajax({
			async: false,
    		type : 'post',
    		url  : contextPath + '/id/check',
    		data : {id : id},
    		success : function (res){
    			if(res == 'NO'){
    				flag = 0;
    			}else if(res == 'POSSIBLE'){
    				flag = 1;
    			} else{
    				flag = -1;
    			}
    		}
    	})
    	return flag;
	}
	return {
		name : 'memberService',
		idCheck : idCheck
	}
})();
</script>
</body>
</html>