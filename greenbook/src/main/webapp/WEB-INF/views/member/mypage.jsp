<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible"
          content="IE=edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Mypage</title>

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

        .mypage {
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

        .nav {
            margin-left:
                calc(50% - 440px / 2);
        }

        .nav::after {
            content: '';
            display: block;
            clear: both;
        }

        .nav li {
            width: 110px;
            border-right:
                1px solid black;
            text-align: center;
            float: left;
            margin-top: 40px;
        }

        .nav li:last-child {
            border: none;
        }

        .table {
            margin-top: 70px;
        }


        /* =========================
           상단 메뉴
           ========================= */

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
            color:
                rgb(0, 104, 136);
        }


        /* =========================
           사이드바
           ========================= */

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
            cursor: pointer;
        }

        .current {
            font-weight: bold;
        }

        .notice {
            color: grey;
            font-size: 15px;
            text-align: center;
        }

    </style>

</head>


<body>


<!-- =========================
     사이드바
     ========================= -->

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


    <!-- 국내도서 -->

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


    <!-- 외국도서 -->

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


<!-- 햄버거 -->

<i class="fas fa-bars"></i>



<!-- =========================
     상단 메뉴
     ========================= -->

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
                <a href="#"
                   onclick="logout(); return false;">
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



<!-- =========================
     본문
     ========================= -->

<div class="container">


    <div class="mypage">
        MyPage
    </div>


    <!-- 마이페이지 메뉴 -->

    <ul class="nav">

        <li>

            <a href="<%=request.getContextPath()%>/mypage"
               class="current">

                주문내역

            </a>

        </li>


        <li class="point">

            <a href="<%=request.getContextPath()%>/greenpoint">

                그린포인트

            </a>

        </li>


        <li class="info">

            <a href="<%=request.getContextPath()%>/memberinfo">

                회원정보

            </a>

        </li>


        <li class="out">

            <a href="<%=request.getContextPath()%>/memberout">

                회원탈퇴

            </a>

        </li>

    </ul>



    <!-- =========================
         주문 내역
         ========================= -->

    <table class="table table-bordered">

        <thead>

        <tr>

            <th class="orderDate">
                주문일자
            </th>

            <th>
                주문번호
            </th>

            <th>
                주문내역
            </th>

            <th class="orderState">
                주문상태
            </th>

        </tr>

        </thead>


        <!-- AJAX로 주문내역 출력 -->

        <tbody id="orderList">

        </tbody>

    </table>



    <!-- =========================
         페이지네이션
         ========================= -->

    <ul class="pagination justify-content-center"
        id="pagination">

    </ul>


</div>



<script>

    const contextPath =
        '<%=request.getContextPath()%>';


    $(function() {


        /* =========================
           주문내역 API 호출
           ========================= */

        loadMyPage();


        function loadMyPage() {

            const params =
                new URLSearchParams(
                    window.location.search
                );


            const page =
                Number(
                    params.get('page') || 1
                );


            $.ajax({

                url:
                    contextPath +
                    '/api/mypage',

                type:
                    'GET',

                data: {
                    page: page
                },


                success:
                    function(result) {

                        console.log(
                            'mypage result =',
                            result
                        );


                        renderOrderList(
                            result.orderList
                        );


                        renderPagination(
                            result.pm
                        );

                    },


                error:
                    function(xhr) {

                        console.error(
                            xhr
                        );


                        if (
                            xhr.status === 401
                        ) {

                            alert(
                                '로그인이 필요합니다.'
                            );


                            location.href =
                                contextPath +
                                '/login';

                            return;
                        }


                        alert(
                            '주문내역을 불러오지 못했습니다.'
                        );

                    }

            });

        }



        /* =========================
           주문내역 출력
           ========================= */

        function renderOrderList(
            orderList
        ) {

            const tbody =
                $('#orderList');


            tbody.empty();


            if (
                !orderList ||
                orderList.length === 0
            ) {

                tbody.html(

                    '<tr>' +

                        '<td colspan="4" ' +
                            'class="notice">' +

                            '주문 내역이 없습니다.' +

                        '</td>' +

                    '</tr>'

                );


                return;
            }



            orderList.forEach(
                function(order) {


                    let title =
                        order.or_title || '';


                    /*
                     * 기존 JSP:
                     *
                     * ${order.or_title}
                     *
                     * or_re_title > 1 이면
                     * 외 N권 표시
                     */

                    if (
                        Number(
                            order.or_re_title
                        ) > 1
                    ) {

                        title +=
                            ' 외 ' +
                            (
                                Number(
                                    order.or_re_title
                                ) - 1
                            ) +
                            ' 권';

                    }



                    const row =

                        '<tr>' +


                            '<td>' +

                                (
                                    order.orDate ||
                                    ''
                                ) +

                            '</td>' +


                            '<td>' +

                                '<a href="' +

                                    contextPath +

                                    '/mypagedetails' +

                                    '?or_num=' +

                                    order.or_num +

                                '">' +

                                    (
                                        order.or_num ||
                                        ''
                                    ) +

                                '</a>' +

                            '</td>' +


                            '<td>' +

                                title +

                            '</td>' +


                            '<td>' +

                                (
                                    order.or_state ||
                                    ''
                                ) +

                            '</td>' +


                        '</tr>';


                    tbody.append(
                        row
                    );

                }
            );

        }



        /* =========================
           페이지네이션
           ========================= */

        function renderPagination(pm) {


            const pagination =
                $('#pagination');


            pagination.empty();


            if (!pm) {
                return;
            }


            const currentPage =
                pm.criteria
                    ? Number(
                        pm.criteria.page
                    )
                    : 1;



            /* 이전 */

            if (pm.prev) {


                pagination.append(

                    '<li class="page-item">' +

                        '<a class="page-link" ' +

                            'href="#" ' +

                            'data-page="' +

                            (
                                pm.startPage - 1
                            ) +

                            '">' +

                            '이전' +

                        '</a>' +

                    '</li>'

                );

            }



            /* 페이지 번호 */

            for (
                let i = pm.startPage;
                i <= pm.endPage;
                i++
            ) {


                const active =

                    currentPage === i

                        ? 'active'

                        : '';


                pagination.append(

                    '<li class="page-item ' +
                        active +
                    '">' +

                        '<a class="page-link" ' +

                            'href="#" ' +

                            'data-page="' +

                            i +

                            '">' +

                            i +

                        '</a>' +

                    '</li>'

                );

            }



            /* 다음 */

            if (pm.next) {


                pagination.append(

                    '<li class="page-item">' +

                        '<a class="page-link" ' +

                            'href="#" ' +

                            'data-page="' +

                            (
                                pm.endPage + 1
                            ) +

                            '">' +

                            '다음' +

                        '</a>' +

                    '</li>'

                );

            }

        }



        /* =========================
           페이지 클릭
           ========================= */

        $(document).on(
            'click',
            '.page-link',
            function(e) {


                e.preventDefault();


                const page =
                    $(this).data(
                        'page'
                    );


                location.href =

                    contextPath +

                    '/mypage?page=' +

                    page;

            }
        );



        /* =========================
           사이드바
           ========================= */

        $('.fa-bars')
            .click(
                function() {

                    $('.side-bars')
                        .show();

                }
            );


        $('.fa-times')
            .click(
                function() {

                    $('.side-bars')
                        .hide();

                }
            );



        $('.domestic')
            .hover(
                function() {

                    $('.foreign-list')
                        .hide();

                    $('.dome-list')
                        .show();

                }
            );


        $('.foreign')
            .hover(
                function() {

                    $('.dome-list')
                        .hide();

                    $('.foreign-list')
                        .show();

                }
            );



        /* =========================
           스크롤
           ========================= */

        let prevScrollTop = 0;
        let nowScrollTop = 0;


        function wheelDelta() {

            return (
                prevScrollTop -
                nowScrollTop >
                0
            )
                ? 'up'
                : 'down';

        }


        $(window).on(
            'scroll',
            function() {


                nowScrollTop =
                    $(this)
                        .scrollTop();


                if (
                    wheelDelta() ===
                    'down'
                ) {

                    $('.bars')
                        .fadeOut();

                }


                prevScrollTop =
                    nowScrollTop;

            }
        );


    });



    /* =========================
       로그아웃
       ========================= */

    function logout() {


        $.ajax({

            url:
                contextPath +
                '/api/logout',

            type:
                'GET',


            success:
                function() {


                    alert(
                        '로그아웃되었습니다.'
                    );


                    location.href =
                        contextPath +
                        '/';

                },


            error:
                function(
                    xhr,
                    status,
                    error
                ) {


                    console.log(
                        'AJAX 실패:',
                        error
                    );

                }

        });

    }


</script>


</body>

</html>