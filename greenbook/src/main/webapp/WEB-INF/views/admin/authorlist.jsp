<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Authorlist</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://kit.fontawesome.com/be5943d19e.js"
            crossorigin="anonymous"></script>

    <style>

        * {
            margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;
            color: black;
        }

        body {
            background-image:
                    url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);
        }

        a {
            color: black;
        }

        a:hover {
            color: rgb(0, 104, 136);
        }

        .container {
            width: 70%;
            margin: 120px auto;
            position: relative;
            overflow: hidden;
        }

        .management {
            font-size: 40px;
            text-align: center;
            font-weight: bold;
            font-style: italic;
            letter-spacing: 0;
            color: #000;
        }

        .table {
            margin-top: 70px;
        }

        .table th {
            background-color: #f8f8f8;
        }

        .nav {
            width: 750px;
            margin: 0 auto;
        }

        .nav li {
            width: 150px;
            border-right: 1px solid black;
            text-align: center;
            float: left;
            margin-top: 40px;
        }

        .nav li:last-child {
            border: none;
        }

        .nav::after {
            content: '';
            display: block;
            clear: both;
        }

        .menu {
            display: flex;
            position: absolute;
            top: 15px;
            right: 30px;
            z-index: 12;
        }

        .menu ul li {
            float: left;
            padding: 10px;
            font-size: 20px;
            font-family: sans-serif;
            font-weight: bold;
            cursor: pointer;
        }

        .menu ul li a {
            font-size: 18px;
            font-weight: bold;
        }

        .menu ul::after {
            content: '';
            clear: both;
            display: block;
        }

        .menu a {
            color: black;
        }

        a:hover,
        .menu a:hover {
            color: rgb(0, 104, 136);
        }

        .fa-bars {
            font-size: 35px;
            position: absolute;
            top: 20px;
            left: 15px;
            cursor: pointer;
        }

        .side-bars {
            width: 400px;
            height: 1280px;
            background-color: black;
            position: absolute;
            z-index: 10;
            opacity: 80%;
            display: none;
            top: 0;
        }

        .side-bars li {
            color: white;
            margin-bottom: 20px;
            margin-left: 20px;
            cursor: pointer;
            font-size: 18px;
        }

        .catagory-list {
            position: absolute;
            top: 150px;
            left: 20px;
        }

        .subCatagory-list {
            position: absolute;
            top: 150px;
            left: 200px;
        }

        .dome-list,
        .foreign-list {
            display: none;
        }

        .dome-list *,
        .foreign-list * {
            color: white;
            font-size: 18px;
        }

        .fa-times {
            color: white;
            font-size: 30px;
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .current {
            font-weight: bold;
        }

        .search {
            margin: 70px;
        }

        .regi-btn {
            text-align: right;
        }

    </style>

</head>

<body>

<div class="side-bars bars">

    <i class="fas fa-times"></i>

    <div class="catagory-list">
        <ul>
            <li class="domestic">국내도서</li>
            <li class="foreign">외국도서</li>
        </ul>
    </div>

    <div class="subCatagory-list">

        <ul class="dome-list">

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=소설/시&country=국내/해외">
                    소설/시
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=에세이&country=국내/해외">
                    에세이
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=인문&country=국내/해외">
                    인문
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=역사&country=국내/해외">
                    역사
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=예술&country=국내/해외">
                    예술
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=종교&country=국내/해외">
                    종교
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=사회&country=국내/해외">
                    사회
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=과학&country=국내/해외">
                    과학
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=자기계발&country=국내/해외">
                    자기계발
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=국어와외국어&country=국내/해외">
                    국어와외국어
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=IT/모바일&country=국내/해외">
                    IT/모바일
                </a>
            </li>

        </ul>

    </div>

    <div class="subCatagory-list">

        <ul class="foreign-list">

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=문학&country=외국">
                    문학
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=소설&country=외국">
                    소설
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=경제/경영&country=외국">
                    경제/경영
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=인문/사회&country=외국">
                    인문/사회
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=예술&country=외국">
                    예술
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=컴퓨터&country=외국">
                    컴퓨터
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=자연과학&country=외국">
                    자연과학
                </a>
            </li>

        </ul>

    </div>

</div>


<i class="fas fa-bars"></i>


<div class="menu">

    <ul>

        <li>
            <a href="<%=request.getContextPath()%>/logout">
                LOGOUT
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/publisherlist">
                MANAGEMENT
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/orders">
                ORDERS
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/">
                HOME
            </a>
        </li>

    </ul>

</div>

<div class="container">

    <div class="management">
        Management
    </div>


    <ul class="nav">

        <li>
            <a href="<%=request.getContextPath()%>/publisherlist">
                출판사리스트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/booklist">
                책리스트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/authorlist"
               class="current">
                저자리스트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/bookslist">
                저서리스트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/registrationlist">
                판매가능서적
            </a>
        </li>

    </ul>


    <div class="search">

        <form class="input-group float-right mb-3"
              id="searchForm">

            <select class="form-control mr-2"
                    id="type"
                    name="type">

                <option value="0">전체</option>
                <option value="1">제목+내용</option>
                <option value="2">저자</option>

            </select>

            <input type="text"
                   class="form-control mr-2"
                   id="search"
                   name="search">

            <button type="submit"
                    class="btn btn-outline-secondary">
                검색
            </button>

        </form>

    </div>


    <table class="table table-bordered">

        <thead>
        <tr>
            <th>작가번호</th>
            <th>저자</th>
            <th>대표작</th>
            <th>생년월일</th>
        </tr>
        </thead>

        <tbody id="authorList">
        </tbody>

    </table>


    <div class="regi-btn">

        <a href="<%=request.getContextPath()%>/author"
           class="btn btn-outline-secondary">
            저자등록
        </a>

    </div>


    <ul class="pagination justify-content-center"
        id="pagination">
    </ul>

</div>


<script>

    $(document).ready(function () {

        const params =
            new URLSearchParams(window.location.search);

        let page =
            params.get("page") || 1;

        let type =
            params.get("type") || 0;

        let search =
            params.get("search") || "";

        $("#type").val(type);
        $("#search").val(search);

        getAuthorList(page, type, search);


        $("#searchForm").submit(function (e) {

            e.preventDefault();

            const type =
                $("#type").val();

            const search =
                $("#search").val();

            getAuthorList(1, type, search);

        });


        $(".fa-bars").click(function () {

            $(".side-bars").show();

        });


        $(".fa-times").click(function () {

            $(".side-bars").hide();

        });


        $(".domestic").hover(function () {

            $(".foreign-list").hide();

            $(".dome-list").show();

        });


        $(".foreign").hover(function () {

            $(".dome-list").hide();

            $(".foreign-list").show();

        });


        let prevScrollTop = 0;
        let nowScrollTop = 0;


        function wheelDelta() {

            return prevScrollTop - nowScrollTop > 0
                ? "up"
                : "down";

        }


        $(window).on("scroll", function () {

            nowScrollTop =
                $(this).scrollTop();

            if (wheelDelta() === "down") {

                $(".bars").fadeOut();

            }

            prevScrollTop =
                nowScrollTop;

        });

    });



    function getAuthorList(page, type, search) {

        $.ajax({

            url:
                "<%=request.getContextPath()%>/api/authorlist",

            type:
                "GET",

            data: {
                page: page,
                type: type,
                search: search
            },

            success: function (data) {

                console.log(
                    "authorlist 응답:",
                    data
                );

                drawAuthorList(
                    data.author
                );

                drawPagination(
                    data.pm
                );

            },

            error: function (xhr) {

                console.log(
                    "저자 목록 조회 실패"
                );

                console.log(
                    xhr.status
                );

                console.log(
                    xhr.responseText
                );

                alert(
                    "저자 목록을 불러오지 못했습니다."
                );

            }

        });

    }



    function drawAuthorList(authorList) {

        const tbody =
            $("#authorList");

        tbody.empty();


        if (!authorList ||
            authorList.length === 0) {

            tbody.append(
                "<tr>" +
                    "<td colspan='4' class='text-center'>" +
                        "등록된 저자가 없습니다." +
                    "</td>" +
                "</tr>"
            );

            return;
        }


        authorList.forEach(function (author) {

            const auNum =
                author.au_num != null
                    ? author.au_num
                    : "";

            const auWriter =
                author.au_writer != null
                    ? author.au_writer
                    : "";

            const auTitle =
                author.au_title != null
                    ? author.au_title
                    : "";

            const auBirth =
                formatDate(author.au_birth);


            const row =
                "<tr>" +

                    "<td>" +
                        auNum +
                    "</td>" +

                    "<td>" +
                        "<a href='<%=request.getContextPath()%>/authordetails?au_num=" +
                        auNum +
                        "'>" +
                            auWriter +
                        "</a>" +
                    "</td>" +

                    "<td>" +
                        auTitle +
                    "</td>" +

                    "<td>" +
                        auBirth +
                    "</td>" +

                "</tr>";


            tbody.append(row);

        });

    }



    function drawPagination(pm) {

        const pagination =
            $("#pagination");

        pagination.empty();


        if (!pm) {
            return;
        }


        const criteria =
            pm.criteria || {};

        const currentPage =
            Number(criteria.page || 1);

        const type =
            criteria.type != null
                ? criteria.type
                : 0;

        const search =
            criteria.search != null
                ? criteria.search
                : "";


        if (pm.prev) {

            pagination.append(

                "<li class='page-item'>" +

                    "<a href='#' " +
                       "class='page-link page-btn' " +
                       "data-page='" +
                       (pm.startPage - 1) +
                       "'>" +

                        "이전" +

                    "</a>" +

                "</li>"

            );

        }


        for (
            let i = pm.startPage;
            i <= pm.endPage;
            i++
        ) {

            let active =
                currentPage === i
                    ? "active"
                    : "";


            pagination.append(

                "<li class='page-item " +
                active +
                "'>" +

                    "<a href='#' " +
                       "class='page-link page-btn' " +
                       "data-page='" +
                       i +
                       "'>" +

                        i +

                    "</a>" +

                "</li>"

            );

        }


        if (pm.next) {

            pagination.append(

                "<li class='page-item'>" +

                    "<a href='#' " +
                       "class='page-link page-btn' " +
                       "data-page='" +
                       (pm.endPage + 1) +
                       "'>" +

                        "다음" +

                    "</a>" +

                "</li>"

            );

        }


        $(".page-btn").off("click").on(
            "click",
            function (e) {

                e.preventDefault();

                const page =
                    $(this).data("page");

                getAuthorList(
                    page,
                    type,
                    search
                );


                const url =
                    "<%=request.getContextPath()%>/authorlist" +
                    "?page=" +
                    page +
                    "&type=" +
                    type +
                    "&search=" +
                    encodeURIComponent(search);


                history.pushState(
                    null,
                    "",
                    url
                );

            }
        );

    }



    function formatDate(date) {

        if (!date) {
            return "";
        }


        if (
            typeof date === "string" &&
            date.length >= 10 &&
            date.indexOf("-") !== -1
        ) {

            return date.substring(0, 10);

        }


        const d =
            new Date(date);


        if (isNaN(d.getTime())) {
            return date;
        }


        const year =
            d.getFullYear();


        const month =
            String(
                d.getMonth() + 1
            ).padStart(
                2,
                "0"
            );


        const day =
            String(
                d.getDate()
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
