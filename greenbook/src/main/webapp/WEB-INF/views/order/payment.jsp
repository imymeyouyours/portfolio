<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Payment</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <script src="https://kit.fontawesome.com/be5943d19e.js"
            crossorigin="anonymous"></script>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>


<style>

    * {
        padding: 0;
        margin: 0;
        list-style: none;
        color: black;
    }

    body {
        background-image:
            url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);
        background-size: 400%;
    }

    .subCatagory-list a:hover,
    .menu a:hover {
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
    }

    .cart-contents {
        width: 600px;
    }

    .tableRow {
        background-color: #f8f8f8;
        width: 30%;
    }

    .price-box {
        background-color: #f8f8f8;
        margin-top: 30px;
        text-align: center;
        position: relative;
    }

    .fa-plus {
        position: absolute;
        top: 17px;
        left: calc(25% - 10px);
    }

    .fa-minus {
        position: absolute;
        top: 17px;
        left: calc(50% - 15px);
    }

    .fa-equals {
        position: absolute;
        top: 17px;
        left: calc(75% - 20px);
    }

    .pointView,
    .address {
        display: flex;
    }

    .point,
    .deli-addr {
        width: 800px;
    }

    .point td {
        display: flex;
    }

    .point div {
        margin-left: 40px;
        color: gray;
    }

    .point th,
    .deli-addr th {
        background-color: #f8f8f8;
        width: 150px;
    }

    .point .text {
        width: 100px;
        color: black;
    }

    .point ul {
        margin-left: 40px;
    }

    .collectPoint,
    .client {
        background-color: #f8f8f8;
        width: 310px;
        padding: 20px;
    }

    .collectPoint h4,
    .client h4 {
        font-size: 20px;
    }

    .collectPoint li {
        position: relative;
        height: 48px;
    }

    .collectPoint span {
        position: absolute;
        right: 4px;
    }

    .address td,
    .address th {
        border: none;
    }

    .address {
        border-top: 1px solid #dee2e6;
    }

    .orderInfo tr > th {
        width: 100px;
    }

    .orderInfo tr > td > input {
        width: 150px;
    }

    .home-addr input {
        margin-bottom: 10px;
        width: 450px;
    }

    .shipping input {
        margin: 0 10px;
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

    .fa-exclamation-triangle {
        color: rgb(0, 104, 136);
    }

    .caution {
        font-size: 13px;
    }

    .pay-method {
        height: 70px;
        width: 100%;
        display: flex;
        border: 1px solid #dee2e6;
    }

    .pay-method li {
        width: calc(100% / 2);
        text-align: center;
        line-height: 70px;
        border-right: 1px solid #dee2e6;
        cursor: pointer;
    }

    .pay-method li:last-child {
        border-right: none;
    }

    .doubleCheck {
        color: gray;
        text-align: center;
        font-size: 14px;
    }

    .agree {
        color: black;
    }

    .payment-btn {
        margin-left: calc(50% - 32px);
        margin-top: 7px;
    }

    .deli-date,
    .green-deli,
    .total,
    .doro,
    .finalCount,
    .totalPoint {
        font-weight: 600;
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

    .exchange {
        margin-left: 5px;
    }

    .usePoint {
        position: absolute;
        right: 4px;
        color: rgb(0, 104, 136);
    }

    .new-addr {
        display: none;
        margin-bottom: 10px;
        width: 450px;
    }

    .doroName,
    .jibunName {
        width: 450px;
    }

    .new-addr input {
        margin-bottom: 10px;
    }

</style>


<body>


<!-- 사이드바 -->

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


<!-- 메뉴 -->

<div class="menu">

    <ul>

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


<!-- 본문 -->

<div class="container">

    <form action="<%=request.getContextPath()%>/order/payfinished"
          method="post"
          id="paymentForm">


        <!-- 상품확인 -->

        <h6>| 상품확인</h6>

        <table class="table cart-table">

            <thead>

            <tr class="cartTr">

                <th></th>

                <th class="cart-contents">
                    상품정보
                </th>

                <th>
                    금액
                </th>

                <th>
                    수량
                </th>

                <th>
                    합계
                </th>

                <th>
                    배송일
                </th>

            </tr>

            </thead>


            <!-- AJAX로 출력 -->

            <tbody id="paymentList">

            </tbody>

        </table>


        <!-- 배송일 -->

        <table class="table">

            <tr>

                <th rowspan="2"
                    class="tableRow">
                    배송일
                </th>

                <td>

                    배송지

                    <div class="doro">
                        도로명 :
                        <span id="memberAddress"></span>
                    </div>

                    <div>
                        지번 :
                        <span id="memberJAddress"></span>
                    </div>

                </td>

            </tr>


            <tr>

                <td>

                    그린배송 :

                    <span class="green-deli"></span>
                    도착예정

                    <input type="hidden"
                           name="or_deli_date">

                    <div class="caution">

                        <i class="fas fa-exclamation-triangle"></i>

                        날씨나 택배사 사정에 따라 배송이 지연될 수 있습니다

                    </div>

                </td>

            </tr>

        </table>


        <!-- 가격 -->

        <table class="table price-box">

            <tr>

                <td>
                    총 상품금액
                    <i class="fas fa-plus"></i>
                </td>

                <td>
                    총 추가금액
                    <i class="fas fa-minus"></i>
                </td>

                <td>
                    총 할인금액
                    <i class="fas fa-equals"></i>
                </td>

                <td>
                    최종 결제금액
                </td>

            </tr>


            <tr>

                <td class="totalCount"></td>

                <td class="addPrice"></td>

                <td class="pointDiscount">
                    0원
                </td>

                <td class="finalCount"></td>

            </tr>

        </table>


        <input type="hidden"
               name="finalCount">

        <input type="hidden"
               name="addPrice">


        <!-- 포인트 -->

        <div class="pointView">

            <table class="table point">

                <tbody>

                <tr>

                    <th>
                        그린포인트
                    </th>

                    <td>

                        <div class="text memberPoint">
                            0
                        </div>

                        <div>
                            그린포인트 5000원 이상이면 그린머니로 환전가능합니다.
                        </div>

                    </td>

                </tr>


                <tr class="exchangeRow"
                    style="display:none">

                    <th></th>

                    <td>

                        <input type="text"
                               id="charge"
                               readonly>

                        <input type="hidden"
                               class="useGreen"
                               name="pr_use_point"
                               value="0">

                        <button type="button"
                                class="exchange btn btn-secondary">
                            환전
                        </button>

                    </td>

                </tr>

                </tbody>

            </table>


            <ul class="collectPoint">

                <h4>
                    적립혜택
                </h4>

                <hr>


                <li>

                    기보유 포인트

                    <span class="hasPoint">
                        0
                    </span>

                    <div class="usePoint"></div>

                </li>


                <hr>


                <li>

                    기본적립 포인트

                    <span class="basicPoint"></span>

                    <input type="hidden"
                           name="or_green_point">

                </li>


                <hr>


                <li>

                    총 예상 포인트

                    <span class="totalPoint"></span>

                </li>

            </ul>

        </div>


        <br>


        <!-- 배송주소 -->

        <h6>
            | 배송주소
        </h6>


        <div class="address">

            <table class="table deli-addr">

                <tr>

                    <th>
                        배송지
                    </th>

                    <td class="shipping">

                        <label>

                            <input type="radio"
                                   name="ship_addr"
                                   class="recentAddr"
                                   value="recent">

                            최근배송지

                        </label>


                        <label>

                            <input type="radio"
                                   name="ship_addr"
                                   class="memberAddr"
                                   value="same"
                                   checked>

                            회원정보동일

                        </label>


                        <label>

                            <input type="radio"
                                   name="ship_addr"
                                   class="newAddr"
                                   value="new">

                            새로입력

                        </label>

                    </td>

                </tr>


                <tr>

                    <th>
                        이름
                    </th>

                    <td>

                        <input type="text"
                               class="name">

                        <input type="hidden"
                               name="or_me_id">

                    </td>

                </tr>


                <tr>

                    <th>
                        배송주소
                    </th>


                    <td class="home-addr">

                        도로명주소

                        <input type="text"
                               class="doroAddr">

                        <br>

                        지번주소

                        <input type="text"
                               class="jibunAddr">

                    </td>


                    <td class="new-addr">

                        <input type="text"
                               id="sample4_postcode"
                               placeholder="우편번호">

                        <button type="button"
                                class="btn btn-secondary addrNum">

                            우편번호 찾기

                        </button>

                        <br>


                        <input type="text"
                               id="sample4_roadAddress"
                               placeholder="도로명주소"
                               class="doroName">


                        <input type="text"
                               id="sample4_jibunAddress"
                               placeholder="지번주소"
                               class="jibunName">


                        <span id="guide"
                              style="color:#999;display:none">
                        </span>


                        <input type="text"
                               id="sample4_detailAddress"
                               placeholder="상세주소">


                        <input type="text"
                               id="sample4_extraAddress"
                               placeholder="참고항목">


                        <input type="hidden"
                               name="dAddress">


                        <input type="hidden"
                               name="jAddress">

                    </td>

                </tr>


                <tr>

                    <th>
                        휴대폰
                    </th>

                    <td>

                        <input type="text"
                               class="phone">

                    </td>

                </tr>

            </table>


            <!-- 주문고객 -->

            <div class="client">

                <table class="table orderInfo">

                    <h4>
                        주문고객
                    </h4>

                    <hr>


                    <tr>

                        <th>
                            이름
                        </th>

                        <td>

                            <input type="text"
                                   class="orderName">

                        </td>

                    </tr>


                    <tr>

                        <th>
                            휴대폰
                        </th>

                        <td>

                            <input type="text"
                                   class="cellPhone">

                        </td>

                    </tr>


                    <tr>

                        <th>
                            이메일
                        </th>

                        <td>

                            <input type="text"
                                   class="email">

                        </td>

                    </tr>

                </table>

            </div>

        </div>


        <br>


        <!-- 결제방법 -->

        <h6>
            | 결제방법
        </h6>


        <ul class="pay-method">

            <li>

                <label>

                    <input type="radio"
                           name="pay"
                           value="kakao">

                    카카오페이

                </label>

            </li>


            <li>

                <label>

                    <input type="radio"
                           name="pay"
                           value="card">

                    카드

                </label>

            </li>

        </ul>


        <div class="doubleCheck">

            주문하실 상품, 가격, 배송정보, 할인정보 등을 확인하였으며,
            구매에 동의하시겠습니까?

            <label class="agree">

                <input type="checkbox"
                       name="agree-btn">

                동의합니다.

            </label>

        </div>


        <input type="hidden"
               id="partner_order_id"
               name="partner_order_id">


        <input type="hidden"
               id="sh_doro"
               name="sh_doro">


        <input type="hidden"
               id="sh_jibun"
               name="sh_jibun">


        <input type="hidden"
               name="or_receiver">


        <input type="hidden"
               name="sh_phone">


        <button class="payment-btn btn btn-info"
                type="button">

            결제하기

        </button>

    </form>

</div>


<script>

    const contextPath =
        '<%=request.getContextPath()%>';

    let memberData = null;


    $(function() {

        /* ==========================
           결제 데이터 조회
           ========================== */

        loadPayment();


       function loadPayment() {

           const params = new URLSearchParams(window.location.search);

           const isbn = params.get('isbn');
           const amount = params.get('amount');

           // ca_num=196%2C197 → "196,197"
           const caNumParam = params.get('ca_num');

           // "196,197" → ["196", "197"]
           const caNumList = caNumParam
               ? caNumParam.split(',')
               : [];

           const data = {};

           if (caNumList.length > 0) {

               data.ca_num = caNumList;

           } else {

               data.isbn = isbn;
               data.amount = amount;
           }

           console.log("caNumParam =", caNumParam);
           console.log("caNumList =", caNumList);
           console.log("전송 data =", data);

           $.ajax({
               url: contextPath + '/api/payment',
               type: 'get',
               data: data,
               traditional: true,

               success: function(result) {

                   console.log("result =", result);
                   console.log("paymentList =", result.paymentList);

                   renderPaymentList(result.paymentList);
                   renderMember(result.member);
                   setDeliveryDate();
                   calculatePayment();
               },

               error: function(error) {

                   console.error("payment error =", error);

                   alert('결제 정보를 불러오지 못했습니다.');
               }
           });
       }


        /* ==========================
           상품 출력
           ========================== */

        function renderPaymentList(
            paymentList
        ) {

            const tbody =
                $('#paymentList');


            tbody.empty();


            if (
                !paymentList ||
                paymentList.length === 0
            ) {

                tbody.html(

                    '<tr>' +

                        '<td colspan="6">' +
                            '결제할 상품이 없습니다.' +
                        '</td>' +

                    '</tr>'

                );

                return;

            }


            paymentList.forEach(
                function(payment) {

                    const subtitle =

                        payment.ca_subTitle

                            ? ' : ' +
                              payment.ca_subTitle

                            : '';


                    const amount =

                        Number(
                            payment.ca_amount
                        ) || 0;


                    const price =

                        Number(
                            payment.ca_price
                        ) || 0;


                    const total =

                        price *
                        amount;


                    const mainImg =

                        payment.ca_mainImg
                            || '';


                    const reCode =

                        payment.ca_re_code
                            || '';


                    const row =

                        '<tr>' +


                            '<td>' +

                                '<img ' +

                                    'src="' +
                                    contextPath +
                                    '/img' +
                                    mainImg +
                                    '" ' +

                                    'alt="cartImg" ' +

                                    'class="cart-image">' +


                                '<input ' +

                                    'type="hidden" ' +

                                    'value="' +
                                    payment.ca_isbn +
                                    '" ' +

                                    'name="isbn">' +

                            '</td>' +


                            '<td>' +

                                payment.ca_title +

                                subtitle +

                            '</td>' +


                            '<td class="price">' +

                                price +

                                '원' +

                            '</td>' +


                            '<td class="amount">' +

                                amount +


                                '<input ' +

                                    'type="hidden" ' +

                                    'value="' +
                                    amount +
                                    '" ' +

                                    'class="ca_amount" ' +

                                    'name="pr_amount">' +


                                '<input ' +

                                    'type="hidden" ' +

                                    'value="' +
                                    reCode +
                                    '" ' +

                                    'class="codeNum">' +

                            '</td>' +


                            '<td class="total">' +

                                total +

                                '원' +

                            '</td>' +


                            '<td class="deli-date">' +

                            '</td>' +


                        '</tr>';


                    tbody.append(
                        row
                    );

                }
            );

        }


        /* ==========================
           회원정보 출력
           ========================== */

        function renderMember(
            member
        ) {

            if (!member) {
                return;
            }


            $('#memberAddress')
                .text(
                    member.me_address
                    || ''
                );


            $('#memberJAddress')
                .text(
                    member.me_jAddress
                    || ''
                );


            $('.memberPoint')
                .text(
                    member.me_point
                    || 0
                );


            $('.hasPoint')
                .text(
                    member.me_point
                    || 0
                );


            if (
                Number(
                    member.me_point
                ) >= 5000
            ) {

                $('.exchangeRow')
                    .show();

            }


            $('.name')
                .val(
                    member.me_name
                    || ''
                );


            $('.phone')
                .val(
                    member.me_phone
                    || ''
                );


            $('.doroAddr')
                .val(
                    member.me_address
                    || ''
                );


            $('.jibunAddr')
                .val(
                    member.me_jAddress
                    || ''
                );


            $('.orderName')
                .val(
                    member.me_name
                    || ''
                );


            $('.cellPhone')
                .val(
                    member.me_phone
                    || ''
                );


            $('.email')
                .val(
                    member.me_email
                    || ''
                );


            $('[name=or_me_id]')
                .val(
                    member.me_id
                    || ''
                );


            $('[name=sh_doro]')
                .val(
                    member.me_address
                    || ''
                );


            $('[name=sh_jibun]')
                .val(
                    member.me_jAddress
                    || ''
                );


            $('[name=or_receiver]')
                .val(
                    member.me_name
                    || ''
                );


            $('[name=sh_phone]')
                .val(
                    member.me_phone
                    || ''
                );

        }


        /* ==========================
           금액 계산
           ========================== */

        function calculatePayment() {

            let totalCount =
                0;


            $('#paymentList tr')
                .each(
                    function() {

                        const price =

                            parseInt(

                                $(this)
                                    .find('.price')
                                    .text()
                                    .replace(
                                        /[^0-9]/g,
                                        ''
                                    )

                            ) || 0;


                        const amount =

                            parseInt(

                                $(this)
                                    .find('.ca_amount')
                                    .val()

                            ) || 0;


                        totalCount +=

                            price *
                            amount;

                    }
                );


            $('.totalCount')
                .text(
                    totalCount +
                    '원'
                );


            let addNum =
                0;


            if (
                totalCount <
                10000
            ) {

                addNum =
                    2500;

            }


            $('.addPrice')
                .text(
                    addNum +
                    '원'
                );


            const finalCount =

                totalCount +
                addNum;


            $('.finalCount')
                .text(
                    finalCount +
                    '원'
                );


            $('[name=finalCount]')
                .val(
                    finalCount
                );


            $('[name=addPrice]')
                .val(
                    addNum
                );


            const basicPoint =

                Math.floor(
                    totalCount *
                    0.05
                );


            $('.basicPoint')
                .text(
                    basicPoint
                );


            $('[name=or_green_point]')
                .val(
                    basicPoint
                );


            const hasPoint =

                parseInt(
                    $('.hasPoint')
                        .text()
                ) || 0;


            $('.totalPoint')
                .text(

                    hasPoint +
                    basicPoint

                );

        }


        /* ==========================
           배송일
           ========================== */

        function setDeliveryDate() {

            const now =
                new Date();


            now.setDate(
                now.getDate() +
                2
            );


            const more =

                now
                    .toISOString()
                    .substring(
                        0,
                        10
                    );


            $('.deli-date')
                .text(
                    more +
                    ' 도착예정'
                );


            $('.green-deli')
                .text(
                    more
                );


            $('[name=or_deli_date]')
                .val(
                    more
                );

        }


        /* ==========================
           주소
           ========================== */

        function fullAddress() {

            const sp =
                $('#sample4_postcode')
                    .val();


            const road =
                $('#sample4_roadAddress')
                    .val();


            const jibun =
                $('#sample4_jibunAddress')
                    .val();


            const detail =
                $('#sample4_detailAddress')
                    .val();


            const extra =
                $('#sample4_extraAddress')
                    .val();


            const address =

                sp +
                ', ' +
                road +
                ' ' +
                detail +
                ' ' +
                extra;


            const jAddress =

                sp +
                ', ' +
                jibun +
                ' ' +
                detail +
                ' ' +
                extra;


            $('[name=dAddress]')
                .val(
                    address
                );


            $('[name=jAddress]')
                .val(
                    jAddress
                );


            $('[name=sh_doro]')
                .val(
                    address
                );


            $('[name=sh_jibun]')
                .val(
                    jAddress
                );

        }


        function sample4_execDaumPostcode() {

            new daum.Postcode({

                oncomplete:
                    function(data) {

                        const roadAddr =
                            data.roadAddress;


                        let extraRoadAddr =
                            '';


                        if (
                            data.bname !== '' &&
                            /[동|로|가]$/g
                                .test(
                                    data.bname
                                )
                        ) {

                            extraRoadAddr +=
                                data.bname;

                        }


                        if (
                            data.buildingName !== '' &&
                            data.apartment === 'Y'
                        ) {

                            extraRoadAddr +=

                                extraRoadAddr !== ''

                                    ? ', ' +
                                      data.buildingName

                                    : data.buildingName;

                        }


                        if (
                            extraRoadAddr !== ''
                        ) {

                            extraRoadAddr =

                                ' (' +
                                extraRoadAddr +
                                ')';

                        }


                        $('#sample4_postcode')
                            .val(
                                data.zonecode
                            );


                        $('#sample4_roadAddress')
                            .val(
                                roadAddr
                            );


                        $('#sample4_jibunAddress')
                            .val(
                                data.jibunAddress
                            );


                        $('#sample4_extraAddress')
                            .val(
                                extraRoadAddr
                            );


                        fullAddress();

                    }

            }).open();

        }


        $('.addrNum')
            .click(
                function() {

                    sample4_execDaumPostcode();

                }
            );


        $('.new-addr input')
            .on(
                'change',
                function() {

                    fullAddress();

                }
            );


        /* ==========================
           배송지 선택
           ========================== */

        $('.newAddr')
            .click(
                function() {

                    $('.home-addr')
                        .hide();


                    $('.new-addr')
                        .show();


                    $('.name')
                        .val('');


                    $('.phone')
                        .val('');

                }
            );


        $('.memberAddr')
            .click(
                function() {

                    if (!memberData) {
                        return;
                    }


                    $('.home-addr')
                        .show();


                    $('.new-addr')
                        .hide();


                    $('.name')
                        .val(
                            memberData.me_name
                            || ''
                        );


                    $('.doroAddr')
                        .val(
                            memberData.me_address
                            || ''
                        );


                    $('.jibunAddr')
                        .val(
                            memberData.me_jAddress
                            || ''
                        );


                    $('.phone')
                        .val(
                            memberData.me_phone
                            || ''
                        );


                    $('[name=sh_doro]')
                        .val(
                            memberData.me_address
                            || ''
                        );


                    $('[name=sh_jibun]')
                        .val(
                            memberData.me_jAddress
                            || ''
                        );


                    $('[name=or_receiver]')
                        .val(
                            memberData.me_name
                            || ''
                        );


                    $('[name=sh_phone]')
                        .val(
                            memberData.me_phone
                            || ''
                        );

                }
            );


        $('.recentAddr')
            .click(
                function() {

                    $('.home-addr')
                        .show();


                    $('.new-addr')
                        .hide();


                    $('.name')
                        .val('');


                    $('.phone')
                        .val('');


                    $('.jibunAddr')
                        .val('');


                    $('.doroAddr')
                        .val('');


                    window.open(

                        contextPath +
                        '/order/address',

                        '_blank',

                        'height=400,width=800'

                    );

                }
            );


        $('.name')
            .change(
                function() {

                    $('[name=or_receiver]')
                        .val(
                            $(this)
                                .val()
                        );

                }
            );


        $('.phone')
            .change(
                function() {

                    $('[name=sh_phone]')
                        .val(
                            $(this)
                                .val()
                        );

                }
            );


        $('.doroAddr, .jibunAddr')
            .change(
                function() {

                    $('[name=sh_doro]')
                        .val(
                            $('.doroAddr')
                                .val()
                        );


                    $('[name=sh_jibun]')
                        .val(
                            $('.jibunAddr')
                                .val()
                        );

                }
            );


        /* ==========================
           포인트
           ========================== */

        $('.exchange')
            .click(
                function() {

                    window.open(

                        contextPath +
                        '/order/pointexchange',

                        '_blank',

                        'height=400,width=400'

                    );

                }
            );


        $('#charge')
            .on(
                'change focus',
                function() {

                    if (
                        $('#charge')
                            .val() === ''
                    ) {

                        $('.pointDiscount')
                            .text(
                                '0원'
                            );

                        calculatePayment();

                        return;

                    }


                    const minusPoint =

                        parseInt(

                            $('#charge')
                                .val()
                                .replace(
                                    /[^0-9]/g,
                                    ''
                                )

                        ) || 0;


                    const totalCount =

                        parseInt(

                            $('.totalCount')
                                .text()
                                .replace(
                                    /[^0-9]/g,
                                    ''
                                )

                        ) || 0;


                    const addNum =

                        parseInt(

                            $('.addPrice')
                                .text()
                                .replace(
                                    /[^0-9]/g,
                                    ''
                                )

                        ) || 0;


                    const finalCount =

                        totalCount +
                        addNum -
                        minusPoint;


                    $('.pointDiscount')
                        .text(
                            minusPoint +
                            '원'
                        );


                    $('.finalCount')
                        .text(
                            finalCount +
                            '원'
                        );


                    $('[name=finalCount]')
                        .val(
                            finalCount
                        );


                    $('.usePoint')
                        .text(
                            '-' +
                            minusPoint
                        );


                    $('.useGreen')
                        .val(
                            minusPoint
                        );


                    const hasPoint =

                        parseInt(
                            $('.hasPoint')
                                .text()
                        ) || 0;


                    const basicPoint =

                        parseInt(
                            $('.basicPoint')
                                .text()
                        ) || 0;


                    $('.totalPoint')
                        .text(

                            hasPoint +
                            basicPoint -
                            minusPoint

                        );

                }
            );


        /* ==========================
           사이드 메뉴
           ========================== */

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


        /* ==========================
           결제
           ========================== */

        $('.payment-btn')
            .click(
                function() {

                    if (
                        $('[name=pay]:checked')
                            .length === 0
                    ) {

                        alert(
                            '결제 방법을 선택하세요.'
                        );

                        return;

                    }


                    if (
                        $('[name=agree-btn]:checked')
                            .length === 0
                    ) {

                        alert(
                            '주문 내용 확인 후 동의하셔야 구매가 가능합니다.'
                        );

                        return;

                    }


                    let stockOk =
                        true;


                    $('#paymentList tr')
                        .each(
                            function() {

                                if (
                                    !checkAmount(
                                        $(this)
                                    )
                                ) {

                                    stockOk =
                                        false;

                                }

                            }
                        );


                    if (!stockOk) {

                        location.reload();

                        return;

                    }


                    const payType =

                        $('[name=pay]:checked')
                            .val();


                    if (
                        payType ===
                        'kakao'
                    ) {

                        kakaoPay();

                    }


                    if (
                        payType ===
                        'card'
                    ) {

                        cardPay();

                    }

                }
            );


        /* ==========================
           카카오페이
           ========================== */

        function kakaoPay() {

            const data = {

                sh_name:
                    $('[name=or_receiver]')
                        .val(),

                sh_doro:
                    $('[name=sh_doro]')
                        .val(),

                sh_jibun:
                    $('[name=sh_jibun]')
                        .val(),

                sh_phone:
                    $('[name=sh_phone]')
                        .val(),

                or_me_id:
                    $('[name=or_me_id]')
                        .val(),

                or_receiver:
                    $('[name=or_receiver]')
                        .val(),

                or_payment:
                    $('[name=finalCount]')
                        .val(),

                or_deliver:
                    $('[name=addPrice]')
                        .val(),

                or_green_point:
                    $('[name=or_green_point]')
                        .val(),

                or_deli_date:
                    $('[name=or_deli_date]')
                        .val(),

                or_pay_card:
                    'kakao'

            };


            $.ajax({

                url:
                    contextPath +
                    '/order/kakaopay',

                type:
                    'post',

                dataType:
                    'json',

                data:
                    data,


                success:
                    function(result) {

                        window.open(
                            result.next_redirect_pc_url
                        );

                    },


                error:
                    function(error) {

                        console.error(
                            error
                        );


                        alert(
                            '카카오페이 결제 요청에 실패했습니다.'
                        );

                    }

            });

        }


        /* ==========================
           카드 결제
           ========================== */

        function cardPay() {

            const finalCount =

                $('[name=finalCount]')
                    .val();


            const email =

                $('.email')
                    .val();


            const name =

                $('.orderName')
                    .val();


            const cellPhone =

                $('.cellPhone')
                    .val();


            const doro =

                $('[name=sh_doro]')
                    .val();


            const jibun =

                $('[name=sh_jibun]')
                    .val();


            IMP.init(
                'imp78262628'
            );


            IMP.request_pay(

                {

                    pg:
                        'inicis',

                    pay_method:
                        'card',

                    merchant_uid:
                        'merchant_' +
                        new Date()
                            .getTime(),

                    name:
                        'GreenBookStore',

                    amount:
                        finalCount,

                    buyer_email:
                        email,

                    buyer_name:
                        name,

                    buyer_tel:
                        cellPhone,

                    buyer_addr:
                        doro,

                    buyer_postcode:
                        jibun

                },


                function(rsp) {

                    console.log(
                        rsp
                    );


                    if (!rsp.success) {

                        alert(

                            '결제에 실패하였습니다.\n' +
                            rsp.error_msg

                        );

                        return;

                    }


                    const data = {

                        sh_name:
                            $('[name=or_receiver]')
                                .val(),

                        sh_doro:
                            $('[name=sh_doro]')
                                .val(),

                        sh_jibun:
                            $('[name=sh_jibun]')
                                .val(),

                        sh_phone:
                            $('[name=sh_phone]')
                                .val(),

                        or_me_id:
                            $('[name=or_me_id]')
                                .val(),

                        or_receiver:
                            $('[name=or_receiver]')
                                .val(),

                        or_payment:
                            $('[name=finalCount]')
                                .val(),

                        or_deliver:
                            $('[name=addPrice]')
                                .val(),

                        or_green_point:
                            $('[name=or_green_point]')
                                .val(),

                        or_deli_date:
                            $('[name=or_deli_date]')
                                .val(),

                        or_pay_card:
                            'card',

                        apply_num:
                            rsp.apply_num,

                        pay_method:
                            rsp.pay_method,

                        paid_at:
                            rsp.paid_at,

                        imp_uid:
                            rsp.imp_uid

                    };


                    $.ajax({

                        url:
                            contextPath +
                            '/order/inicis',

                        type:
                            'post',

                        data:
                            data,

                        dataType:
                            'json',


                        success:
                            function(result) {

                                $('#partner_order_id')
                                    .val(
                                        result
                                    );


                                $('#paymentForm')
                                    .submit();

                            },


                        error:
                            function(error) {

                                console.error(
                                    error
                                );


                                alert(
                                    '주문 저장 중 오류가 발생했습니다.'
                                );

                            }

                    });

                }

            );

        }


        /* ==========================
           재고 확인
           ========================== */

        function checkAmount(
            trObj
        ) {

            const amount =

                parseInt(

                    trObj
                        .find('.ca_amount')
                        .val()

                );


            const codeNum =

                trObj
                    .find('.codeNum')
                    .val();


            /*
             바로구매의 Mapper에서
             ca_re_code를 반환하지 않는 경우
             codeNum이 비어있을 수 있음.
            */

            if (
                !codeNum
            ) {

                return true;

            }


            const data = {

                ca_amount:
                    amount,

                ca_re_code:
                    codeNum

            };


            let resultOk =
                true;


            $.ajax({

                url:
                    contextPath +
                    '/order/cart/update',

                type:
                    'post',

                data:
                    JSON.stringify(
                        data
                    ),

                async:
                    false,

                contentType:
                    'application/json; charset=utf-8',


                success:
                    function(result) {

                        if (
                            result ===
                            'OK1'
                        ) {

                            alert(
                                '재고부족으로 주문수량이 변경되었습니다.'
                            );

                            resultOk =
                                false;

                        }

                    },


                error:
                    function(error) {

                        console.error(
                            error
                        );

                        resultOk =
                            false;

                    }

            });


            return resultOk;

        }

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