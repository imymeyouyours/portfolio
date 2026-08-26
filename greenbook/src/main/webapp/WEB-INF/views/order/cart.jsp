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

    <title>Cart</title>

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
            padding: 0;
            margin: 0;
            list-style: none;
        }


        body {
            background-image:
                    url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);

            background-size: 400%;
        }


        .subCatagory-list a:hover {
            color: rgb(0, 104, 136);
            text-decoration: underline;
        }


        .fa-bars {
            font-size: 35px;
            position: absolute;
            top: 20px;
            left: 15px;
            cursor: pointer;
        }


        .container {
            margin-top: 120px;
            margin-bottom: 120px;
        }


        .cartTr {
            background-color: #f8f8f8;
        }


        .cart-image {
            width: 80px;
            height: 105px;
            object-fit: cover;
        }


        input[name="amount"] {
            width: 35px;
            text-align: center;
        }


        .order-btn {
            font-size: 13px;
            width: 80px;
        }


        .delete-btn {
            font-size: 13px;
            width: 80px;
        }


        .cart-contents {
            width: 650px;
        }


        .price-box {
            background-color: #f8f8f8;
            margin-top: 30px;
            text-align: center;
            position: relative;
        }


        .pricePlus {
            position: absolute;
            top: 17px;
            left: calc(100% / 3 - 10px);
        }


        .fa-equals {
            position: absolute;
            top: 17px;
            right: calc(100% / 3 - 10px);
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
            cursor: pointer;
        }


        .btn-box {
            text-align: center;
            margin-top: 40px;
        }


        .menu {
            display: flex;
            position: absolute;
            top: 15px;
            right: 30px;
            z-index: 12;
        }


        .menu a {
            color: black;
        }


        .menu a:hover {
            color: rgb(0, 104, 136);
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


        .minus,
        .plus {
            width: 30px;
            height: 30px;
            line-height: 30px;
            background-color: #f8f8f8;
            border: 1px solid gray;
        }


        .fas {
            text-align: center;
        }


        .amount-box {
            display: flex;
        }


        .notice {
            color: grey;
            font-size: 15px;
            text-align: center;
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
                <a href="#"
                   class="logout-btn">
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
                <a href="<%=request.getContextPath()%>/cart">
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


<!-- 장바구니 -->

<div class="container">

    <form id="orderForm"
          action="<%=request.getContextPath()%>/payment">

        <table class="table cart-table">

            <thead>

            <tr class="cartTr">

                <th></th>

                <th></th>

                <th class="cart-contents">
                    상품정보
                </th>

                <th>
                    수량
                </th>

                <th>
                    상품금액
                </th>

                <th>
                    주문
                </th>

            </tr>

            </thead>


            <!-- AJAX로 장바구니 목록 생성 -->

            <tbody class="cartList">

            <tr>

                <td colspan="6"
                    class="notice">

                    장바구니를 불러오는 중입니다.

                </td>

            </tr>

            </tbody>

        </table>


        <!-- 가격 -->

        <table class="table price-box">

            <tr>

                <td>

                    총 상품금액

                    <i class="fas fa-plus pricePlus"></i>

                </td>


                <td>

                    총 추가금액

                    <i class="fas fa-equals"></i>

                </td>


                <td>
                    최종 결제금액
                </td>

            </tr>


            <tr>

                <td class="totalCount">
                    0원
                </td>

                <td class="addPrice">
                    0원
                </td>

                <td class="finalCount">
                    0원
                </td>

            </tr>

        </table>


        <div class="btn-box">

            <button type="button"
                    class="btn btn-info orderList-btn">

                주문하기

            </button>


            <a href="<%=request.getContextPath()%>/">

                <button type="button"
                        class="btn btn-secondary">

                    쇼핑계속하기

                </button>

            </a>

        </div>

    </form>

</div>


<script>

$(function() {


    var contextPath =
        '<%=request.getContextPath()%>';


    var user =
        '${user == null ? "" : user.me_id}';



    /* ========================================
       장바구니 목록 조회
       ======================================== */

    function loadCart() {

        $.ajax({

            url:
                contextPath +
                '/api/cart',

            type:
                'GET',

            dataType:
                'json',


            success: function(data) {

                console.log(data);

                renderCart(
                    data.cartList
                );

            },


            error: function(xhr) {

                console.error(
                    xhr.responseText
                );


                $('.cartList').html(

                    '<tr>' +

                        '<td colspan="6" ' +
                            'class="notice">' +

                            '장바구니 정보를 불러오지 못했습니다.' +

                        '</td>' +

                    '</tr>'

                );

            }

        });

    }



    /* ========================================
       장바구니 화면 생성
       ======================================== */

    function renderCart(cartList) {

        var tbody =
            $('.cartList');


        tbody.empty();



        if (!cartList ||
            cartList.length === 0) {


            tbody.html(

                '<tr>' +

                    '<td colspan="6" ' +
                        'class="notice">' +

                        '카트에 담겨있는 상품이 없습니다.' +

                    '</td>' +

                '</tr>'

            );


            getTotalCount();


            return;

        }



        $.each(
            cartList,

            function(index, cart) {


                var subTitle = '';


                if (cart.ca_subTitle) {

                    subTitle =
                        ' : ' +
                        escapeHtml(
                            cart.ca_subTitle
                        );

                }



                var image =

                    contextPath +

                    '/img' +

                    (
                        cart.ca_mainImg ||
                        ''
                    );



                var amount =

                    cart.ca_amount ||
                    1;



                var price =

                    cart.ca_price ||
                    0;



                var totalPrice =

                    price *
                    amount;



                var row =


                    '<tr>' +


                    /* 체크박스 */

                    '<td>' +

                        '<input type="checkbox" ' +
                               'name="ca_num" ' +
                               'value="' +
                               cart.ca_num +
                               '" checked>' +

                    '</td>' +



                    /* 이미지 */

                    '<td>' +

                        '<img src="' +
                             image +
                             '" ' +

                             'alt="cartImg" ' +

                             'class="cart-image">' +

                    '</td>' +



                    /* 상품정보 */

                    '<td>' +

                        escapeHtml(
                            cart.ca_title ||
                            ''
                        ) +

                        subTitle +


                        '<input type="hidden" ' +
                               'class="codeNum" ' +
                               'value="' +
                               cart.ca_re_code +
                               '">' +

                    '</td>' +



                    /* 수량 */

                    '<td class="amount-box">' +


                        '<button type="button" ' +
                                'class="decreaseQuantity minus">' +

                            '<i class="fas fa-minus"></i>' +

                        '</button>' +


                        '<input type="text" ' +
                               'name="amount" ' +
                               'class="amount" ' +
                               'value="' +
                               amount +
                               '" readonly>' +


                        '<button type="button" ' +
                                'class="increaseQuantity plus">' +

                            '<i class="fas fa-plus"></i>' +

                        '</button>' +


                        '<input type="hidden" ' +
                               'name="ca_re_amount" ' +
                               'value="' +
                               (
                                   cart.ca_re_amount ||
                                   0
                               ) +
                               '">' +


                    '</td>' +



                    /* 가격 */

                    '<td>' +

                        '<span class="rowTotal">' +

                            totalPrice +

                        '</span>원' +


                        '<input type="hidden" ' +
                               'class="price" ' +
                               'value="' +
                               price +
                               '">' +

                    '</td>' +



                    /* 주문 / 삭제 */

                    '<td>' +


                        '<button type="button" ' +

                                'class="btn btn-secondary ' +
                                'order-btn mb-1" ' +

                                'data-cart-num="' +
                                cart.ca_num +
                                '">' +

                            '주문하기' +

                        '</button>' +


                        '<br>' +


                        '<button type="button" ' +

                                'class="btn btn-secondary ' +
                                'delete-btn" ' +

                                'data-re-code="' +
                                cart.ca_re_code +
                                '">' +

                            '삭제' +

                        '</button>' +


                    '</td>' +


                    '</tr>';



                tbody.append(
                    row
                );

            }

        );


        getTotalCount();

    }



    /* ========================================
       XSS 방지
       ======================================== */

    function escapeHtml(value) {

        return $('<div>')
            .text(value)
            .html();

    }



    /* ========================================
       삭제
       ======================================== */

    $(document).on(

        'click',

        '.delete-btn',

        function() {


            var cartNum =

                $(this)
                    .attr(
                        'data-re-code'
                    );



            var data = {

                ca_re_code:
                    cartNum

            };



            $.ajax({

                url:
                    contextPath +
                    '/api/cart/delete',

                type:
                    'POST',

                data:
                    JSON.stringify(
                        data
                    ),

                contentType:
                    'application/json; charset=utf-8',


                success: function(result) {


                    if (
                        result == 1 ||
                        result == 'DELETE_OK'
                    ) {

                        alert(
                            '삭제되었습니다.'
                        );


                        loadCart();

                    }

                    else {

                        alert(
                            '삭제에 실패했습니다.'
                        );

                    }

                },


                error: function(error) {

                    console.error(
                        error
                    );


                    alert(
                        '삭제에 실패했습니다.'
                    );

                }

            });

        }

    );



    /* ========================================
       수량 감소
       ======================================== */

    $(document).on(

        'click',

        '.decreaseQuantity',

        function(e) {


            e.preventDefault();



            var input =

                $(this)
                    .parent()
                    .find(
                        '.amount'
                    );



            var num =

                parseInt(
                    input.val()
                );



            num--;



            if (num < 1) {

                alert(
                    '1개 이상 구매 가능합니다.'
                );

                return;

            }



            input.val(
                num
            );


            updateCart(
                input
            );

        }

    );



    /* ========================================
       수량 증가
       ======================================== */

    $(document).on(

        'click',

        '.increaseQuantity',

        function(e) {


            e.preventDefault();



            var input =

                $(this)
                    .parent()
                    .find(
                        '.amount'
                    );



            var num =

                parseInt(
                    input.val()
                );



            var stock =

                parseInt(

                    $(this)
                        .parent()
                        .find(
                            'input[name="ca_re_amount"]'
                        )
                        .val()

                );



            num++;



            if (
                stock > 0 &&
                num > stock
            ) {

                alert(
                    '재고량이 부족합니다.'
                );

                return;

            }



            input.val(
                num
            );


            updateCart(
                input
            );

        }

    );



    /* ========================================
       수량 수정 AJAX
       ======================================== */

    function updateCart(input) {


        var tr =

            input.parents(
                'tr'
            );



        var amount =

            parseInt(
                input.val()
            );



        var codeNum =

            tr.find(
                '.codeNum'
            ).val();



        var data = {

            ca_amount:
                amount,

            ca_re_code:
                codeNum

        };



        $.ajax({

            url:
                contextPath +
                '/api/cart/update',

            type:
                'POST',

            data:
                JSON.stringify(
                    data
                ),

            contentType:
                'application/json; charset=utf-8',


            success: function(result) {


                console.log(
                    result
                );


                var price =

                    parseInt(

                        tr.find(
                            '.price'
                        ).val()

                    ) || 0;



                tr.find(
                    '.rowTotal'
                ).text(

                    price *
                    amount

                );


                getTotalCount();

            },


            error: function(error) {

                console.error(
                    error
                );


                alert(
                    '수량 변경에 실패했습니다.'
                );


                loadCart();

            }

        });

    }



    /* ========================================
       체크박스
       ======================================== */

    $(document).on(

        'change',

        'input[name="ca_num"]',

        function() {

            getTotalCount();

        }

    );



    /* ========================================
       총 금액 계산
       ======================================== */

    function getTotalCount() {


        var totalCount = 0;



        $('.cartList tr')
            .each(function() {


                var tr =
                    $(this);



                var checkbox =

                    tr.find(
                        'input[name="ca_num"]'
                    );



                if (
                    checkbox.length === 0
                ) {

                    return;

                }



                if (
                    checkbox.prop(
                        'checked'
                    )
                ) {


                    var price =

                        parseInt(

                            tr.find(
                                '.price'
                            ).val()

                        ) || 0;



                    var qty =

                        parseInt(

                            tr.find(
                                '.amount'
                            ).val()

                        ) || 0;



                    totalCount +=

                        price *
                        qty;

                }

            });



        $('.totalCount').text(

            totalCount +
            '원'

        );



        var delivery = 0;



        if (
            totalCount === 0
        ) {

            delivery = 0;

        }

        else if (
            totalCount >= 10000
        ) {

            delivery = 0;

        }

        else {

            delivery = 2500;

        }



        $('.addPrice').text(

            delivery +
            '원'

        );



        $('.finalCount').text(

            (
                totalCount +
                delivery
            ) +
            '원'

        );

    }



    /* ========================================
       개별 주문
       ======================================== */

    $(document).on(

        'click',

        '.order-btn',

        function() {


            var cartNum =

                $(this)
                    .attr(
                        'data-cart-num'
                    );



            location.href =

                contextPath +

                '/payment?ca_num=' +

                encodeURIComponent(
                    cartNum
                );

        }

    );



    /* ========================================
       선택 주문
       ======================================== */

    $('.orderList-btn')
        .click(function() {


            if (
                user === ''
            ) {

                alert(
                    '회원만 사용 가능합니다.'
                );

                return;

            }



            var checked =

                $('input[name="ca_num"]:checked');



            if (
                checked.length === 0
            ) {

                alert(
                    '선택된 상품이 없습니다.'
                );

                return;

            }



            var params = [];



            checked.each(function() {

                params.push(
                    $(this).val()
                );

            });



            location.href =

                contextPath +

                '/payment?ca_num=' +

                encodeURIComponent(

                    params.join(',')

                );

        });



    /* ========================================
       로그아웃
       ======================================== */

    $('.logout-btn')
        .click(function(e) {


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

                    console.error(
                        error
                    );

                }

            });

        });



    /* ========================================
       사이드 메뉴
       ======================================== */

    $('.fa-bars')
        .click(function() {

            $('.side-bars')
                .show();

        });



    $('.fa-times')
        .click(function() {

            $('.side-bars')
                .hide();

        });



    $('.domestic')
        .hover(function() {

            $('.foreign-list')
                .hide();

            $('.dome-list')
                .show();

        });



    $('.foreign')
        .hover(function() {

            $('.dome-list')
                .hide();

            $('.foreign-list')
                .show();

        });



    /* ========================================
       스크롤
       ======================================== */

    var prevScrollTop = 0;

    var nowScrollTop = 0;



    function wheelDelta() {

        return

            prevScrollTop -
            nowScrollTop > 0

            ? 'up'

            : 'down';

    }



    $(window)
        .on(

            'scroll',

            function() {


                nowScrollTop =

                    $(this)
                        .scrollTop();



                if (
                    prevScrollTop -
                    nowScrollTop <= 0
                ) {

                    $('.bars')
                        .fadeOut();

                }



                prevScrollTop =
                    nowScrollTop;

            }

        );



    /* ========================================
       최초 장바구니 조회
       ======================================== */

    loadCart();


});

</script>


</body>

</html>