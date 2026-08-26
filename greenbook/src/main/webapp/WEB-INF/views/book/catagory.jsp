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

    <title>Catagory</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <script src="https://kit.fontawesome.com/be5943d19e.js"
            crossorigin="anonymous"></script>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<style>

    * {
        padding: 0;
        margin: 0;
        text-decoration: none;
        list-style: none;
        color: black;
    }

    body {
        background-image:
            url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);
        background-size: 400%;
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

    .container {
        margin-top: 120px;
        overflow: hidden;
        margin-bottom: 120px;
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

    h1 {
        font-weight: bold;
    }

    .viewList {
        width: 500px;
        height: 50px;
        background-color: #f8f8f8;
        display: flex;
        font-size: 17px;
        line-height: 50px;
        margin-top: 40px;
        font-weight: 600;
    }

    .viewList li {
        margin: 0 30px 0 15px;
    }

    .table {
        margin-top: 5px;
    }

    input[name="checkList"] {
        width: 20px;
        height: 20px;
    }

    .catagoryImg {
        width: 200px;
        height: 315px;
    }

    .cataTitle {
        font-weight: bold;
        margin-bottom: 20px;
        font-size: 30px;
    }

    .cataContents {
        width: 650px;
    }

    .cataPrice {
        font-size: 25px;
        font-weight: 600;
    }

    .preview {
        max-height: 200px;
        overflow: hidden;
        margin-top: 20px;

        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
    }

    input[name="cataAmount"] {
        width: 47px;
        margin-right: -1px;
        height: 30px;
        text-align: center;
    }

    .cataBottom {
        display: flex;
        margin: 40px 0;
    }

    .cataBottom * {
        margin-right: 2px;
    }

    .viewList a {
        cursor: pointer;
        color: black;
    }

    .btn-part {
        display: flex;
        margin-left: 910px;
    }

    .btn-part button {
        margin-left: 7px;
    }

    .allUnChecked-btn {
        display: none;
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
        margin-right: 37px;
    }

    .fas {
        text-align: center;
        margin-right: 0;
    }

    .amount-box {
        display: flex;
        line-height: 30px;
        margin-top: 4px;
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

    .notice {
        color: grey;
        font-size: 15px;
        text-align: center;
    }

</style>

<body>

<!-- ==================== 사이드 메뉴 ==================== -->

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


<!-- ==================== 상단 메뉴 ==================== -->

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
                <a href="<%=request.getContextPath()%>/api/logout">
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


<!-- ==================== 본문 ==================== -->

<div class="container">

    <h1 class="titleCatagory"></h1>


    <!-- 정렬 -->

    <ul class="viewList">

        <li>
            <a href="#"
               class="sort-btn"
               data-sort="basic">
                기본순
            </a>
        </li>

        <li>
            <a href="#"
               class="sort-btn"
               data-sort="popular">
                인기순
            </a>
        </li>

        <li>
            <a href="#"
               class="sort-btn"
               data-sort="highPrice">
                높은가격순
            </a>
        </li>

        <li>
            <a href="#"
               class="sort-btn"
               data-sort="lowPrice">
                낮은가격순
            </a>
        </li>

    </ul>


    <form action="<%=request.getContextPath()%>/api/cartRegister"
          method="post">

        <div class="btn-part">

            <button class="btn btn-secondary addAllCart-btn">
                장바구니
            </button>

            <button type="button"
                    class="btn btn-secondary allChecked-btn">
                전체선택
            </button>

            <button type="button"
                    class="btn btn-secondary allUnChecked-btn">
                전체해제
            </button>

        </div>


        <!--
            기존 c:forEach 삭제

            API에서 받아온 데이터로
            JavaScript가 여기에 <tr>을 추가함
        -->

        <table class="table" id="bookTable">

        </table>

    </form>


    <!-- 페이징 -->

    <ul class="pagination justify-content-center"
        id="pagination">

    </ul>

</div>


<script>

    /* =============================================
       기본 설정
       ============================================= */

    var contextPath = '<%=request.getContextPath()%>';

    var user = '${user == null ? "" : user.me_id}';


    /*
        현재 주소에서 파라미터 가져오기

        예:

        /book/catagory
            ?re_catagory=소설/시
            &country=국내/해외
            &sort=popular
            &page=2
    */

    const urlParams =
        new URLSearchParams(window.location.search);

    const reCatagory =
        urlParams.get('re_catagory');

    const country =
        urlParams.get('country') || '';

    const sort =
        urlParams.get('sort') || 'basic';

    const page =
        Number(urlParams.get('page') || 1);


    /* 제목 */

    $('.titleCatagory').text(reCatagory || '');


    /* =============================================
       API 호출
       ============================================= */

    function loadBooks() {

        if (!reCatagory) {
            $('#bookTable').html(
                '<tr><td class="notice">카테고리를 선택해주세요.</td></tr>'
            );

            return;
        }


        const query =
            new URLSearchParams();

        query.set(
            're_catagory',
            reCatagory
        );

        query.set(
            'country',
            country
        );

        query.set(
            'sort',
            sort
        );

        query.set(
            'page',
            page
        );


        fetch(
            contextPath +
            '/api/catagory?' +
            query.toString()
        )
        .then(function(response) {

            if (!response.ok) {
                throw new Error(
                    '카테고리 조회 실패'
                );
            }

            return response.json();

        })
        .then(function(data) {

            console.log(data);

            renderBooks(
                data.registration
            );

            renderPagination(
                data.pm
            );

        })
        .catch(function(error) {

            console.error(error);

            $('#bookTable').html(
                '<tr>' +
                    '<td class="notice">' +
                        '책 정보를 불러오는 중 오류가 발생했습니다.' +
                    '</td>' +
                '</tr>'
            );

        });

    }


    /* =============================================
       책 목록 화면 출력
       ============================================= */

    function renderBooks(books) {

        const table = $('#bookTable');

        table.empty();

        if (!books || books.length === 0) {

            table.html(
                '<tr>' +
                    '<td class="notice">' +
                        '관련된 책 정보가 없습니다.' +
                    '</td>' +
                '</tr>'
            );

            return;
        }

        books.forEach(function(book) {

            const subtitle =
                book.bk_subtitle
                    ? ' : ' + book.bk_subtitle
                    : '';

            const writer =
                book.bk_au_writer || '';

            const publish =
                book.bk_publish || '';

            const date =
                book.date || '';

            const price =
                book.re_price || book.bk_price || 0;

            const contents =
                book.re_contents || book.bk_contents || '';

            const code =
                book.re_code || book.bk_code || '';

            const catagory =
                book.re_catagory || reCatagory;

            const row =
                '<tr>' +

                    '<td>' +

                        '<a href="' +
                            contextPath +
                            '/details?re_bk_isbn=' +
                            book.bk_isbn +
                        '">' +

                            '<img src="' +
                                contextPath +
                                '/img' +
                                book.bk_mainImg +
                            '" ' +
                            'alt="catagoryImg" ' +
                            'class="catagoryImg">' +

                        '</a>' +

                    '</td>' +


                    '<td class="cataContents">' +

                        '<a href="' +
                            contextPath +
                            '/details?re_bk_isbn=' +
                            book.bk_isbn +
                        '">' +

                            '<span class="cataTitle">' +
                                book.bk_title +
                            '</span>' +

                            '<span>' +
                                subtitle +
                            '</span>' +

                        '</a>' +


                        '<div>' +

                            writer + ' 저' +

                            ' | ' +
                            publish +

                            ' | ' +
                            date +

                        '</div>' +


                        '<span class="pricePart">' +

                            '<span>' +
                                '판매가 &nbsp; | ' +
                            '</span>' +

                            '<span class="cataPrice">' +
                                price +
                                '원' +
                            '</span>' +

                        '</span>' +


                        '<div class="preview">' +
                            contents +
                        '</div>' +


                        '<div class="cataBottom">' +

                            '<div class="amount-box">' +

                                '수량 &nbsp;&nbsp;' +

                                '<button type="button" ' +
                                    'class="decreaseQuantity minus">' +
                                    '<i class="fas fa-minus"></i>' +
                                '</button>' +

                                '<input type="text" ' +
                                    'name="cataAmount" ' +
                                    'class="cataAmount" ' +
                                    'value="1" readonly>' +

                                '<input type="checkbox" ' +
                                    'name="cartAmount" ' +
                                    'style="display:none" ' +
                                    'value="1">' +

                                '<button type="button" ' +
                                    'class="increaseQuantity plus">' +
                                    '<i class="fas fa-plus"></i>' +
                                '</button>' +

                                '<input type="hidden" ' +
                                    'value="' + code + '" ' +
                                    'class="code">' +

                            '</div>' +


                            '<a href="#" class="addCart-btn">' +
                                '<button type="button" ' +
                                    'class="btn btn-info">' +
                                    '장바구니' +
                                '</button>' +
                            '</a>' +


                            '<a href="' +
                                contextPath +
                                '/order/payment" ' +
                                'class="btn-buy">' +

                                '<button type="button" ' +
                                    'class="btn btn-secondary">' +
                                    '바로구매' +
                                '</button>' +

                            '</a>' +


                            '<input type="hidden" ' +
                                'value="' + book.bk_isbn + '" ' +
                                'class="isbn">' +

                            '<input type="hidden" ' +
                                'value="' + catagory + '" ' +
                                'class="catagory">' +

                        '</div>' +

                    '</td>' +


                    '<td>' +

                        '<input type="checkbox" ' +
                            'name="checkList" ' +
                            'value="' + book.bk_isbn + '">' +

                    '</td>' +

                '</tr>';

            table.append(row);
        });
    }


    /* =============================================
       페이징 출력
       ============================================= */

    function renderPagination(pm) {

        const pagination = $('#pagination');

        pagination.empty();

        console.log('pm:', pm);

        if (!pm) {
            return;
        }

        // 이전
        if (pm.prev) {

            pagination.append(
                '<li class="page-item">' +
                    '<a class="page-link" ' +
                       'href="#" ' +
                       'data-page="' + (pm.startPage - 1) + '">' +
                        '이전' +
                    '</a>' +
                '</li>'
            );
        }

        // 페이지 번호
        for (let i = pm.startPage; i <= pm.endPage; i++) {

            const active =
                page === i
                    ? 'active'
                    : '';

            pagination.append(
                '<li class="page-item ' + active + '">' +
                    '<a class="page-link" ' +
                       'href="#" ' +
                       'data-page="' + i + '">' +
                        i +
                    '</a>' +
                '</li>'
            );
        }

        // 다음
        if (pm.next) {

            pagination.append(
                '<li class="page-item">' +
                    '<a class="page-link" ' +
                       'href="#" ' +
                       'data-page="' + (pm.endPage + 1) + '">' +
                        '다음' +
                    '</a>' +
                '</li>'
            );
        }
    }


    /* =============================================
       페이지 클릭
       ============================================= */

    $(document).on(
        'click',
        '.page-link',
        function(e) {

            e.preventDefault();


            const selectedPage =
                $(this).data('page');


            const query =
                new URLSearchParams();


            query.set(
                're_catagory',
                reCatagory
            );


            if (country) {

                query.set(
                    'country',
                    country
                );

            }


            query.set(
                'sort',
                sort
            );


            query.set(
                'page',
                selectedPage
            );


            location.href =
                contextPath +
                '/catagory?' +
                query.toString();

        }
    );


    /* =============================================
       정렬
       ============================================= */

    $('.sort-btn').click(function(e) {

        e.preventDefault();


        const selectedSort =
            $(this).data('sort');


        const query =
            new URLSearchParams();


        query.set(
            're_catagory',
            reCatagory
        );


        if (country) {

            query.set(
                'country',
                country
            );

        }


        query.set(
            'sort',
            selectedSort
        );


        query.set(
            'page',
            1
        );


        location.href =
            contextPath +
            '/catagory?' +
            query.toString();

    });


    /* =============================================
       사이드 메뉴
       ============================================= */

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


    /* =============================================
       스크롤
       ============================================= */

    var prevScrollTop = 0;

    var nowScrollTop = 0;


    function wheelDelta() {

        return prevScrollTop - nowScrollTop > 0
            ? 'up'
            : 'down';

    }


    $(window).on(
        'scroll',
        function() {

            nowScrollTop =
                $(this).scrollTop();


            if (wheelDelta() === 'down') {

                $('.bars').fadeOut();

            }


            prevScrollTop =
                nowScrollTop;

        }
    );


    /* =============================================
       전체 선택
       ============================================= */

    $('.allChecked-btn').click(function() {

        $(this).hide();

        $('.allUnChecked-btn').show();


        $('input[name=checkList]')
            .prop(
                'checked',
                true
            );


        $('[name=cartAmount]')
            .prop(
                'checked',
                true
            );

    });


    /* =============================================
       전체 해제
       ============================================= */

    $('.allUnChecked-btn').click(function() {

        $(this).hide();

        $('.allChecked-btn').show();


        $('input[name=checkList]')
            .prop(
                'checked',
                false
            );


        $('[name=cartAmount]')
            .prop(
                'checked',
                false
            );

    });


    /* =============================================
       개별 체크박스
       ============================================= */

    $(document).on(
        'click',
        '[name=checkList]',
        function() {

            $(this)
                .parents('tr')
                .find('[name=cartAmount]')
                .prop(
                    'checked',
                    $(this).is(':checked')
                );

        }
    );


    /* =============================================
       바로구매
       ============================================= */

    $(document).on(
        'click',
        '.btn-buy',
        function(e) {

            const amount =
                $(this)
                    .parent()
                    .find(
                        'input[name=cataAmount]'
                    )
                    .val();


            const isbn =
                $(this)
                    .parent()
                    .find('.isbn')
                    .val();


            if (parseInt(amount) <= 0) {

                e.preventDefault();

                return;

            }


            $(this).attr(
                'href',
                contextPath +
                    '/order/payment?isbn=' +
                    encodeURIComponent(isbn) +
                    '&amount=' +
                    amount
            );

        }
    );


    /* =============================================
       장바구니 한 개 추가
       ============================================= */

    $(document).on(
        'click',
        '.addCart-btn',
        function(e) {

            e.preventDefault();


            if (user === '') {

                alert(
                    '회원만 사용 가능합니다.'
                );

                return;

            }


            const button =
                $(this);


            const amount =
                button
                    .parent()
                    .find(
                        'input[name=cataAmount]'
                    )
                    .val();


            const code =
                button
                    .parent()
                    .find('.code')
                    .val();


            const data = {

                ca_amount: amount,

                ca_re_code: code

            };


            $.ajax({

                url:
                    contextPath +
                    '/cart',

                type: 'post',

                data:
                    JSON.stringify(data),

                contentType:
                    'application/json; charset=utf-8',


                success: function(result) {

                    if (result == '1') {

                        alert(
                            '카트 담기 성공'
                        );

                    }


                    const isGo =
                        confirm(
                            '장바구니로 이동하겠습니까?'
                        );


                    if (isGo) {

                        location.href =
                            contextPath +
                            '/cart';

                    }

                },

                error: function(error) {

                    console.error(error);

                    alert(
                        '장바구니 등록 중 오류가 발생했습니다.'
                    );

                }

            });

        }
    );


    /* =============================================
       여러 개 장바구니
       ============================================= */

    $('.addAllCart-btn').click(function(e) {

        e.preventDefault();

        if (user === '') {
            alert('회원만 사용 가능합니다.');
            return;
        }

        if ($('input[name=checkList]:checked').length === 0) {
            alert('선택된 상품이 없습니다.');
            return;
        }

        const form = $(this).closest('form');

        $.ajax({
            url: contextPath + '/api/cartRegister',
            type: 'post',
            data: form.serialize(),

            success: function(result) {

                if (result === 'CART_OK') {
                    location.href =
                        contextPath + '/cart';
                }
            },

            error: function(error) {
                console.error(error);
                alert('장바구니 등록 중 오류가 발생했습니다.');
            }
        });
    });


    /* =============================================
       수량 감소
       ============================================= */

    $(document).on(
        'click',
        '.decreaseQuantity',
        function(e) {

            e.preventDefault();


            const row =
                $(this).parents('tr');


            if (
                !row
                    .find(
                        '[name=checkList]'
                    )
                    .is(':checked')
            ) {

                alert(
                    '체크 후 수량을 변경하세요.'
                );

                return;

            }


            const input =
                $(this)
                    .parent()
                    .find('.cataAmount');


            let num =
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


            input.val(num);


            $(this)
                .parent()
                .find('[name=cartAmount]')
                .val(num);


            input.trigger('change');

        }
    );


    /* =============================================
       수량 증가
       ============================================= */

    $(document).on(
        'click',
        '.increaseQuantity',
        function(e) {

            e.preventDefault();


            const row =
                $(this).parents('tr');


            if (
                !row
                    .find(
                        '[name=checkList]'
                    )
                    .is(':checked')
            ) {

                alert(
                    '체크 후 수량을 변경하세요.'
                );

                return;

            }


            const input =
                $(this)
                    .parent()
                    .find('.cataAmount');


            let num =
                parseInt(
                    input.val()
                );


            num++;


            input.val(num);


            $(this)
                .parent()
                .find('[name=cartAmount]')
                .val(num);


            input.trigger('change');

        }
    );


    /* =============================================
       재고 확인
       ============================================= */

    $(document).on(
        'change',
        '.cataAmount',
        function() {

            const obj =
                $(this);


            const code =
                obj
                    .parent()
                    .find('.code')
                    .val();


            const amount =
                parseInt(
                    obj.val()
                );


            if (amount <= 0) {

                alert(
                    '1개 이상 구매 가능합니다.'
                );

                obj.val(1);

                return;

            }


            const data = {

                ca_re_code: code,

                ca_amount: amount

            };


            $.ajax({

                url:
                    contextPath +
                    '/order/cart/stock',

                type: 'post',

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

        }
    );


    /* =============================================
       최초 실행
       ============================================= */

    loadBooks();

</script>

</body>

</html>