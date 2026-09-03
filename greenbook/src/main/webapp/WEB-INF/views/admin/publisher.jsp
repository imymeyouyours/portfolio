<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Publisher</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>

    <style>

        .container {
            padding: 30px;
            margin: 70px auto;
            width: 700px;
            background-color: white;
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

    </style>

</head>

<body>

<form class="container" id="publisherForm">

    <h1>Publisher</h1>

    <div class="form-group">
        <label for="pu_name">출판사명</label>

        <input type="text"
               class="form-control"
               id="pu_name"
               name="pu_name">
    </div>


    <div class="form-group">
        <label for="pu_phone">전화번호</label>

        <input type="text"
               class="form-control"
               id="pu_phone"
               name="pu_phone">
    </div>


    <div class="form-group">
        <label for="pu_ceo">대표자명</label>

        <input type="text"
               class="form-control"
               id="pu_ceo"
               name="pu_ceo">
    </div>


    <button type="submit"
            class="btn btn-info col-12">
        등록
    </button>

</form>


<script>

    $(document).ready(function () {

        $('#publisherForm').submit(function (e) {

            // form 기본 전송 막기
            e.preventDefault();


            const publisher = {

                pu_name: $('#pu_name').val(),

                pu_phone: $('#pu_phone').val(),

                pu_ceo: $('#pu_ceo').val()

            };


            $.ajax({

                url: '<%=request.getContextPath()%>/api/publisher',

                type: 'POST',

                contentType: 'application/json; charset=UTF-8',

                dataType: 'json',

                data: JSON.stringify(publisher),


                success: function (res) {

                    console.log('출판사 등록 성공:', res);

                    alert(res.message);

                    location.href =
                        '<%=request.getContextPath()%>/publisherlist';

                },


                error: function (xhr, status, error) {

                    console.log('출판사 등록 실패:', error);

                    console.log(xhr.responseText);


                    if (xhr.responseJSON &&
                        xhr.responseJSON.message) {

                        alert(xhr.responseJSON.message);

                    } else {

                        alert('출판사 등록 중 오류가 발생했습니다.');

                    }

                }

            });

        });

    });

</script>

</body>

</html>