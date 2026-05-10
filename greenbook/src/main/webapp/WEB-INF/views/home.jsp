<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <link
            rel="stylesheet"
            href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/be5943d19e.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"/>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
            color: black;
        }

        .subCatagory-list a:hover {
            color: rgb(0, 104, 136);
            text-decoration: underline;
        }

        .main {
            position: relative;
            background-image: url(${pageContext.request.contextPath}/resources/js/water.jpg);
            background-position: center center;
            height: 1280px;
            width: 100%;
            overflow: hidden;

        }

        .homeImg {
            width: 100%;
            height: 100%;
        }

        /* .bookstore{
             position: absolute;  top:calc(45% - 768px / 2); left: calc(50% - 1366px / 2);
         }*/
        .bookstore {
            position: absolute;
            width: 1500px;
            top: 60px;
            left: calc(50% - 1500px / 2);
        }

        .letter {
            color: white;
            font-size: 35px;
            position: absolute;
            top: 65%;
            text-align: center;
            width: 100%;
            font-style: italic;
            letter-spacing: 0;
        }

        .menu {
            display: flex;
            position: absolute;
            top: 15px;
            right: 30px;
        }

        .menu ul li {
            float: left;
            padding: 10px;
            font-size: 20px;
            cursor: pointer;
        }

        .menu ul li a {
            font-size: 18px;
            font-weight: bold;
        }

        .fa-search {
            font-size: 25px;
            text-align: center;
            margin-top: 11px;
            margin-left: 3px;
            cursor: pointer;
        }

        .fa-bars {
            font-size: 35px;
            position: absolute;
            top: 20px;
            left: 15px;
            cursor: pointer;
        }

        .menu ul::after {
            content: '';
            clear: both;
            display: block;
        }

        .container, .container2, .container3 {
            width: 100%;
            height: 900px;
            position: relative;
            overflow: hidden;
        }

        .container2 {
            height: 1200px;
        }

        .choice > div:first-child, .bookToday > div:first-child, .bestSeller > div:first-child {
            font-size: 40px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            margin: 130px 0 0 80px;
            display: flex;
            font-style: italic;
            letter-spacing: 0;
            color: #000;
        }

        .todayImg {
            width: 450px;
            height: 650px;
            margin-top: 100px;
            box-shadow: 2px 2px 2px 2px;
        }

        .bookToday {
            position: absolute;
            right: 140px;
            display: flex;
        }

        .line, .line2 {
            background-color: gray;
            height: 2px;
            width: 75%;
            position: absolute;
            top: 165px;
            right: 0;
        }

        .line2 {
            left: 0;
        }

        .choiceImg {
            display: flex;
            position: absolute;
            top: 220px;
            left: calc(50% - 1480px / 2);
        }

        .swiper-container {
            width: 1903px;
            height: 680px;
        }

        .choiceImg img {
            width: 250px;
            height: 393px;
            margin: 20px;
            margin: 80px 60px 20px;
        }

        .contents span {
            text-align: center;
            display: block;
        }

        .contents2 {
            position: absolute;
            top: calc(50% - 300px);
            left: calc(50% - 1370px / 2);
            display: flex;
        }

        .contents2 img {
            width: 450px;
        }

        .bookContents {
            width: 800px;
            font-size: 30px;
            margin-left: 200px;
            height: 770px;
            margin-top: 85px;
        }

        .bk_contents {
            overflow: hidden;
            text-overflow: ellipsis;
            word-wrap: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 22;
            -webkit-box-orient: vertical;
            width: 705px;
            font-size: 20px;
        }

        .contents3 img {
            width: 150px;
            height: 220px;
        }

        .container3 {
            height: 1040px;
        }

        .contents3 {
            top: 250px;
            left: calc(50% - 1390px / 2);
            width: 80%;
            height: 100%;
            margin: 0 auto;
        }

        .bsContents {
            text-align: center;
            font-size: 14px;
            display: block;
        }

        .bsBook {
            text-align: center;
            float: left;
            width: 20%;
            margin-top: 80px;
            cursor: pointer;
            height: 305px;
        }

        .contents3::after {
            display: block;
            content: '';
            clear: both;
        }

        .bsNum {
            font-size: 30px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            display: block;
        }

        .todayBook {
            padding: 0;
            margin-bottom: 30px;
            font-size: 30px;
        }

        .container2::after {
            display: block;
            content: '';
            clear: both;
        }

        .swiper-slide {
            flex-shrink: initial;
        }

        .swiper-container-horizontal > .swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction {
            left: -200px;
        }

        .swiper-horizontal > .swiper-pagination-bullets, .swiper-pagination-bullets.swiper-pagination-horizontal, .swiper-pagination-custom, .swiper-pagination-fraction {
            left: -10%;
        }

        .bestImg {
            border: 1px solid gray;
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

        .dome-list *, .foreign-list * {
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

        .search-box {
            width: 100%;
            height: 1280px;
            background-color: black;
            position: absolute;
            z-index: 15;
            opacity: 80%;
            top: 0px;
            right: 0;
            display: flex;
            display: none;
        }

        [name="search"] {
            width: 500px;
            height: 100px;
            position: absolute;
            top: 300px;
            left: calc(50% - 250px);
            opacity: 100%;
            font-size: 30px;
            padding: 15px;
            box-sizing: border-box;
            border-radius: 20px;
        }

        .search-icon {
            font-size: 40px;
            z-index: 20;
            cursor: pointer;
            text-align: center;
            line-height: 50px;
            position: absolute;
            top: 315px;
            left: calc(50% + 185px);
        }

        .x-btn {
            position: absolute;
            top: 25px;
            right: 35px;
        }
    </style>
</head>
<body>
<div class="circle"></div>
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
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=소설/시&country=국내/해외">소설/시</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=에세이&country=국내/해외">에세이</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=인문&country=국내/해외">인문</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=역사&country=국내/해외">역사</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=예술&country=국내/해외">예술</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=종교&country=국내/해외">종교</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=사회&country=국내/해외">사회</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=과학&country=국내/해외">과학</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=자기계발&country=국내/해외">자기계발</a></li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=국어와외국어&country=국내/해외">국어와외국어</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/book/catagory?re_catagory=IT/모바일&country=국내/해외">IT/모바일</a>
            </li>
        </ul>
    </div>
    <div class="subCatagory-list">
        <ul class="foreign-list">
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=문학&country=외국">문학</a></li>
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=소설&country=외국">소설</a></li>
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=경제/경영&country=외국">경제/경영</a></li>
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=인문/사회&country=외국">인문/사회</a></li>
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=예술&country=외국">예술</a></li>
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=컴퓨터&country=외국">컴퓨터</a></li>
            <li><a href="${pageContext.request.contextPath}/book/category?re_category=자연과학&country=외국">자연과학</a></li>
        </ul>
    </div>
</div>
<div class="main" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="1500">
    <img class="bookstore animate__repeat-1	animate__fadeInDown animate__animated"
         src="${pageContext.request.contextPath}/resources/js/BOOK.png" alt="greenbookstore">
    <p class="letter">Books makes you valuable</p>
</div>
<i class="fas fa-bars"></i>
<div class="menu" data-aos="fade-down-left">
    <ul>
        <c:if test="${user == null}">
            <li><a href="${pageContext.request.contextPath}/login">LOGIN</a></li>
            <li><a href="${pageContext.request.contextPath}/member/signup">SIGNUP</a></li>
        </c:if>

        <c:if test="${user != null}">
            <li><a id="logout" href="#">LOGOUT</a></li>
        </c:if>
        <c:if test="${user != null && user.me_grade != 'ADMIN'}">
            <li><a href="${pageContext.request.contextPath}/member/mypage">MYPAGE</a></li>
            <li><a href="${pageContext.request.contextPath}/order/cart">CART</a></li>
        </c:if>

        <c:if test="${user != null && user.me_grade == 'ADMIN'}">
            <li><a href="${pageContext.request.contextPath}/admin/user/publisherlist">MANAGEMENT</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/user/orders">ORDERS</a></li>
        </c:if>
    </ul>
    <i class="fas fa-search sm-search"></i>
</div>
<form method="post" action="${pageContext.request.contextPath}/book/search">
    <div class="search-box bars">
        <i class="fas fa-times x-btn"></i>
        <input type="text" name="search" placeholder="search">
        <button><i class="fas fa-search search-icon"></i></button>
    </div>
</form>
<div class="container" data-aos="fade-up" data-aos-duration="3000">
    <div class="choice">
        <div data-aos="zoom-in-right">Green's Choice</div>
        <div class="line"></div>
    </div>
    <div class="choiceImg">
        <div class="swiper-container mySwiper">
            <div class="swiper-wrapper bookList">
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
</div>
<div class="container2" data-aos="fade-up" data-aos-duration="3000">
    <div class="line2"></div>
    <div class="bookToday">
        <div data-aos="zoom-in-left"> Book Today</div>
    </div>
    <div class="contents2">
    </div>
</div>
<div class="container3" data-aos="fade-up" data-aos-duration="3000">
    <div class="bestSeller">
        <div data-aos="zoom-in-right">The Best Seller 10</div>
        <div class="line"></div>
    </div>
    <div class="contents3">
    </div>
</div>
<script>

    $(document).ready(function () {
        bookChoice();
        bookToday();
        bestSeller();
        logout();
    });

    function logout() {
        $('#logout').click(function () {
            $.ajax({
                    url: "/greenbook/api/logout",
                    type: "GET",
                    success: function (data) {
                        alert('로그아웃되었습니다.')
                        location.href = '/greenbook'
                    },
                    error: function (xhr, status, error) {
                        console.log("AJAX 실패:", error);
                    }
                }
            )
        })
    }


    function bookChoice() {
        $.ajax({
            url: "/greenbook/api/home",
            type: "GET",
            success: function (data) {

                let html = "";

                $.each(data, function (index, book) {

                    html += `
                        <div class="swiper-slide">
                            <a class="contents" href="${pageContext.request.contextPath}/book/details?re_bk_isbn=` + book.bk_isbn + `">
                                <img src="${pageContext.request.contextPath}/img` + book.bk_mainImg + `" alt="bookImg">
                                <span>` + book.bk_title + `</span>
                                <span>` + book.bk_au_writer + ` 저 | ` + book.bk_publish + `</span>
                            </a>
                        </div>`;
                });

                $(".swiper-wrapper.bookList").html(html);

                new Swiper(".mySwiper", {
                    slidesPerView: 4,
                    spaceBetween: 40,
                    pagination: {
                        el: ".swiper-pagination",
                        clickable: true,
                    },
                });


            },
            error: function (xhr, status, error) {
                console.log("AJAX 실패:", error);
            }
        });
    }


    function bookToday() {
        $.ajax({
                url: "/greenbook/api/today",
                type: "GET",
                success: function (data) {

                    console.log(data)
                    let html = `
                        <a href="${pageContext.request.contextPath}/book/details?re_bk_isbn=` + data.bk_isbn + `">
                            <img src="${pageContext.request.contextPath}/img` + data.bk_mainImg + `" alt="todayImg" class="todayImg">
                        </a>
                        <div class="bookContents">
                            <h2 class="todayBook">오늘의 책 ></h2>
                            <div class="bk_contents">
                                ` + data.bk_contents + `
                            </div>
                        </div>`

                    $(".contents2").html(html);

                },
                error: function (xhr, status, error) {
                    console.log("AJAX 실패:", error);
                }
            }
        )
        ;
    }

    function bestSeller() {
        $.ajax({
            url: "/greenbook/api/best",
            type: "GET",
            success: function (data) {

                let html = "";

                $.each(data, function (index, book) {

                    console.log(book)

                    html +=
                        `<div class="bsBook">
                            <a href="${pageContext.request.contextPath}/book/details?re_bk_isbn=` + book.bk_isbn + `>
                                <span class="bsNum">` + (index + 1) + `</span>
                                <img src="${pageContext.request.contextPath}/img` + book.bk_mainImg + `" alt="bestImg"
                                     class="bestImg"/>
                                <span class="bsContents"><span>` + book.bk_title + `</span><br><span>` + book.bk_au_writer + `저 | ` + book.bk_publish + `</span></span>
                            </a>
                        </div>`
                });

                $(".contents3").html(html);


            },
            error: function (xhr, status, error) {
                console.log("AJAX 실패:", error);
            }
        });
    }


    $('.fa-bars').click(function () {
        $('.side-bars').show();
    })
    $('.fa-times').click(function () {
        $('.side-bars').hide();
    })
    $('.domestic').hover(function () {
        $('.foreign-list').hide();
        $('.dome-list').show();
    })
    $('.foreign').hover(function () {
        $('.dome-list').hide();
        $('.foreign-list').show();
    })

    $('.sm-search').click(function () {
        $('.search-box').show();
        $('[name="search"]').val('');
    })
    $('.x-btn').click(function () {
        $('.search-box').hide();
    })

    AOS.init({
        easing: 'ease-out-back',
        duration: 1000
    });

    var prevScrollTop = 0;
    var nowScrollTop = 0;

    function wheelDelta() {
        return prevScrollTop - nowScrollTop > 0 ? 'up' : 'down';
    };
    $(window).on('scroll', function () {
        nowScrollTop = $(this).scrollTop();
        if (wheelDelta() == 'down') {
            $('.bars').fadeOut();
        }
        prevScrollTop = nowScrollTop;
    });
</script>
</body>
</html>