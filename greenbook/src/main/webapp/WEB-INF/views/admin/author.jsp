<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Author</title>

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

    <h1>Author</h1>


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

        등록

    </button>

</form>


<script>

    $(document).ready(function () {

        $("#authorForm").submit(function (e) {

            // form 기본 submit 방지
            e.preventDefault();


            const formData = {

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
                "등록 요청 데이터:",
                formData
            );


            $.ajax({

                url:
                    "<%=request.getContextPath()%>/api/author",

                type:
                    "POST",

                data:
                    formData,


                success: function (data) {

                    console.log(
                        "등록 결과:",
                        data
                    );


                    if (data === true) {

                        alert(
                            "저자가 등록되었습니다."
                        );

                        // 등록 성공 후 저자 목록으로 이동
                        location.href =
                            "<%=request.getContextPath()%>/authorlist";

                    } else {

                        alert(
                            "저자 등록에 실패했습니다."
                        );

                    }

                },


                error: function (xhr) {

                    console.log(
                        "저자 등록 실패"
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
                        "저자 등록에 실패했습니다."
                    );

                }

            });

        });

    });

</script>


</body>
</html>