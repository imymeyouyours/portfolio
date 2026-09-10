<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible"
          content="IE=edge">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Orders</title>


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

        .notice {
            color: grey;
            font-size: 15px;
            text-align: center;
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
        Orders
    </div>


    <table class="table">

        <thead>

        <tr>

            <th>결제상태</th>
            <th>결제번호</th>
            <th>결제수단</th>
            <th>결제금액</th>
            <th>할인합계</th>
            <th>주문자명</th>
            <th>주문상품</th>
            <th>결제승인일자</th>

        </tr>

        </thead>


        <tbody id="orderList">

        </tbody>

    </table>


    <ul class="pagination justify-content-center"
        id="pagination">

    </ul>

</div>



<script>

$(function () {

    const contextPath =
        '<%=request.getContextPath()%>';


    const params =
        new URLSearchParams(
            window.location.search
        );


    const currentPage =
        params.get("page") || 1;


    // ===============================
    // 주문목록 조회
    // ===============================

    loadOrders(currentPage);



    function loadOrders(page) {

        $.ajax({

            url:
                contextPath + "/api/orders",

            type:
                "GET",

            data: {
                page: page
            },


            success: function (data) {

                console.log(
                    "orders:",
                    data
                );


                renderOrders(
                    data.orderList,
                    data.particulars
                );


                renderPagination(
                    data.pm
                );

            },


            error: function (xhr) {

                console.log(
                    xhr.status,
                    xhr.responseText
                );


                alert(
                    "주문 목록을 불러오지 못했습니다."
                );

            }

        });

    }



    // ===============================
    // 주문목록 출력
    // ===============================

    function renderOrders(
        orderList,
        particulars
    ) {

        const tbody =
            $("#orderList");


        tbody.empty();


        if (!orderList ||
            orderList.length === 0) {

            tbody.append(
                '<tr>' +
                '<td colspan="8" class="notice">' +
                '주문 내역이 없습니다.' +
                '</td>' +
                '</tr>'
            );

            return;
        }


        orderList.forEach(
            function (order) {


                const orderParticulars =
                    particulars.filter(
                        function (parti) {

                            return String(
                                parti.pr_or_num
                            ) === String(
                                order.or_num
                            );

                        }
                    );


                let hiddenHtml = "";


                orderParticulars.forEach(
                    function (parti) {

                        hiddenHtml +=
                            '<input type="hidden" ' +
                            'class="isbn" ' +
                            'value="' +
                            parti.pr_bk_isbn +
                            '">';


                        hiddenHtml +=
                            '<input type="hidden" ' +
                            'class="amount" ' +
                            'value="' +
                            parti.pr_amount +
                            '">';

                    }
                );


                let title =
                    order.or_title || "";


                if (order.or_re_title > 1) {

                    title +=
                        " 외 " +
                        (order.or_re_title - 1) +
                        "권";

                }


                let stateHtml =

                    '<select class="state">' +

                    '<option value="finished" ' +
                    (
                        order.or_state === "결제완료"
                            ? "selected"
                            : ""
                    ) +
                    '>결제완료</option>' +

                    '<option value="delivering" ' +
                    (
                        order.or_state === "배송중"
                            ? "selected"
                            : ""
                    ) +
                    '>배송중</option>' +

                    '<option value="deli-complete" ' +
                    (
                        order.or_state === "배송완료"
                            ? "selected"
                            : ""
                    ) +
                    '>배송완료</option>' +

                    '<option value="confirm" ' +
                    (
                        order.or_state === "구매확정"
                            ? "selected"
                            : ""
                    ) +
                    '>구매확정</option>' +

                    '<option value="cancel" ' +
                    (
                        order.or_state === "결제취소"
                            ? "selected"
                            : ""
                    ) +
                    '>결제취소</option>' +

                    '</select>';



                const row =

                    '<tr>' +

                    '<td>' +

                    '<input type="hidden" ' +
                    'class="payMethod" ' +
                    'value="' +
                    (order.or_pay_card || "") +
                    '">' +

                    '<input type="hidden" ' +
                    'class="orderNum" ' +
                    'value="' +
                    order.or_num +
                    '">' +

                    '<input type="hidden" ' +
                    'class="usePoint" ' +
                    'value="' +
                    (order.or_use_point || 0) +
                    '">' +

                    '<input type="hidden" ' +
                    'class="pa_num" ' +
                    'value="' +
                    (order.or_pa_num || "") +
                    '">' +

                    '<input type="hidden" ' +
                    'class="id" ' +
                    'value="' +
                    (order.or_me_id || "") +
                    '">' +

                    '<input type="hidden" ' +
                    'class="returnPoint" ' +
                    'value="' +
                    (order.or_green_point || 0) +
                    '">' +

                    hiddenHtml +

                    '<input type="hidden" ' +
                    'class="payCount" ' +
                    'value="' +
                    (order.or_payment || 0) +
                    '">' +

                    '<input type="hidden" ' +
                    'class="imp" ' +
                    'value="' +
                    (order.or_imp_uid || "") +
                    '">' +

                    stateHtml +

                    '</td>' +


                    '<td class="orNum">' +
                    order.or_num +
                    '</td>' +


                    '<td>' +
                    (order.or_methods || "") +
                    '</td>' +


                    '<td>' +
                    (order.or_payment || 0) +
                    '원' +
                    '</td>' +


                    '<td>' +
                    (order.or_use_point || 0) +
                    '</td>' +


                    '<td>' +
                    (order.or_me_id || "") +
                    '</td>' +


                    '<td>' +
                    title +
                    '</td>' +


                    '<td>' +
                    (order.approvedDate || "") +
                    '</td>' +

                    '</tr>';


                tbody.append(row);

            }
        );

    }



    // ===============================
    // 페이지네이션
    // ===============================

    function renderPagination(pm) {

        const pagination =
            $("#pagination");


        pagination.empty();


        if (!pm) {
            return;
        }


        const criteria =
            pm.criteria || pm.cri;


        const page =
            criteria
                ? criteria.page
                : 1;


        if (pm.prev) {

            pagination.append(

                '<li class="page-item">' +
                    '<a class="page-link page-btn" ' +
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
                Number(page) === Number(i)
                    ? "active"
                    : "";


            pagination.append(

                '<li class="page-item ' +
                active +
                '">' +

                    '<a class="page-link page-btn" ' +
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

                    '<a class="page-link page-btn" ' +
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



    // ===============================
    // 페이지 클릭
    // ===============================

    $(document).on(
        "click",
        ".page-btn",
        function (e) {

            e.preventDefault();


            const page =
                $(this).data("page");


            location.href =
                contextPath +
                "/orders?page=" +
                page;

        }
    );



    // ===============================
    // 주문상태 변경
    // ===============================

    $(document).on(
        "change",
        ".state",
        function () {


            const row =
                $(this).closest("tr");


            const orderState =
                $(this).val();


            const orNum =
                row.find(".orNum")
                   .text()
                   .trim();


            const data = {

                or_state:
                    orderState,

                or_num:
                    orNum

            };


            $.ajax({

                async:
                    false,

                type:
                    "POST",

                url:
                    contextPath +
                    "/admin/user/orders/mod",

                data:
                    JSON.stringify(data),

                contentType:
                    "application/json; charset=UTF-8",


                success: function (res) {

                    if (res === "OK") {

                        alert(
                            "주문 상태가 변경되었습니다."
                        );

                    } else {

                        alert(
                            "주문 상태가 변경되지 않았습니다."
                        );

                    }

                }

            });



            // ===============================
            // 카카오 결제취소
            // ===============================

            if (
                orderState === "cancel" &&
                row.find(".payMethod").val()
                    === "kakao"
            ) {


                const orderNum =
                    row.find(".orderNum").val();


                const tid =
                    row.find(".pa_num").val();


                const isbn = [];


                row.find(".isbn")
                    .each(function () {

                        isbn.push(
                            $(this).val()
                        );

                    });


                const point =
                    row.find(".usePoint").val();


                const amount = [];


                row.find(".amount")
                    .each(function () {

                        amount.push(
                            $(this).val()
                        );

                    });


                const id =
                    row.find(".id").val();


                const returnPoint =
                    row.find(".returnPoint").val();


                const cancelData = {

                    po_point:
                        returnPoint,

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

                    me_id:
                        id

                };


                $.ajax({

                    async:
                        false,

                    url:
                        contextPath +
                        "/order/kakaopay/cancel",

                    type:
                        "POST",

                    data:
                        cancelData,

                    traditional:
                        true,


                    success: function (data) {

                        if (data === "OK") {

                            alert(
                                "결제 취소 성공"
                            );


                            loadOrders(
                                currentPage
                            );

                        } else {

                            alert(
                                "결제 취소가 이미 처리되었습니다."
                            );

                        }

                    }

                });

            }



            // ===============================
            // 카드 결제취소
            // ===============================

            if (
                orderState === "cancel" &&
                row.find(".payMethod").val()
                    === "card"
            ) {


                const payCount =
                    row.find(".payCount").val();


                const imp =
                    row.find(".imp").val();


                const orderNum =
                    row.find(".orderNum").val();


                const isbn = [];


                row.find(".isbn")
                    .each(function () {

                        isbn.push(
                            $(this).val()
                        );

                    });


                const point =
                    row.find(".usePoint").val();


                const amount = [];


                row.find(".amount")
                    .each(function () {

                        amount.push(
                            $(this).val()
                        );

                    });


                const id =
                    row.find(".id").val();


                const returnPoint =
                    row.find(".returnPoint").val();


                $.ajax({

                    url:
                        contextPath +
                        "/order/inicis/cancel",

                    type:
                        "POST",

                    traditional:
                        true,

                    data: {

                        po_point:
                            returnPoint,

                        me_id:
                            id,

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
                            "테스트 결제 환불"

                    }

                })

                .done(function (result) {

                    if (result === "OK") {

                        alert(
                            "환불 성공"
                        );


                        loadOrders(
                            currentPage
                        );

                    }

                })

                .fail(function () {

                    alert(
                        "환불 실패"
                    );

                });

            }



            // ===============================
            // 구매확정
            // ===============================

            if (
                orderState === "confirm"
            ) {


                const id =
                    row.find(".id").val();


                const orderNum =
                    row.find(".orderNum").val();


                const getPoint =
                    row.find(".returnPoint").val();


                const pointData = {

                    po_me_id:
                        id,

                    or_num:
                        orderNum,

                    po_point:
                        getPoint

                };


                $.ajax({

                    async:
                        false,

                    url:
                        contextPath +
                        "/member/point",

                    type:
                        "POST",

                    data:
                        pointData,

                    traditional:
                        true,


                    success: function (data) {

                        if (data === "OK") {

                            alert(
                                "구매확정으로 변경되었습니다."
                            );


                            loadOrders(
                                currentPage
                            );

                        }

                    }

                });

            }

        }
    );



    // ===============================
    // 사이드바
    // ===============================

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

        return prevScrollTop -
               nowScrollTop > 0
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


});

</script>


</body>
</html>