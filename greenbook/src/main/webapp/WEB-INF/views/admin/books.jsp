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

    <title>Books</title>

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


<form class="container"
      id="booksForm">

    <h1>Books</h1>


    <div class="form-group">

        <label>ISBN</label>

        <input type="text"
               class="form-control"
               id="bs_bk_isbn"
               name="bs_bk_isbn">

    </div>


    <div class="form-group">

        <label>역할</label>

        <input type="text"
               class="form-control"
               id="bs_part"
               name="bs_part">

    </div>


    <div class="form-group">

        <label>이름</label>

        <input type="text"
               class="form-control"
               id="bs_name"
               name="bs_name">

    </div>


    <div class="form-group">

        <label>작가번호</label>

        <input type="text"
               class="form-control"
               id="bs_au_num"
               name="bs_au_num">

    </div>


    <button type="submit"
            class="btn btn-info col-12">

        등록

    </button>

</form>


<script>

    $(document).ready(function () {


        $("#booksForm").submit(function (e) {

            e.preventDefault();


            const formData = {

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
                "저서 등록 요청:",
                formData
            );


            $.ajax({

                url:
                    "<%=request.getContextPath()%>/api/books",

                type:
                    "POST",

                data:
                    formData,


                success: function (data) {

                    console.log(
                        "저서 등록 결과:",
                        data
                    );


                    if (data === true) {

                        alert(
                            "저서가 등록되었습니다."
                        );


                        location.href =
                            "<%=request.getContextPath()%>/bookslist";

                    } else {

                        alert(
                            "저서 등록에 실패했습니다."
                        );

                    }

                },


                error: function (xhr) {

                    console.log(
                        "저서 등록 실패"
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
                        "저서 등록에 실패했습니다."
                    );

                }

            });

        });

    });

</script>


</body>

</html>
