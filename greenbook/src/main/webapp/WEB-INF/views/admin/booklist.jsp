<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible"
          content="IE=edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Booklist</title>


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

            <li class="domestic">
                국내도서
            </li>

            <li class="foreign">
                외국도서
            </li>

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


<!-- 상단 메뉴 -->
<div class="menu">

    <ul>

        <c:if test="${user == null}">

            <li>
                <a href="<%=request.getContextPath()%>/login">
                    LOGIN
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/signup">
                    SIGNUP
                </a>
            </li>

        </c:if>


        <c:if test="${user != null}">

            <li>
                <a href="<%=request.getContextPath()%>/logout">
                    LOGOUT
                </a>
            </li>

        </c:if>


        <c:if test="${user.me_grade != 'ADMIN'}">

            <li>
                <a href="<%=request.getContextPath()%>/mypage">
                    MYPAGE
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/cart">
                    CART
                </a>
            </li>

        </c:if>


        <c:if test="${user.me_grade == 'ADMIN'}">

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
            <a href="<%=request.getContextPath()%>/booklist"
               class="current">
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
            <a href="<%=request.getContextPath()%>/registrationlist">
                판매가능서적
            </a>
        </li>

    </ul>


    <!-- 검색 -->
    <div class="search">

        <form id="searchForm"
              class="input-group float-right mb-3">

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
                    저자
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


    <!-- 책 리스트 -->
    <table class="table table-bordered">

        <thead>

        <tr>

            <th>ISBN</th>

            <th>책제목</th>

            <th>작가</th>

            <th>출판사명</th>

        </tr>

        </thead>


        <!-- AJAX로 데이터 생성 -->
        <tbody id="bookList">

        </tbody>

    </table>


    <div class="regi-btn">

        <a href="<%=request.getContextPath()%>/book"
           class="btn btn-outline-secondary">
            도서등록
        </a>

    </div>


    <!-- AJAX 페이지네이션 -->
    <ul class="pagination justify-content-center"
        id="pagination">

    </ul>


</div>


<script>

    $(function () {

        // 처음 페이지 열었을 때
        getBookList(1);


        // 검색
        $('#searchForm').submit(function (e) {

            e.preventDefault();

            getBookList(1);

        });


        // 사이드 메뉴
        $('.fa-bars').click(function () {

            $('.side-bars').show();

        });


        $('.fa-times').click(function () {

            $('.side-bars').hide();

        });


        $('.domestic').hover(function () {

            $('.foreign-list').hide();

            $('.dome-list').show();

        });


        $('.foreign').hover(function () {

            $('.dome-list').hide();

            $('.foreign-list').show();

        });


        var prevScrollTop = 0;
        var nowScrollTop = 0;


        function wheelDelta() {

            return prevScrollTop - nowScrollTop > 0
                ? 'up'
                : 'down';

        }


        $(window).on('scroll', function () {

            nowScrollTop = $(this).scrollTop();

            if (wheelDelta() === 'down') {

                $('.bars').fadeOut();

            }

            prevScrollTop = nowScrollTop;

        });

    });



    // ==============================
    // 책 목록 API
    // ==============================

    function getBookList(page) {

        const type = $('#type').val();

        const search = $('#search').val();


        $.ajax({

            type: 'GET',

            url: '<%=request.getContextPath()%>/api/booklist',

            data: {

                page: page,

                type: type,

                search: search

            },

            dataType: 'json',


            success: function (res) {

                console.log('책 목록 API 응답:', res);

                drawBookList(res.list);

                drawPagination(res.pm);

            },


            error: function (xhr, status, error) {

                console.log('책 목록 조회 실패:', error);

                console.log(xhr.responseText);

                alert('책 목록을 불러오는데 실패했습니다.');

            }

        });

    }



    // ==============================
    // 책 목록 출력
    // ==============================

    function drawBookList(list) {

        const $bookList = $('#bookList');

        $bookList.empty();


        if (!list || list.length === 0) {

            $bookList.append(

                '<tr>' +

                    '<td colspan="4" class="text-center">' +

                        '등록된 도서가 없습니다.' +

                    '</td>' +

                '</tr>'

            );

            return;

        }


        list.forEach(function (book) {

            const url =
                '<%=request.getContextPath()%>/bookdetails'
                + '?bk_isbn='
                + encodeURIComponent(book.bk_isbn);


            const html =

                '<tr>' +

                    '<td>'
                        + escapeHtml(book.bk_isbn)
                    + '</td>' +

                    '<td>' +

                        '<a href="' + url + '">' +

                            escapeHtml(book.bk_title) +

                        '</a>' +

                    '</td>' +

                    '<td>'
                        + escapeHtml(book.bk_au_writer)
                    + '</td>' +

                    '<td>'
                        + escapeHtml(book.bk_publish)
                    + '</td>' +

                '</tr>';


            $bookList.append(html);

        });

    }



    // ==============================
    // 페이지네이션
    // ==============================

    function drawPagination(pm) {

        const $pagination = $('#pagination');

        $pagination.empty();


        if (!pm) {

            return;

        }


        /*
         * PageMaker에서
         *
         * getCriteria()
         *
         * getter를 가지고 있으면 JSON은
         *
         * pm.criteria
         *
         * 로 내려온다.
         */

        const currentPage = pm.criteria
            ? pm.criteria.page
            : 1;


        // 이전
        if (pm.prev) {

            $pagination.append(

                '<li class="page-item">' +

                    '<a class="page-link" href="#" ' +

                       'onclick="getBookList('
                            + (pm.startPage - 1)
                            + '); return false;">' +

                        '이전' +

                    '</a>' +

                '</li>'

            );

        }


        // 페이지 번호
        for (let i = pm.startPage; i <= pm.endPage; i++) {

            let active = '';

            if (currentPage === i) {

                active = ' active';

            }


            $pagination.append(

                '<li class="page-item'
                    + active
                    + '">' +

                    '<a class="page-link" href="#" ' +

                       'onclick="getBookList('
                            + i
                            + '); return false;">' +

                        i +

                    '</a>' +

                '</li>'

            );

        }


        // 다음
        if (pm.next) {

            $pagination.append(

                '<li class="page-item">' +

                    '<a class="page-link" href="#" ' +

                       'onclick="getBookList('
                            + (pm.endPage + 1)
                            + '); return false;">' +

                        '다음' +

                    '</a>' +

                '</li>'

            );

        }

    }



    // ==============================
    // HTML 문자 처리
    // ==============================

    function escapeHtml(value) {

        if (value === null || value === undefined) {

            return '';

        }


        return $('<div>')
            .text(value)
            .html();

    }

</script>


</body>

</html>