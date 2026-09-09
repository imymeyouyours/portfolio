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

    <title>Books Details</title>

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

    </style>

</head>


<body>


<form class="container"
      id="booksForm">

    <h1>Books Details</h1>


    <!-- 저서번호 -->
    <div class="form-group">

        <label>저서번호</label>

        <input type="text"
               class="form-control"
               id="bs_num"
               name="bs_num"
               readonly>

    </div>


    <!-- ISBN -->
    <div class="form-group">

        <label>ISBN</label>

        <input type="text"
               class="form-control"
               id="bs_bk_isbn"
               name="bs_bk_isbn">

    </div>


    <!-- 역할 -->
    <div class="form-group">

        <label>역할</label>

        <input type="text"
               class="form-control"
               id="bs_part"
               name="bs_part">

    </div>


    <!-- 이름 -->
    <div class="form-group">

        <label>이름</label>

        <input type="text"
               class="form-control"
               id="bs_name"
               name="bs_name">

    </div>


    <!-- 작가번호 -->
    <div class="form-group">

        <label>작가번호</label>

        <input type="text"
               class="form-control"
               id="bs_au_num"
               name="bs_au_num">

    </div>


    <button type="submit"
            class="btn btn-info col-12">

        수정

    </button>

</form>


<script>

$(document).ready(function () {


    // ==========================================
    // URL에서 bs_num 가져오기
    // ==========================================

    const params =
        new URLSearchParams(window.location.search);

    const bs_num =
        params.get("bs_num");


    console.log("bs_num:", bs_num);


    if (!bs_num) {

        alert("저서번호가 없습니다.");

        location.href =
            "<%=request.getContextPath()%>/bookslist";

        return;
    }


    // ==========================================
    // 저서 상세 조회
    // ==========================================

    $.ajax({

        url:
            "<%=request.getContextPath()%>/api/booksdetails",

        type:
            "GET",

        data: {

            bs_num: bs_num

        },


        success: function (books) {

            console.log(
                "저서 상세 조회 성공:",
                books
            );


            $("#bs_num").val(
                books.bs_num
            );


            $("#bs_bk_isbn").val(
                books.bs_bk_isbn
            );


            $("#bs_part").val(
                books.bs_part
            );


            $("#bs_name").val(
                books.bs_name
            );


            $("#bs_au_num").val(
                books.bs_au_num
            );

        },


        error: function (xhr) {

            console.log(
                "저서 상세 조회 실패"
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
                    "해당 저서를 찾을 수 없습니다."
                );

            } else {

                alert(
                    "저서 정보를 불러오지 못했습니다."
                );

            }

        }

    });



    // ==========================================
    // 저서 수정
    // ==========================================

    $("#booksForm").submit(function (e) {

        e.preventDefault();


        const formData = {

            bs_num:
                $("#bs_num").val(),

            bs_bk_isbn:
                $("#bs_bk_isbn").val(),

            bs_part:
                $("#bs_part").val(),

            bs_name:
                $("#bs_name").val(),

            bs_au_num:
                $("#bs_au_num").val()

        };


        console.log(
            "수정 요청 데이터:",
            formData
        );


        $.ajax({

            url:
                "<%=request.getContextPath()%>/api/booksdetails",

            type:
                "POST",

            data:
                formData,


            success: function (data) {

                console.log(
                    "저서 수정 결과:",
                    data
                );


                if (data === true) {

                    alert(
                        "저서 정보가 수정되었습니다."
                    );


                    location.href =
                        "<%=request.getContextPath()%>/bookslist";

                } else {

                    alert(
                        "저서 수정에 실패했습니다."
                    );

                }

            },


            error: function (xhr) {

                console.log(
                    "저서 수정 실패"
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
                    "저서 수정에 실패했습니다."
                );

            }

        });

    });

});

</script>


</body>

</html>