<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible"
          content="IE=edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Registration Details</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <style>

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

        textarea[name="re_contents"] {
            resize: none;
            height: 400px;
        }

    </style>

</head>


<body>


<form class="container"
      id="registrationForm">

    <h1>Registration Details</h1>


    <div class="form-group">

        <label>등록코드</label>

        <input type="text"
               class="form-control"
               id="re_code"
               name="re_code"
               readonly>

    </div>


    <div class="form-group">

        <label>ISBN</label>

        <input type="text"
               class="form-control"
               id="re_bk_isbn"
               name="re_bk_isbn"
               readonly>

    </div>


    <div class="form-group">

        <label>도서명</label>

        <input type="text"
               class="form-control"
               id="re_title"
               name="re_title">

    </div>


    <div class="form-group">

        <label>가격</label>

        <input type="number"
               class="form-control"
               id="re_price"
               name="re_price"
               min="0">

    </div>


    <div class="form-group">

        <label>카테고리</label>

        <input type="text"
               class="form-control"
               id="re_catagory"
               name="re_catagory">

    </div>


    <div class="form-group">

        <label>책소개</label>

        <textarea class="form-control"
                  id="re_contents"
                  name="re_contents"></textarea>

    </div>


    <div class="form-group">

        <label>수량</label>

        <input type="number"
               class="form-control"
               id="re_amount"
               name="re_amount"
               min="0">

    </div>


    <div class="form-group">

        <label>그린초이스</label>
        <br>

        N
        <input type="radio"
               value="N"
               name="re_choice"
               id="re_choice_n">

        Y
        <input type="radio"
               value="Y"
               name="re_choice"
               id="re_choice_y">

    </div>


    <button type="submit"
            class="btn btn-info col-12">

        수정

    </button>

</form>


<script>

$(document).ready(function () {


    // ==========================================
    // URL에서 re_code 가져오기
    // ==========================================

    const params =
        new URLSearchParams(window.location.search);

    const re_code =
        params.get("re_code");


    if (!re_code) {

        alert("등록코드가 없습니다.");

        location.href =
            "<%=request.getContextPath()%>/registrationlist";

        return;
    }



    // ==========================================
    // 판매가능서적 상세 조회
    // ==========================================

    $.ajax({

        url:
            "<%=request.getContextPath()%>/api/registrationdetails",

        type:
            "GET",

        data: {

            re_code: re_code

        },


        success: function (regi) {

            console.log(
                "판매가능서적 상세 조회 성공:",
                regi
            );


            $("#re_code").val(
                regi.re_code
            );


            $("#re_bk_isbn").val(
                regi.re_bk_isbn
            );


            $("#re_title").val(
                regi.re_title
            );


            $("#re_price").val(
                regi.re_price
            );


            $("#re_catagory").val(
                regi.re_catagory
            );


            $("#re_contents").val(
                regi.re_contents
            );


            $("#re_amount").val(
                regi.re_amount
            );


            // 그린초이스
            if (regi.re_choice === "Y") {

                $("#re_choice_y")
                    .prop("checked", true);

            } else {

                $("#re_choice_n")
                    .prop("checked", true);

            }

        },


        error: function (xhr) {

            console.log(
                "판매가능서적 상세 조회 실패"
            );

            console.log(
                "status:",
                xhr.status
            );

            console.log(
                "response:",
                xhr.responseText
            );


            if (xhr.status === 404) {

                alert(
                    "해당 판매가능서적을 찾을 수 없습니다."
                );

            } else {

                alert(
                    "판매가능서적 정보를 불러오지 못했습니다."
                );

            }

        }

    });



    // ==========================================
    // 판매가능서적 수정
    // ==========================================

    $("#registrationForm").submit(function (e) {

        e.preventDefault();


        const formData = {

            re_code:
                $("#re_code").val(),

            re_bk_isbn:
                $("#re_bk_isbn").val(),

            re_title:
                $("#re_title").val(),

            re_price:
                $("#re_price").val(),

            re_catagory:
                $("#re_catagory").val(),

            re_contents:
                $("#re_contents").val(),

            re_amount:
                $("#re_amount").val(),

            re_choice:
                $("input[name='re_choice']:checked").val()

        };


        console.log(
            "수정 요청 데이터:",
            formData
        );


        $.ajax({

            url:
                "<%=request.getContextPath()%>/api/registrationdetails",

            type:
                "POST",

            data:
                formData,


            success: function (data) {

                console.log(
                    "판매가능서적 수정 결과:",
                    data
                );


                if (data === true) {

                    alert(
                        "판매가능서적 정보가 수정되었습니다."
                    );


                    location.href =
                        "<%=request.getContextPath()%>/registrationlist";

                } else {

                    alert(
                        "판매가능서적 수정에 실패했습니다."
                    );

                }

            },


            error: function (xhr) {

                console.log(
                    "판매가능서적 수정 실패"
                );

                console.log(
                    "status:",
                    xhr.status
                );

                console.log(
                    "response:",
                    xhr.responseText
                );


                alert(
                    "판매가능서적 수정에 실패했습니다."
                );

            }

        });

    });

});

</script>


</body>

</html>
