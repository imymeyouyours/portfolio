<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Details</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <script src="https://kit.fontawesome.com/be5943d19e.js"
            crossorigin="anonymous"></script>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <style>

        * {
            margin: 0;
            padding: 0;
            color: black;
            text-decoration: none;
            list-style: none;
        }

        a {
            color: black;
            text-decoration: none;
        }

        .subCatagory-list a:hover,
        .menu a:hover {
            color: rgb(0, 104, 136);
            text-decoration: underline;
        }

        body {
            position: relative;
            background-image:
                url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);
            background-size: 400%;
        }

        .fa-bars {
            font-size: 35px;
            position: absolute;
            top: 20px;
            left: 15px;
            cursor: pointer;
        }

        .container {
            padding: 50px;
            padding-top: 150px;
            position: relative;
        }

        .book-top {
            display: flex;
            overflow: hidden;
            margin-left: 40px;
            width: 1000px;
        }

        .bookImg {
            width: 380px;
        }

        .bookImg img {
            width: 330px;
        }

        .title {
            width: 580px;
        }

        .height-line {
            width: 1px;
            min-height: 580px;
            background-color: gainsboro;
            margin-left: 50px;
        }

        .title h1 {
            margin-left: 50px;
        }

        .title p {
            color: gray;
            margin-top: 10px;
            margin-left: 50px;
            font-size: 18px;
        }

        .width-line {
            background-color: gainsboro;
            margin-top: 30px;
            height: 1px;
            width: 100%;
        }

        .title-bottom {
            margin: 50px;
        }

        .title-bottom * {
            padding: 10px;
        }

        .title-bottom h2 {
            display: inline;
        }

        .order-line {
            display: flex;
            margin-left: 50px;
            padding: 10px;
            margin-bottom: 35px;
            line-height: 30px;
        }

        .order-line * {
            margin-right: 15px;
        }

        .amount input[type="text"] {
            width: 47px;
            height: 30px;
            margin-right: -1px;
            text-align: center;
        }

        .amount {
            display: flex;
            margin-top: 4px;
        }

        .cart {
            margin-right: -10px;
        }

        .cart a,
        .buy a {
            margin: 0 auto;
        }

        .middle-line {
            min-width: 1040px;
            height: 2px;
            color: gainsboro;
        }

        .book-bottom {
            padding: 10px 30px;
        }

        .table-box {
            margin-top: 30px;
        }

        hr {
            margin-top: -0.7px;
        }

        .table-box th {
            background-color: #f8f8f8;
            text-align: center;
        }

        .catagory,
        .introduce {
            margin-top: 30px;
        }

        .writer {
            margin-top: 60px;
        }

        .introduce h4,
        .writer h4 {
            margin-bottom: 30px;
        }

        .catagory h6,
        .introduce h4,
        .writer h4 {
            font-weight: bold;
        }

        .catagory p {
            font-size: 14px;
        }

        .side-bars {
            width: 400px;
            height: 1280px;
            background-color: black;
            position: absolute;
            z-index: 10;
            opacity: 80%;
            display: none;
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

        .minus,
        .plus {
            width: 30px;
            height: 30px;
            line-height: 30px;
            background-color: #f8f8f8;
            border: 1px solid gray;
            margin-right: -1px;
        }

        .plus {
            margin-right: 15px;
        }

        .fas {
            text-align: center;
            margin-right: 0;
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
                <a href="<%=request.getContextPath()%>//catagory?re_catagory=과학&country=국내/해외">
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
                <a href="#" class="logout-btn">
                    LOGOUT
                </a>
            </li>

        </c:if>


        <c:if test="${user != null && user.me_grade != 'ADMIN'}">

            <li>
                <a href="<%=request.getContextPath()%>/mypage">
                    MYPAGE
                </a>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/order/cart">
                    CART
                </a>
            </li>

        </c:if>


        <c:if test="${user != null && user.me_grade == 'ADMIN'}">

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


<!-- 책 상세 -->

<div class="container">

    <div class="book-top">

        <div class="bookImg">

            <img id="bookImage"
                 src=""
                 alt="book-image">

        </div>


        <div class="height-line"></div>


        <div class="title">

            <h1 class="bookTitle"></h1>

            <p class="bookSubTitle"></p>


            <div class="width-line"></div>


            <div class="title-bottom">

                <div class="bookInfo"></div>


                <div>

                    판매가 |

                    <h2 class="bookPrice"></h2>원

                </div>


                <div>

                    그린 포인트 |

                    <span class="bookPoint"></span>원

                    (5% 적립)

                </div>


                <div>
                    배송일정 |
                    서울시특별구 종로구 세정대로 기준
                </div>


                <div>

                    배송비 |

                    <span class="deliveryPrice"></span>

                </div>


                <div>
                    (10,000원 이상 구매시 배송비 무료)
                </div>

            </div>


            <div class="order-line">

                <div class="amount">

                    수량 &nbsp;

                    <button type="button"
                            id="decreaseQuantity"
                            class="minus">

                        <i class="fas fa-minus"></i>

                    </button>


                    <input type="text"
                           value="1"
                           class="bookAmount"
                           readonly>


                    <button type="button"
                            id="increaseQuantity"
                            class="plus">

                        <i class="fas fa-plus"></i>

                    </button>

                </div>


                <a href="#">

                    <button type="button"
                            class="cart btn btn-info addCart-btn">

                        장바구니

                    </button>

                </a>


                <a href="#"
                   class="btn-buy">

                    <button type="button"
                            class="buy btn btn-secondary">

                        바로구매

                    </button>

                </a>

            </div>

        </div>

    </div>


    <hr>


    <div class="book-bottom">


        <div class="table-box">

            <table class="table table-bordered table-sm">

                <tbody>

                <tr>

                    <th class="col-3">
                        ISBN
                    </th>

                    <td class="bookIsbn"></td>

                </tr>


                <tr>

                    <th class="col-3">
                        쪽수
                    </th>

                    <td class="bookPage"></td>

                </tr>


                <tr>

                    <th class="col-3">
                        출간일
                    </th>

                    <td class="bookDate"></td>

                </tr>

                </tbody>

            </table>

        </div>


        <div class="book-contents">


            <div class="catagory">

                <h6>
                    카테고리 분류
                </h6>

                <p class="bookCatagory"></p>

            </div>


            <div class="introduce">

                <h4>
                    책소개
                </h4>

                <p class="bookContents"></p>

            </div>


            <div class="writer">

                <h4>
                    저자소개
                </h4>


                <div class="main">

                    <p class="authorName"></p>

                    <p class="authorContents"></p>

                </div>

            </div>

        </div>


        <input type="hidden"
               class="code">


        <input type="hidden"
               class="stockAmount">

    </div>

</div>


<script>

$(function() {

    var contextPath =
        '<%=request.getContextPath()%>';

    var user =
        '${user == null ? "" : user.me_id}';


    /* ========================================
       URL에서 ISBN 가져오기
       ======================================== */

    var params =
        new URLSearchParams(
            window.location.search
        );

    var isbn =
        params.get(
            're_bk_isbn'
        );


    if (!isbn) {

        alert(
            'ISBN 정보가 없습니다.'
        );

        return;
    }


    /* ========================================
       책 상세 API 호출
       ======================================== */

    $.ajax({

        url:
            contextPath +
            '/api/details',

        type:
            'GET',

        data: {
            re_bk_isbn: isbn
        },

        dataType:
            'json',


        success: function(data) {

            console.log(data);


            var book =
                data.book;

            var author =
                data.author;

            let regi = data.regi;

            if (!book) {

                alert(
                    '책 정보를 찾을 수 없습니다.'
                );

                return;
            }


            /* 이미지 */

            $('#bookImage').attr(
                'src',
                contextPath +
                '/img' +
                book.bk_mainImg
            );


            /* 제목 */

            $('.bookTitle').text(
                book.bk_title || ''
            );


            /* 부제 */

            $('.bookSubTitle').text(
                book.bk_subtitle || ''
            );


            /* 기본 정보 */

            $('.bookInfo').text(
                (book.bk_au_writer || '') +
                ' 저 | ' +
                (book.bk_publish || '') +
                ' | ' +
                (book.date || '')
            );


            /* 판매가 */

            $('.bookPrice').text(
                regi.re_price || 0
            );


            /* 그린포인트 */

            $('.bookPoint').text(
                book.re_price_point || 0
            );


            /* 배송비 */

            if (book.re_price >= 10000) {

                $('.deliveryPrice').text(
                    '무료'
                );

            } else {

                $('.deliveryPrice').text(
                    '2500원'
                );
            }


            /* ISBN */

            $('.bookIsbn').text(
                book.bk_isbn || ''
            );


            /* 페이지 수 */

            $('.bookPage').text(
                (book.bk_page || 0) +
                '쪽'
            );


            /* 출간일 */

            $('.bookDate').text(
                book.date || ''
            );


            /* 카테고리 */

            $('.bookCatagory').text(
                (book.bk_country || '') +
                ' > ' +
                (book.re_catagory || '')
            );


            /* 책 소개 */

            $('.bookContents').text(
                book.re_contents || ''
            );


            /* 장바구니에 필요한 코드 */

            $('.code').val(
                book.re_code || ''
            );


            /* 재고 */

            $('.stockAmount').val(
                book.re_amount || 0
            );


            /* 저자 */

            if (author) {

                $('.authorName').text(
                    '저자 | ' +
                    (author.au_writer || '')
                );


                $('.authorContents').text(
                    author.au_contents || ''
                );

            }

        },


        error: function(xhr) {

            console.error(
                xhr.responseText
            );


            alert(
                '책 정보를 불러오지 못했습니다.'
            );

        }

    });


    /* ========================================
       장바구니
       ======================================== */

    $('.addCart-btn').click(function(e) {

        e.preventDefault();


        if (user === '') {

            alert(
                '회원만 사용 가능합니다.'
            );

            return;
        }


        var amount =
            $('.bookAmount').val();

        var code =
            $('.code').val();


        var data = {

            ca_amount:
                amount,

            ca_re_code:
                code

        };


        $.ajax({

            url:
                contextPath +
                '/order/cart',

            type:
                'post',

            data:
                JSON.stringify(data),

            contentType:
                'application/json; charset=utf-8',


            success: function(result) {

                if (
                    result == '1' ||
                    result == 'CART_OK'
                ) {

                    alert(
                        '카트 담기 성공'
                    );
                }


                var isGo =
                    confirm(
                        '장바구니로 이동하겠습니까?'
                    );


                if (isGo) {

                    location.href =
                        contextPath +
                        '/order/cart';

                }

            },


            error: function(error) {

                console.error(error);

                alert(
                    '장바구니 등록 실패'
                );

            }

        });

    });


    /* ========================================
       수량 감소
       ======================================== */

    $('#decreaseQuantity').click(function(e) {

        e.preventDefault();


        var num =
            parseInt(
                $('.bookAmount').val()
            );


        num--;


        if (num < 1) {

            alert(
                '1개 이상 구매 가능합니다.'
            );

            return;
        }


        $('.bookAmount').val(
            num
        );


        $('.bookAmount').trigger(
            'change'
        );

    });


    /* ========================================
       수량 증가
       ======================================== */

    $('#increaseQuantity').click(function(e) {

        e.preventDefault();


        var num =
            parseInt(
                $('.bookAmount').val()
            );


        num++;


        $('.bookAmount').val(
            num
        );


        $('.bookAmount').trigger(
            'change'
        );

    });


    /* ========================================
       재고 확인
       ======================================== */

    $('.bookAmount').change(function() {

        var code =
            $('.code').val();


        var amount =
            parseInt(
                $(this).val()
            );


        var obj =
            $(this);


        if (amount <= 0) {

            alert(
                '1개 이상 구매 가능합니다.'
            );

            obj.val(1);

            return;
        }


        var data = {

            ca_re_code:
                code,

            ca_amount:
                amount

        };


        $.ajax({

            url:
                contextPath +
                '/order/cart/stock',

            type:
                'post',

            data:
                JSON.stringify(data),

            contentType:
                'application/json; charset=utf-8',

            dataType:
                'json',


            success: function(result) {

                if (
                    result.re_amount <
                    amount
                ) {

                    alert(
                        '재고량이 부족합니다.'
                    );


                    obj.val(
                        result.re_amount
                    );

                }

            },


            error: function(error) {

                console.error(error);

            }

        });

    });


    /* ========================================
       바로 구매
       ======================================== */

    $('.btn-buy').click(function(e) {

        e.preventDefault();


        var amount =
            $('.bookAmount').val();


        if (
            parseInt(amount) <= 0
        ) {

            return;
        }


        location.href =
            contextPath +
            '/order/payment?isbn=' +
            encodeURIComponent(isbn) +
            '&amount=' +
            amount;

    });


    /* ========================================
       로그아웃
       ======================================== */

    $('.logout-btn').click(function(e) {

        e.preventDefault();


        $.ajax({

            url:
                contextPath +
                '/api/logout',

            type:
                'GET',


            success: function() {

                location.href =
                    contextPath +
                    '/';

            },


            error: function(error) {

                console.error(error);

            }

        });

    });


    /* ========================================
       사이드 메뉴
       ======================================== */

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


    /* ========================================
       스크롤
       ======================================== */

    var prevScrollTop = 0;

    var nowScrollTop = 0;


    function wheelDelta() {

        return prevScrollTop -
               nowScrollTop > 0
            ? 'up'
            : 'down';

    }


    $(window).on(
        'scroll',
        function() {

            nowScrollTop =
                $(this).scrollTop();


            if (
                wheelDelta() ===
                'down'
            ) {

                $('.bars').fadeOut();

            }


            prevScrollTop =
                nowScrollTop;

        }
    );

});

</script>


</body>

</html>