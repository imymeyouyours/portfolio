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

    <title>Author Details</title>

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

        textarea[name="au_contents"] {
            resize: none;
            height: 400px;
        }

    </style>

</head>

<body>


<form class="container"
      id="authorForm">

    <h1>Author Details</h1>


    <div class="form-group">

        <label>작가번호</label>

        <input type="text"
               class="form-control"
               id="au_num"
               name="au_num"
               readonly>

    </div>


    <div class="form-group">

        <label>저자</label>

        <input type="text"
               class="form-control"
               id="au_writer"
               name="au_writer">

    </div>


    <div class="form-group">

        <label>대표작</label>

        <input type="text"
               class="form-control"
               id="au_title"
               name="au_title">

    </div>


    <div class="form-group">

        <label>작가소개</label>

        <textarea class="form-control"
                  id="au_contents"
                  name="au_contents"></textarea>

    </div>


    <div class="form-group">

        <label>생년월일</label>

        <input type="date"
               class="form-control"
               id="au_birth"
               name="au_birth">

    </div>


    <button type="submit"
            class="btn btn-info col-12">

        수정

    </button>

</form>


<script>

    $(document).ready(function () {

        const params =
            new URLSearchParams(window.location.search);

        const au_num =
            params.get("au_num");


        if (!au_num) {

            alert("작가번호가 없습니다.");

            location.href =
                "<%=request.getContextPath()%>/authorlist";

            return;
        }


        // ==============================
        // 저자 상세 조회
        // ==============================

        $.ajax({

            url:
                "<%=request.getContextPath()%>/api/authordetails",

            type:
                "GET",

            data: {
                au_num: au_num
            },

            success: function (author) {

                console.log(
                    "저자 상세 조회 성공:",
                    author
                );

                console.log(
                    "생년월일 원본:",
                    author.au_birth
                );


                $("#au_num").val(
                    author.au_num
                );

                $("#au_writer").val(
                    author.au_writer
                );

                $("#au_title").val(
                    author.au_title
                );

                $("#au_contents").val(
                    author.au_contents
                );


                const birth =
                    formatDateForInput(
                        author.au_birth
                    );


                console.log(
                    "변환된 생년월일:",
                    birth
                );


                $("#au_birth").val(
                    birth
                );

            },

            error: function (xhr) {

                console.log(
                    "저자 상세 조회 실패"
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
                        "해당 저자를 찾을 수 없습니다."
                    );

                } else {

                    alert(
                        "저자 정보를 불러오지 못했습니다."
                    );

                }

            }

        });



        // ==============================
        // 저자 수정
        // ==============================

        $("#authorForm").submit(function (e) {

            e.preventDefault();


            const formData = {

                au_num:
                    $("#au_num").val(),

                au_writer:
                    $("#au_writer").val(),

                au_title:
                    $("#au_title").val(),

                au_contents:
                    $("#au_contents").val(),

                au_birth:
                    $("#au_birth").val()

            };


            console.log(
                "수정 요청 데이터:",
                formData
            );


            $.ajax({

                url:
                    "<%=request.getContextPath()%>/api/authordetails",

                type:
                    "POST",

                data:
                    formData,

                success: function (data) {

                    console.log(
                        "저자 수정 결과:",
                        data
                    );


                    if (data === true) {

                        alert(
                            "저자 정보가 수정되었습니다."
                        );

                        location.href =
                            "<%=request.getContextPath()%>/authorlist";

                    } else {

                        alert(
                            "저자 수정에 실패했습니다."
                        );

                    }

                },

                error: function (xhr) {

                    console.log(
                        "저자 수정 실패"
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
                        "저자 수정에 실패했습니다."
                    );

                }

            });

        });

    });



    // ==============================
    // input type=date용 날짜 변환
    // ==============================

    function formatDateForInput(dateValue) {

        if (!dateValue) {
            return "";
        }


        // 이미 yyyy-MM-dd 형식이면 그대로 사용
        if (
            typeof dateValue === "string" &&
            /^\d{4}-\d{2}-\d{2}$/.test(dateValue)
        ) {

            return dateValue;

        }


        // yyyy-MM-ddTHH:mm:ss 형태
        if (
            typeof dateValue === "string" &&
            /^\d{4}-\d{2}-\d{2}T/.test(dateValue)
        ) {

            return dateValue.substring(0, 10);

        }


        const date =
            new Date(dateValue);


        if (isNaN(date.getTime())) {

            console.log(
                "날짜 변환 실패:",
                dateValue
            );

            return "";

        }


        const year =
            date.getFullYear();


        const month =
            String(
                date.getMonth() + 1
            ).padStart(
                2,
                "0"
            );


        const day =
            String(
                date.getDate()
            ).padStart(
                2,
                "0"
            );


        return (
            year +
            "-" +
            month +
            "-" +
            day
        );

    }

</script>

</body>

</html>
