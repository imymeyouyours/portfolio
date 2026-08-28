<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Greenpoint</title>

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
        }

        .table th {
            background-color: #f8f8f8;
        }

        .grade {
            text-align: right;
        }

        .fa-crown {
            font-size: 20px;
        }

        .fa-question-circle {
            margin-left: 5px;
        }

        .notice {
            color: grey;
            font-size: 15px;
            text-align: center;
        }

        .tooltip-text {
            width: 200px;
            height: 180px;
            border: 1px solid grey;
            position: absolute;
            right: 0;
            background: #f8f9fa;
            padding: 10px;
            z-index: 25;
            display: none;
        }

        .tooltip-text p {
            text-align: left;
            font-size: 12px;
        }

        .nav {
            margin-left: calc(50% - 440px / 2);
        }

        .nav::after {
            content: '';
            display: block;
            clear: both;
        }

        .nav li {
            width: 110px;
            border-right: 1px solid black;
            text-align: center;
            float: left;
            margin-top: 40px;
        }

        .nav li:last-child {
            border: none;
        }

        .nav a {
            color: black;
        }

        .current {
            font-weight: bold;
        }

        .tablePart {
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
            font-family: sans-serif;
            font-weight: bold;
            cursor: pointer;
        }

        /* 기존 mypage.jsp와 같은 글자 크기 */
        .menu ul li a {
            font-size: 18px;
            font-weight: bold;
            color: black;
            text-decoration: none;
        }

        .menu ul li a:hover {
            color: rgb(0, 104, 136);
            text-decoration: none;
        }


        /* =========================
           사이드 메뉴
           ========================= */

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
        }

        .fa-bars {
            font-size: 35px;
            position: absolute;
            top: 20px;
            left: 15px;
            cursor: pointer;
        }

        .fa-times {
            color: white;
            font-size: 30px;
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
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

        </ul>

    </div>


    <div class="subCatagory-list">

        <ul class="foreign-list">

            <li>
                <a href="<%=request.getContextPath()%>/catagory?re_catagory=문학&country=외국">
                    문학
                </a>
            </li>

        </ul>

    </div>

</div>


<!-- 햄버거 메뉴 -->

<i class="fas fa-bars"></i>



<!-- =========================
     상단 메뉴
     ========================= -->

<div class="menu">

    <ul>

        <!-- LOGOUT 추가 -->
        <li><a href="#" onclick="logout(); return false;">LOGOUT</a></li>

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
            <a href="<%=request.getContextPath()%>/mypage">
                주문내역
            </a>
        </li>

        <li class="point">
            <a href="<%=request.getContextPath()%>/greenpoint"
               class="current">
                그린포인트
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/memberinfo">
                회원정보
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/memberout">
                회원탈퇴
            </a>
        </li>

    </ul>



    <!-- =========================
         포인트 정보
         ========================= -->

    <div class="tablePart">

        <div class="grade">

            <i class="fas fa-crown">
                <span id="memberGrade"></span>
            </i>

            <i class="fas fa-question-circle"></i>


            <div class="tooltip-text">
                <p>년간 포인트 누적액</p>
                <p>NORMAL: 25000포인트 미만</p>
                <p>SILVER: 25000포인트 이상</p>
                <p>GOLD: 50000포인트 이상</p>
                <p>GREEN: 80000포인트 이상</p>
            </div>

        </div>



        <table class="table">

            <thead>

                <tr>
                    <td colspan="4"
                        class="userPoint">

                        현재 나의 그린 포인트는?

                        <h3 id="memberPoint">
                            0
                        </h3>

                    </td>
                </tr>


                <tr>
                    <th>일자</th>
                    <th>내용</th>
                    <th>주문번호</th>
                    <th>그린포인트</th>
                </tr>

            </thead>


            <tbody id="pointList">

            </tbody>

        </table>

    </div>



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

        loadGreenPoint();



        /* =========================
           그린포인트 조회
           ========================= */

        function loadGreenPoint() {

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
                    '/api/greenpoint',

                type:
                    'GET',

                data: {
                    page: page
                },


                success:
                    function(result) {

                        console.log(
                            "greenpoint result =",
                            result
                        );

                        renderMember(
                            result.member
                        );

                        renderPointList(
                            result.pointList
                        );

                        renderPagination(
                            result.pm
                        );

                    },


                error:
                    function(error) {

                        console.error(
                            error
                        );


                        if (
                            error.status === 401
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
                            '그린포인트 정보를 불러오지 못했습니다.'
                        );

                    }

            });

        }



        /* =========================
           회원 정보 출력
           ========================= */

        function renderMember(member) {

            if (!member) {
                return;
            }


            $('#memberGrade')
                .text(
                    member.me_grade || ''
                );


            $('#memberPoint')
                .text(
                    member.me_point || 0
                );

        }



        /* =========================
           포인트 목록
           ========================= */

        function renderPointList(pointList) {

            const tbody =
                $('#pointList');

            tbody.empty();


            if (
                !pointList ||
                pointList.length === 0
            ) {

                tbody.html(
                    '<tr>' +
                        '<td colspan="4" class="notice">' +
                            '그린포인트 적립 내역이 없습니다.' +
                        '</td>' +
                    '</tr>'
                );

                return;
            }


            pointList.forEach(
                function(point) {


                    if (
                        Number(point.po_point) === 0
                    ) {
                        return;
                    }


                    const row =

                        '<tr class="point-box">' +

                            '<td>' +
                                (point.poDate || '') +
                            '</td>' +

                            '<td>' +
                                (point.po_contents || '') +
                            '</td>' +

                            '<td>' +
                                (point.po_or_num || '') +
                            '</td>' +

                            '<td>' +
                                (point.po_point || 0) +
                            '</td>' +

                        '</tr>';


                    tbody.append(
                        row
                    );

                }
            );

        }



        /* =========================
           페이지네이션 출력
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
                    ? pm.criteria.page
                    : 1;



            if (pm.prev) {

                pagination.append(

                    '<li class="page-item">' +

                        '<a class="page-link" ' +
                           'href="#" ' +
                           'data-page="' +
                           (pm.startPage - 1) +
                           '">' +

                            '이전' +

                        '</a>' +

                    '</li>'

                );

            }



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



            if (pm.next) {

                pagination.append(

                    '<li class="page-item">' +

                        '<a class="page-link" ' +
                           'href="#" ' +
                           'data-page="' +
                           (pm.endPage + 1) +
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
                    $(this).data('page');

                location.href =
                    contextPath +
                    '/greenpoint?page=' +
                    page;

            }
        );



        /* =========================
           사이드바
           ========================= */

        $('.fa-bars').click(function() {

            $('.side-bars').show();

        });


        $('.fa-times').click(function() {

            $('.side-bars').hide();

        });



        $('.domestic').hover(function() {

            $('.foreign-list').hide();

            $('.dome-list').show();

        });


        $('.foreign').hover(function() {

            $('.dome-list').hide();

            $('.foreign-list').show();

        });



        /* =========================
           등급 설명
           ========================= */

        $('.fa-question-circle')
            .hover(function() {

                $('.tooltip-text').show();

            });


        $('.tooltip-text')
            .mouseleave(function() {

                $(this).hide();

            });

    });

    function logout() {
        $.ajax({
            url: '/greenbook/api/logout',
            type: 'GET',
            success: function () {
                alert('로그아웃되었습니다.');
                location.href = '/greenbook';
            },
            error: function (xhr, status, error) {
                console.log('AJAX 실패:', error);
            }
        });
    }


</script>

</body>
</html>