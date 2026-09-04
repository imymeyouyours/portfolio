<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Book</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

<form class="container" id="bookForm" enctype="multipart/form-data">

    <h1>Book</h1>

    <div class="form-group">
        <label>ISBN</label>
        <input type="text"
               class="form-control"
               name="bk_isbn">
    </div>

    <div class="form-group">
        <label>도서명</label>
        <input type="text"
               class="form-control"
               name="bk_title">
    </div>

    <div class="form-group">
        <label>부도서명</label>
        <input type="text"
               class="form-control"
               name="bk_subtitle">
    </div>

    <div class="form-group">
        <label>국가분류</label>
        <input type="text"
               class="form-control"
               name="bk_country">
    </div>

    <div class="form-group">
        <label>저자</label>
        <input type="text"
               class="form-control"
               name="bk_au_writer">
    </div>

    <div class="form-group">
        <label>출판사명</label>
        <input type="text"
               class="form-control"
               name="bk_publish">
    </div>

    <div class="form-group">
        <label>쪽수</label>
        <input type="text"
               class="form-control"
               name="bk_page">
    </div>

    <div class="form-group">
        <label>출간일</label>
        <input type="date"
               class="form-control"
               name="bk_publish_date">
    </div>

    <div class="form-group">
        <label>메인이미지</label>

        <input type="file"
               class="form-control"
               name="file"
               id="image"
               accept="image/*"
               onchange="setThumbnail(event);">

        <div id="image_container"></div>
    </div>

    <div class="form-group">
        <label>출판사번호</label>
        <input type="text"
               class="form-control"
               name="bk_pu_num">
    </div>

    <button type="submit"
            class="btn btn-info col-12">
        등록
    </button>

</form>


<script type="text/javascript">

    // 이미지 미리보기
    function setThumbnail(event) {

        const file = event.target.files[0];

        if (!file) {
            return;
        }

        const reader = new FileReader();

        reader.onload = function (event) {

            const img = document.createElement("img");

            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");

            document.querySelector("#image_container").innerHTML = '';
            document.querySelector("#image_container").appendChild(img);
        };

        reader.readAsDataURL(file);
    }


    // 도서 등록 API
    $("#bookForm").submit(function (e) {

        e.preventDefault();

        const formData = new FormData(this);

        $.ajax({

            url: "<%=request.getContextPath()%>/api/book",

            type: "POST",

            data: formData,

            processData: false,

            contentType: false,

            success: function (data) {

                alert("도서가 등록되었습니다.");

                location.href =
                    "<%=request.getContextPath()%>/booklist";
            },

            error: function (xhr) {

                console.log("도서 등록 실패");
                console.log(xhr.responseText);

                if (xhr.responseJSON && xhr.responseJSON.message) {
                    alert(xhr.responseJSON.message);
                } else {
                    alert("도서 등록에 실패했습니다.");
                }
            }
        });
    });

</script>

</body>
</html>
