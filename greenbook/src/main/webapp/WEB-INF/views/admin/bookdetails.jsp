<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Book Details</title>

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
            color: #000;
            margin-bottom: 40px;
        }

        #currentImage,
        #previewImage {
            max-width: 250px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

    </style>

</head>

<body>

<form class="container"
      id="bookForm"
      enctype="multipart/form-data">

    <h1>Book Details</h1>

    <div class="form-group">

        <label>ISBN</label>

        <input type="text"
               class="form-control"
               id="bk_isbn"
               name="bk_isbn"
               readonly>

    </div>


    <div class="form-group">

        <label>도서명</label>

        <input type="text"
               class="form-control"
               id="bk_title"
               name="bk_title">

    </div>


    <div class="form-group">

        <label>부도서명</label>

        <input type="text"
               class="form-control"
               id="bk_subtitle"
               name="bk_subtitle">

    </div>


    <div class="form-group">

        <label>국가분류</label>

        <input type="text"
               class="form-control"
               id="bk_country"
               name="bk_country">

    </div>


    <div class="form-group">

        <label>저자</label>

        <input type="text"
               class="form-control"
               id="bk_au_writer"
               name="bk_au_writer">

    </div>


    <div class="form-group">

        <label>출판사명</label>

        <input type="text"
               class="form-control"
               id="bk_publish"
               name="bk_publish">

    </div>


    <div class="form-group">

        <label>쪽수</label>

        <input type="number"
               class="form-control"
               id="bk_page"
               name="bk_page">

    </div>


    <div class="form-group">

        <label>출간일</label>

        <input type="date"
               class="form-control"
               id="bk_publish_date"
               name="bk_publish_date">

    </div>


    <div class="form-group">

        <label>메인이미지</label>

        <div>
            <img id="currentImage"
                 style="display:none;">
        </div>

        <input type="file"
               class="form-control"
               id="image"
               name="file"
               accept="image/*">

        <div id="image_container"></div>

    </div>


    <div class="form-group">

        <label>출판사번호</label>

        <input type="text"
               class="form-control"
               id="bk_pu_num"
               name="bk_pu_num">

    </div>


    <button type="submit"
            class="btn btn-info col-12">

        수정

    </button>

</form>


<script>

    $(document).ready(function () {

        // 현재 URL에서 ISBN 가져오기
        const params =
            new URLSearchParams(window.location.search);

        const bk_isbn =
            params.get("bk_isbn");


        if (!bk_isbn) {

            alert("ISBN 정보가 없습니다.");

            location.href =
                "<%=request.getContextPath()%>/booklist";

            return;
        }


        // =========================
        // 도서 상세 조회
        // =========================

        $.ajax({

            url: "<%=request.getContextPath()%>/api/bookdetails",

            type: "GET",

            data: {
                bk_isbn: bk_isbn
            },

            success: function (book) {

                console.log("조회 성공");
                console.log(book);


                $("#bk_isbn").val(book.bk_isbn);

                $("#bk_title").val(book.bk_title);

                $("#bk_subtitle").val(book.bk_subtitle);

                $("#bk_country").val(book.bk_country);

                $("#bk_au_writer").val(book.bk_au_writer);

                $("#bk_publish").val(book.bk_publish);

                $("#bk_page").val(book.bk_page);

                $("#bk_pu_num").val(book.bk_pu_num);


                // 날짜
                if (book.bk_publish_date) {

                    console.log("출간일:", book.bk_publish_date);

                    const publishDate =
                        new Date(book.bk_publish_date);

                    const year =
                        publishDate.getFullYear();

                    const month =
                        String(publishDate.getMonth() + 1)
                            .padStart(2, "0");

                    const day =
                        String(publishDate.getDate())
                            .padStart(2, "0");

                    $("#bk_publish_date").val(
                        year + "-" + month + "-" + day
                    );
                }


                // 기존 이미지
                if (book.bk_mainImg) {

                    $("#currentImage")
                        .attr(
                            "src",
                            "<%=request.getContextPath()%>/img" + book.bk_mainImg
                        )
                        .show();

                }

            },

            error: function (xhr) {

                console.log("도서 상세 조회 실패");

                console.log(xhr.responseText);

                alert("도서 정보를 불러오지 못했습니다.");

            }

        });


        // =========================
        // 새로운 이미지 미리보기
        // =========================

        $("#image").change(function () {

            const file =
                this.files[0];


            if (!file) {
                return;
            }


            const reader =
                new FileReader();


            reader.onload = function (e) {

                $("#image_container").html(
                    '<img id="previewImage" src="' +
                    e.target.result +
                    '">'
                );

            };


            reader.readAsDataURL(file);

        });


        // =========================
        // 도서 수정
        // =========================

        $("#bookForm").submit(function (e) {

            e.preventDefault();


            const formData =
                new FormData(this);


            $.ajax({

                url: "<%=request.getContextPath()%>/api/bookdetails",

                type: "POST",

                data: formData,

                processData: false,

                contentType: false,

                success: function (data) {

                    console.log("수정 결과:", data);


                    if (data === true) {

                        alert("도서 정보가 수정되었습니다.");

                        location.href =
                            "<%=request.getContextPath()%>/booklist";

                    } else {

                        alert("도서 수정에 실패했습니다.");

                    }

                },

                error: function (xhr) {

                    console.log("도서 수정 실패");

                    console.log(xhr.status);

                    console.log(xhr.responseText);

                    alert("도서 수정에 실패했습니다.");

                }

            });

        });

    });

</script>

</body>

</html>