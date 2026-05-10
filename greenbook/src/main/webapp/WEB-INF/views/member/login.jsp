<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-image: url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);
        }

        .container {
            padding: 30px;
            margin: 120px auto;
            width: 600px;
        }

        h1 {
            font-size: 40px;
            text-align: center;
            font-weight: bold;
            font-style: italic;
            letter-spacing: 0;
            color: #000;
            margin-bottom: 40px;
        }

        .form-check {
            display: flex;
        }

        .find {
            margin-left: 265px;
        }

        .find a {
            color: grey;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Login</h1>
    <div class="form-group">
        <label>아이디</label>
        <input type="text" class="form-control" placeholder="아이디" id="id" name="me_id">
    </div>
    <div class="form-group">
        <label>비밀번호</label>
        <input type="password" class="form-control" placeholder="비밀번호" id="pw" name="me_password">
    </div>
    <div class="form-group form-check">
        <label class="form-check-label">
            <input class="form-check-input" name="useCookie" type="checkbox"> 자동로그인
        </label>
        <div class="find">
            <a href="<%=request.getContextPath()%>/find/id" class="findId">아이디찾기 | </a>
            <a href="<%=request.getContextPath()%>/find/pw" class="findPw">비밀번호찾기</a>
        </div>
    </div>
    <button class="btn btn-info col-12" id="loginBtn">로그인</button>
</div>

<script>


    $(document).ready(function () {


        $('#loginBtn').click(function () {

            let id = $('#id').val();
            let pwd = $('#pw').val();
            let useCookie = $('input[name=useCookie]').is(':checked');

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/greenbook/api/login',  // 요청 URI
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({me_id: id, me_password: pwd, useCookie: useCookie}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function () {
                    location.href = '/greenbook/';
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })
    })

</script>
</body>

</html>