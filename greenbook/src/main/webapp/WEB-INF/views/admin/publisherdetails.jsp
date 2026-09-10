<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Publisher Details</title>

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

<form class="container" id="publisherForm">

    <h1>Publisher Details</h1>

    <div class="form-group">
        <label>출판사번호</label>

        <input type="text"
               class="form-control"
               id="pu_num"
               name="pu_num"
               readonly>
    </div>

    <div class="form-group">
        <label>출판사명</label>

        <input type="text"
               class="form-control"
               id="pu_name"
               name="pu_name">
    </div>

    <div class="form-group">
        <label>전화번호</label>

        <input type="text"
               class="form-control"
               id="pu_phone"
               name="pu_phone">
    </div>

    <div class="form-group">
        <label>대표자명</label>

        <input type="text"
               class="form-control"
               id="pu_ceo"
               name="pu_ceo">
    </div>

    <button type="submit"
            class="btn btn-info col-12">
        수정
    </button>

</form>


<script>

$(document).ready(function () {

    // URL에서 pu_num 가져오기
    const params =
        new URLSearchParams(window.location.search);

    const pu_num =
        params.get("pu_num");


    if (!pu_num) {

        alert("출판사 번호가 없습니다.");

        location.href =
            "<%=request.getContextPath()%>/publisherlist";

        return;
    }


    // ==============================
    // 출판사 상세 조회
    // ==============================

    $.ajax({

        url:
            "<%=request.getContextPath()%>/api/publisherdetails",

        type:
            "GET",

        data: {
            pu_num: pu_num
        },

        success: function (publisher) {

            console.log(
                "출판사 정보:",
                publisher
            );

            $("#pu_num")
                .val(publisher.pu_num);

            $("#pu_name")
                .val(publisher.pu_name);

            $("#pu_phone")
                .val(publisher.pu_phone);

            $("#pu_ceo")
                .val(publisher.pu_ceo);
        },

        error: function (xhr) {

            console.log(
                "출판사 조회 실패:",
                xhr.status,
                xhr.responseText
            );

            if (xhr.status === 404) {

                alert(
                    "출판사 정보를 찾을 수 없습니다."
                );

            } else {

                alert(
                    "출판사 정보를 불러오지 못했습니다."
                );
            }
        }
    });


    // ==============================
    // 출판사 수정
    // ==============================

    $("#publisherForm").submit(function (e) {

        e.preventDefault();


        const formData = {

            pu_num:
                $("#pu_num").val(),

            pu_name:
                $("#pu_name").val(),

            pu_phone:
                $("#pu_phone").val(),

            pu_ceo:
                $("#pu_ceo").val()
        };


        console.log(
            "출판사 수정 요청:",
            formData
        );


        $.ajax({

            url:
                "<%=request.getContextPath()%>/api/publisherdetails",

            type:
                "POST",

            data:
                formData,

            success: function (data) {

                if (data === true) {

                    alert(
                        "출판사 정보가 수정되었습니다."
                    );

                    location.href =
                        "<%=request.getContextPath()%>/publisherlist";

                } else {

                    alert(
                        "출판사 정보 수정에 실패했습니다."
                    );
                }
            },

            error: function (xhr) {

                console.log(
                    "수정 실패:",
                    xhr.status,
                    xhr.responseText
                );

                alert(
                    "출판사 정보 수정에 실패했습니다."
                );
            }
        });
    });

});

</script>

</body>
</html>
