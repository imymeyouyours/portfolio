<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <title>Registrationlist</title>

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

        .table th {
            background-color: #f8f8f8;
        }

        .table {
            margin-top: 70px;
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

        .dome-list {
            display: none;
        }

        .dome-list *,
        .foreign-list * {
            color: white;
            font-size: 18px;
        }

        .foreign-list {
            display: none;
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


<!-- 사이드 메뉴 -->
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
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=소설/시&country=국내/해외">
                    소설/시
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=에세이&country=국내/해외">
                    에세이
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=인문&country=국내/해외">
                    인문
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=역사&country=국내/해외">
                    역사
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=예술&country=국내/해외">
                    예술
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=종교&country=국내/해외">
                    종교
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=사회&country=국내/해외">
                    사회
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=과학&country=국내/해외">
                    과학
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=자기계발&country=국내/해외">
                    자기계발
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=국어와외국어&country=국내/해외">
                    국어와외국어
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=IT/모바일&country=국내/해외">
                    IT/모바일
                </a>
            </li>

        </ul>

    </div>


    <div class="subCatagory-list">

        <ul class="foreign-list">

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=문학&country=외국">
                    문학
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=소설&country=외국">
                    소설
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=경제/경영&country=외국">
                    경제/경영
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=인문/사회&country=외국">
                    인문/사회
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=예술&country=외국">
                    예술
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=컴퓨터&country=외국">
                    컴퓨터
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/book/catagory?re_catagory=자연과학&country=외국">
                    자연과학
                </a>
            </li>

        </ul>

    </div>

</div>


<i class="fas fa-bars"></i>


<!-- 상단 메뉴 -->
<div class="menu">

    <ul>

        <c:if test="${user == null}">
            <li>
                <a href="<%=request.getContextPath()%>/member/login">
                    LOGIN
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/member/signup">
                    SIGNUP
                </a>
            </li>
        </c:if>


        <c:if test="${user != null}">
            <li>
                <a href="<%=request.getContextPath()%>/member/logout">
                    LOGOUT
                </a>
            </li>
        </c:if>


        <c:if test="${user.me_grade != 'ADMIN'}">

            <li>
                <a href="<%=request.getContextPath()%>/member/mypage">
                    MYPAGE
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/order/cart">
                    CART
                </a>
            </li>

        </c:if>


        <c:if test="${user.me_grade == 'ADMIN'}">

            <li>
                <a href="<%=request.getContextPath()%>/admin/user/publisherlist">
                    MANAGEMENT
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/admin/user/orders">
                    ORDERS
                </a>
            </li>

        </c:if>


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


    <!-- 관리 메뉴 -->
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
            <a href="<%=request.getContextPath()%>/authorlist">
                저자리스트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/bookslist">
                저서리스트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/registrationlist"
               class="current">
                판매가능서적
            </a>
        </li>

    </ul>



    <!-- 검색 -->
    <div class="search">

        <form class="input-group float-right mb-3"
              id="searchForm">

            <select class="form-control mr-2"
                    id="type"
                    name="type">

                <option value="0">
                    전체
                </option>

                <option value="1">
                    제목+내용
                </option>

                <option value="2">
                    카테고리
                </option>

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



    <!-- 판매 가능 서적 목록 -->
    <table class="table table-bordered">

        <thead>

        <tr>

            <th>등록코드</th>
            <th>책제목</th>
            <th>가격</th>
            <th>수량</th>

        </tr>

        </thead>


        <tbody id="registrationList">

        </tbody>

    </table>



    <div class="regi-btn">

        <a href="<%=request.getContextPath()%>/registration"
           class="btn btn-outline-secondary">

            판매가능도서등록

        </a>

    </div>



    <!-- 페이지네이션 -->
    <ul class="pagination justify-content-center"
        id="pagination">

    </ul>


</div>



<script>

$(function () {


    // =============================================
    // 현재 검색 조건
    // =============================================

    let currentType = 0;
    let currentSearch = "";


    // =============================================
    // 목록 조회
    // =============================================

    function loadRegistrationList(page) {


        $.ajax({

            url:
                "<%=request.getContextPath()%>/api/registrationlist",

            type:
                "GET",

            data: {

                page: page,

                type: currentType,

                search: currentSearch

            },


            success: function (data) {

                console.log(
                    "판매가능서적 조회 성공:",
                    data
                );


                // 목록 출력
                renderRegistration(
                    data.regi
                );


                // 페이지네이션 출력
                renderPagination(
                    data.pm
                );

            },


            error: function (xhr) {

                console.log(
                    "판매가능서적 조회 실패"
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
                    "판매가능서적 목록을 불러오지 못했습니다."
                );

            }

        });

    }



    // =============================================
    // 테이블 출력
    // =============================================

    function renderRegistration(regi) {


        const tbody =
            $("#registrationList");


        tbody.empty();


        if (!regi || regi.length === 0) {

            tbody.append(
                $("<tr>").append(
                    $("<td>", {
                        colspan: 4,
                        class: "text-center",
                        text: "등록된 판매가능서적이 없습니다."
                    })
                )
            );

            return;
        }


        $.each(
            regi,
            function (index, registration) {


                const row =
                    $("<tr>");


                row.append(
                    $("<td>").text(
                        registration.re_code
                    )
                );


                const titleLink =
                    $("<a>")
                        .attr(
                            "href",
                            "<%=request.getContextPath()%>/registrationdetails?re_code="
                            + encodeURIComponent(registration.re_code)
                        )
                        .text(
                            registration.re_title || ""
                        );


                row.append(
                    $("<td>").append(titleLink)
                );


                row.append(
                    $("<td>").text(
                        registration.re_price
                    )
                );


                row.append(
                    $("<td>").text(
                        registration.re_amount
                    )
                );


                tbody.append(row);

            }
        );

    }



    // =============================================
    // 페이지네이션
    // =============================================

    function renderPagination(pm) {


        const pagination =
            $("#pagination");


        pagination.empty();


        if (!pm) {
            return;
        }


        // 이전
        if (pm.prev) {


            const prev =
                $("<a>", {
                    class: "page-link",
                    href: "#",
                    text: "이전"
                });


            prev.click(function (e) {

                e.preventDefault();

                loadRegistrationList(
                    pm.startPage - 1
                );

            });


            pagination.append(
                $("<li>", {
                    class: "page-item"
                }).append(prev)
            );

        }



        // 페이지 번호
        for (
            let i = pm.startPage;
            i <= pm.endPage;
            i++
        ) {


            const pageLink =
                $("<a>", {
                    class: "page-link",
                    href: "#",
                    text: i
                });


            pageLink.click(
                (function (pageNumber) {

                    return function (e) {

                        e.preventDefault();

                        loadRegistrationList(
                            pageNumber
                        );

                    };

                })(i)
            );


            const pageItem =
                $("<li>", {
                    class:
                        "page-item"
                        + (
                            pm.criteria &&
                            pm.criteria.page === i
                                ? " active"
                                : ""
                        )
                });


            pageItem.append(
                pageLink
            );


            pagination.append(
                pageItem
            );

        }



        // 다음
        if (pm.next) {


            const next =
                $("<a>", {
                    class: "page-link",
                    href: "#",
                    text: "다음"
                });


            next.click(function (e) {

                e.preventDefault();

                loadRegistrationList(
                    pm.endPage + 1
                );

            });


            pagination.append(
                $("<li>", {
                    class: "page-item"
                }).append(next)
            );

        }

    }



    // =============================================
    // 검색
    // =============================================

    $("#searchForm").submit(function (e) {


        e.preventDefault();


        currentType =
            $("#type").val();


        currentSearch =
            $("#search").val();


        console.log(
            "검색 type:",
            currentType
        );


        console.log(
            "검색어:",
            currentSearch
        );


        // 검색하면 1페이지부터
        loadRegistrationList(1);

    });



    // =============================================
    // 사이드 메뉴
    // =============================================

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


    $(window).on(
        "scroll",
        function () {

            nowScrollTop =
                $(this).scrollTop();


            if (
                wheelDelta() === "down"
            ) {

                $(".bars").fadeOut();

            }


            prevScrollTop =
                nowScrollTop;

        }
    );



    // =============================================
    // 처음 페이지 열렸을 때
    // =============================================

    loadRegistrationList(1);


});

</script>


</body>

</html>
