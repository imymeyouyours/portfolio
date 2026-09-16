<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible"
          content="IE=edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Mypagedetails</title>


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
            text-decoration: none;
            color: black;
        }

        .container {
            margin-top: 120px;
            margin-bottom: 120px;
        }

        .table th,
        .total,
        .prod1,
        .prod2 {
            background-color: #f8f8f8;
        }

        .line-white {
            border-bottom: 2px solid white;
        }

        .table {
            margin-bottom: 70px;
        }

        .orderNum {
            margin-bottom: 30px;
            color: rgb(0, 104, 136);
            font-weight: bold;
        }

        .additional {
            margin-left: 20px;
            list-style: square;
        }

        .btn-box {
            text-align: center;
        }

        .cancel-btn,
        .confirmed-box {
            display: none;
        }

    </style>

</head>


<body>


<div class="container">


    <!-- =========================
         주문번호
         ========================= -->

    <h3 class="orderNum">

        주문번호 :
        <span id="orderNumText"></span>

    </h3>


    <!-- 기존 기능에서 사용하는 값 -->

    <input type="hidden"
           id="or_num">

    <input type="hidden"
           id="pa_num">

    <input type="hidden"
           id="or_pay_card">

    <input type="hidden"
           class="usePoint">

    <input type="hidden"
           id="imp">

    <input type="hidden"
           id="returnPoint">

    <input type="hidden"
           id="id">

    <input type="hidden"
           id="name">

    <input type="hidden"
           id="payCount">

    <input type="hidden"
           class="deliver">



    <!-- =========================
         주문 상품 정보
         ========================= -->

    <h6>| 주문상품정보</h6>


    <table class="table">

        <thead>

        <tr>

            <th>상품명</th>

            <th>주문수량</th>

            <th>가격</th>

            <th>그린포인트</th>

        </tr>

        </thead>


        <!-- AJAX 상품목록 -->

        <tbody id="particularsList">

        </tbody>


        <tfoot>

        <tr class="total">

            <td></td>

            <td>
                합계
            </td>

            <td class="totalCount">
                0원
            </td>

            <td id="totalGreenPoint">
                0
            </td>

        </tr>


        <tr class="prod1">

            <td colspan="2"></td>

            <td>

                <div>

                    상품 총 금액 :

                    <span class="totalCount">
                        0원
                    </span>

                </div>


                <div>

                    총 배송비 :

                    <span id="deliverText">
                        0
                    </span>

                </div>

            </td>


            <td>

                기본 적립 그린 포인트 :

                <span id="greenPointText">
                    0
                </span>

            </td>

        </tr>


        <tr class="prod2">

            <td colspan="2"></td>

            <td>

                주문 총 금액 :

                <span class="orderTotalCount">
                    0원
                </span>

            </td>

            <td id="greenPointText2">
                0
            </td>

        </tr>

        </tfoot>

    </table>



    <!-- =========================
         주문 / 배송 정보
         ========================= -->

    <h6>| 주문, 배송 정보</h6>


    <table class="table">

        <tr>

            <th>
                도착예정일
            </th>

            <td>

                그린배송 :

                <span id="deliDate"></span>

                도착예정

            </td>

            <td colspan="2"></td>

        </tr>


        <tr>

            <th>
                포인트적립예상일
            </th>

            <td>
                구매확정 후 익일적립
            </td>

            <td colspan="2"></td>

        </tr>


        <tr>

            <th>
                주문번호
            </th>

            <td id="orderNumInfo"></td>


            <th>
                주문일자
            </th>

            <td id="orderDate"></td>

        </tr>


        <tr>

            <th>
                주문하신 분
            </th>

            <td id="orderName"></td>


            <th>
                받으시는 분
            </th>

            <td id="receiver"></td>

        </tr>


        <tr>

            <th>
                전화번호
            </th>

            <td id="shippingPhone"></td>

            <td colspan="2"></td>

        </tr>


        <tr>

            <th>
                배송지 주소
            </th>

            <td colspan="3">

                <div>

                    도로명 :

                    <span id="shippingDoro"></span>

                </div>


                <div>

                    지번 :

                    <span id="shippingJibun"></span>

                </div>

            </td>

        </tr>

    </table>



    <!-- =========================
         결제 정보
         ========================= -->

    <h6>| 결제정보</h6>


    <table class="table">

        <tr>

            <th>
                총 주문 금액
            </th>

            <td colspan="3"
                class="orderTotalCount">

                0원

            </td>

        </tr>


        <tr>

            <th>
                실 결제금액
            </th>

            <td>

                <span id="paymentAmount">
                    0
                </span>원

            </td>


            <th>
                그린 포인트 총 적립액
            </th>

            <td id="paymentGreenPoint">
                0
            </td>

        </tr>


        <tr>

            <th>
                결제하신 금액
            </th>

            <td colspan="3">

                <span class="orderTotalCount">
                    0원
                </span>


                <ul class="additional">

                    <li>

                        카드 사용 :

                        <span id="cardPayment">
                            0
                        </span>원

                    </li>


                    <li>

                        그린머니 사용 :

                        <span id="usePointText">
                            0
                        </span>원

                    </li>

                </ul>

            </td>

        </tr>


        <tr>

            <th>
                결제수단
            </th>

            <td id="methods"></td>

            <td colspan="2"></td>

        </tr>


        <tr>

            <th>
                승인번호
            </th>

            <td id="approvedNumber"></td>


            <th>
                승인일자
            </th>

            <td id="approvedDate"></td>

        </tr>

    </table>



    <!-- =========================
         버튼
         ========================= -->

    <div class="btn-box">


        <a href="<%=request.getContextPath()%>/mypage">

            <button class="btn btn-info back-btn">

                목록으로

            </button>

        </a>


        <button type="button"
                class="btn btn-secondary cancel-btn">

            결제취소

        </button>


        <button type="button"
                class="btn btn-secondary confirmed-box">

            구매확정

        </button>


    </div>


</div>



<script>

    const contextPath =
        '<%=request.getContextPath()%>';


    $(function() {


        /* =========================
           URL 주문번호 가져오기
           ========================= */

        const params =
            new URLSearchParams(
                window.location.search
            );


        const orNum =
            params.get('or_num');


        if (!orNum) {

            alert(
                '주문번호가 없습니다.'
            );

            location.href =
                contextPath +
                '/mypage';

            return;
        }



        /* =========================
           주문 상세 API
           ========================= */

        $.ajax({

            url:
                contextPath +
                '/api/mypagedetails',

            type:
                'GET',

            data: {
                or_num: orNum
            },


            success:
                function(result) {


                    console.log(
                        'mypagedetails =',
                        result
                    );


                    renderOrder(
                        result.order
                    );


                    renderShipping(
                        result.shipping
                    );


                    renderPayment(
                        result.payment
                    );


                    renderParticulars(
                        result.particulars
                    );


                    calculateTotal();

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


                    if (
                        xhr.status === 404
                    ) {

                        alert(
                            '주문 정보를 찾을 수 없습니다.'
                        );


                        location.href =
                            contextPath +
                            '/mypage';

                        return;
                    }


                    alert(
                        '주문 상세 정보를 불러오지 못했습니다.'
                    );

                }

        });



        /* =========================
           주문정보 출력
           ========================= */

        function renderOrder(order) {


            if (!order) {
                return;
            }


            $('#orderNumText')
                .text(
                    order.or_num || ''
                );


            $('#orderNumInfo')
                .text(
                    order.or_num || ''
                );


            $('#orderDate')
                .text(
                    order.orDate || ''
                );


            $('#deliDate')
                .text(
                    order.deliDate || ''
                );


            $('#orderName')
                .text(
                    order.or_name || ''
                );


            $('#receiver')
                .text(
                    order.or_receiver || ''
                );


            $('#deliverText')
                .text(
                    order.or_deliver || 0
                );


            $('#greenPointText')
                .text(
                    order.or_green_point || 0
                );


            $('#greenPointText2')
                .text(
                    order.or_green_point || 0
                );


            $('#totalGreenPoint')
                .text(
                    order.or_green_point || 0
                );


            $('#paymentAmount')
                .text(
                    order.or_payment || 0
                );


            $('#paymentGreenPoint')
                .text(
                    order.or_green_point || 0
                );


            $('#cardPayment')
                .text(
                    order.or_payment || 0
                );


            $('#usePointText')
                .text(
                    order.or_use_point || 0
                );


            $('#methods')
                .text(
                    order.or_methods || ''
                );


            $('#approvedNumber')
                .text(
                    order.or_pa_num || ''
                );


            $('#approvedDate')
                .text(
                    order.approvedDate || ''
                );



            /* hidden 값 */

            $('#or_num')
                .val(
                    order.or_num || ''
                );


            $('#pa_num')
                .val(
                    order.or_pa_num || ''
                );


            $('#or_pay_card')
                .val(
                    order.or_pay_card || ''
                );


            $('.usePoint')
                .val(
                    order.or_use_point || 0
                );


            $('#returnPoint')
                .val(
                    order.or_green_point || 0
                );


            $('#id')
                .val(
                    order.or_me_id || ''
                );


            $('#name')
                .val(
                    order.or_name || ''
                );


            $('#payCount')
                .val(
                    order.or_payment || 0
                );


            $('.deliver')
                .val(
                    order.or_deliver || 0
                );



            /* =====================
               주문 상태별 버튼
               ===================== */

            $('.cancel-btn')
                .hide();


            $('.confirmed-box')
                .hide();


            if (
                order.or_state ===
                '결제완료'
            ) {

                $('.cancel-btn')
                    .show();

            }


            if (
                order.or_state ===
                '배송완료'
            ) {

                $('.confirmed-box')
                    .show();

            }

        }



        /* =========================
           배송정보 출력
           ========================= */

        function renderShipping(
            shipping
        ) {


            if (!shipping) {
                return;
            }


            $('#shippingPhone')
                .text(
                    shipping.sh_phone || ''
                );


            $('#shippingDoro')
                .text(
                    shipping.sh_doro || ''
                );


            $('#shippingJibun')
                .text(
                    shipping.sh_jibun || ''
                );

        }



        /* =========================
           결제정보
           ========================= */

        function renderPayment(
            payment
        ) {


            if (!payment) {
                return;
            }


            $('#imp')
                .val(
                    payment.imp_uid || ''
                );

        }



        /* =========================
           주문 상품 목록
           ========================= */

        function renderParticulars(
            particulars
        ) {


            const tbody =
                $('#particularsList');


            tbody.empty();


            if (
                !particulars ||
                particulars.length === 0
            ) {


                tbody.html(

                    '<tr>' +

                        '<td colspan="4" ' +
                            'class="text-center">' +

                            '주문 상품이 없습니다.' +

                        '</td>' +

                    '</tr>'

                );


                return;
            }



            particulars.forEach(
                function(parti) {


                    const row =

                        '<tr class="line-white">' +


                            '<td>' +

                                (parti.pr_title || '') +

                                '<input type="hidden" ' +
                                    'class="isbn" ' +
                                    'value="' +
                                    (parti.pr_bk_isbn || '') +
                                '">' +

                            '</td>' +


                            '<td>' +

                                (parti.pr_amount || 0) +

                                '<input type="hidden" ' +
                                    'class="amount" ' +
                                    'value="' +
                                    (parti.pr_amount || 0) +
                                '">' +

                            '</td>' +


                            '<td>' +

                                (parti.pr_price || 0) +
                                ' 원' +

                                '<input type="hidden" ' +
                                    'class="price" ' +
                                    'value="' +
                                    (parti.pr_price || 0) +
                                '">' +

                            '</td>' +


                            '<td>' +

                                (parti.eachPoint || 0) +

                            '</td>' +


                        '</tr>';


                    tbody.append(
                        row
                    );

                }
            );

        }



        /* =========================
           금액 계산
           ========================= */

        function calculateTotal() {


            let totalCount = 0;


            $('.price')
                .each(
                    function() {


                        const price =
                            Number(
                                $(this).val()
                            ) || 0;


                        const qty =
                            Number(
                                $(this)
                                    .closest('tr')
                                    .find('.amount')
                                    .val()
                            ) || 0;


                        totalCount +=
                            price * qty;

                    }
                );



            $('.totalCount')
                .text(
                    totalCount +
                    '원'
                );



            const deliver =
                Number(
                    $('.deliver').val()
                ) || 0;



            $('.orderTotalCount')
                .text(
                    (
                        totalCount +
                        deliver
                    ) +
                    '원'
                );

        }



        /* =========================
           결제 취소
           ========================= */

        $('.cancel-btn')
            .click(
                function() {


                    if (
                        !confirm(
                            '취소하시겠습니까?'
                        )
                    ) {

                        return;
                    }



                    const payCard =
                        $('#or_pay_card')
                            .val();


                    const orderNum =
                        $('#or_num')
                            .val();


                    const point =
                        $('.usePoint')
                            .val();


                    const returnPoint =
                        $('#returnPoint')
                            .val();



                    const isbn = [];


                    $('.isbn')
                        .each(
                            function() {

                                isbn.push(
                                    $(this).val()
                                );

                            }
                        );



                    const amount = [];


                    $('.amount')
                        .each(
                            function() {

                                amount.push(
                                    $(this).val()
                                );

                            }
                        );



                    /* =====================
                       카카오페이 취소
                       ===================== */

                    if (
                        payCard ===
                        'kakao'
                    ) {


                        const tid =
                            $('#pa_num')
                                .val();


                        $.ajax({

                            url:
                                contextPath +
                                '/order/kakaopay/cancel',

                            type:
                                'POST',

                            traditional:
                                true,


                            data: {

                                or_num:
                                    orderNum,

                                pa_num:
                                    tid,

                                pr_bk_isbn:
                                    isbn,

                                pr_amount:
                                    amount,

                                pr_use_point:
                                    point,

                                po_point:
                                    returnPoint

                            },


                            success:
                                function(data) {


                                    if (
                                        data ===
                                        'OK'
                                    ) {

                                        alert(
                                            '결제 취소 성공'
                                        );


                                        location.href =
                                            contextPath +
                                            '/mypage';

                                    }

                                },


                            error:
                                function(xhr) {


                                    console.error(
                                        xhr
                                    );


                                    alert(
                                        '결제 취소에 실패했습니다.'
                                    );

                                }

                        });


                        return;

                    }



                    /* =====================
                       카드결제 취소
                       ===================== */

                    if (
                        payCard ===
                        'card'
                    ) {


                        const payCount =
                            $('#payCount')
                                .val();


                        const imp =
                            $('#imp')
                                .val();



                        $.ajax({

                            url:
                                contextPath +
                                '/order/inicis/cancel',

                            type:
                                'POST',

                            traditional:
                                true,


                            data: {

                                po_point:
                                    returnPoint,

                                imp_uid:
                                    imp,

                                or_payment:
                                    payCount,

                                or_num:
                                    orderNum,

                                pr_bk_isbn:
                                    isbn,

                                pr_amount:
                                    amount,

                                pr_use_point:
                                    point,

                                reason:
                                    '테스트 결제 환불'

                            },


                            success:
                                function(result) {


                                    if (
                                        result ===
                                        'OK'
                                    ) {

                                        alert(
                                            '환불 성공'
                                        );


                                        location.href =
                                            contextPath +
                                            '/mypage';

                                    }

                                },


                            error:
                                function(xhr) {


                                    console.error(
                                        xhr
                                    );


                                    alert(
                                        '환불 실패'
                                    );

                                }

                        });

                    }

                }
            );



        /* =========================
           구매확정
           ========================= */

        $('.confirmed-box')
            .click(
                function() {


                    const id =
                        $('#id')
                            .val();


                    const orderNum =
                        $('#or_num')
                            .val();


                    const getPoint =
                        $('#returnPoint')
                            .val();



                    $.ajax({

                        url:
                            contextPath +
                            '/member/point',

                        type:
                            'POST',


                        data: {

                            po_me_id:
                                id,

                            or_num:
                                orderNum,

                            po_point:
                                getPoint

                        },


                        success:
                            function(data) {


                                if (
                                    data ===
                                    'OK'
                                ) {

                                    alert(
                                        '구매확정하셨습니다.'
                                    );


                                    location.href =
                                        contextPath +
                                        '/mypage';

                                }

                            },


                        error:
                            function(xhr) {


                                console.error(
                                    xhr
                                );


                                alert(
                                    '구매확정에 실패했습니다.'
                                );

                            }

                    });

                }
            );


    });

</script>


</body>

</html>