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

    <title>Memberinfo</title>


    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">


    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <script src="https://kit.fontawesome.com/be5943d19e.js"
            crossorigin="anonymous"></script>


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js">
    </script>


    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js">
    </script>


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

            background-size: 200%;
        }


        .container {
            width: 70%;
            margin: 120px auto;
            position: relative;
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


        .fa-bars {
            margin-right: 15px;
            font-size: 25px;
            cursor: pointer;
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
            border-right: 1px solid black;
            text-align: center;
            float: left;
            margin-top: 40px;
        }


        .nav a {
            color: black;
        }


        .nav li:last-child {
            border: none;
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
            color: black;
            text-decoration: none;
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


        .container {
            margin-top: 120px;
            overflow: hidden;
        }


        .side-bars {
            width: 400px;
            height: 1280px;
            background-color: black;
            position: absolute;
            z-index: 10;
            opacity: 80%;
            display: none;
            top: 0px;
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
            margin-bottom: 25px;
        }


        .address .form-control {
            margin-bottom: 5px;
        }


        #jumin1,
        #jumin2 {
            display: inline;
        }


        .birth .form-control {
            display: inline;
        }


        .error {
            color: red;
        }


        .address-box,
        .birth-box {
            display: none;
        }


        .box1,
        .box2 {
            width: 75%;
            margin: 0 auto;
        }


        .box1 {
            margin-top: 70px;
        }


        .btn-info {
            width: 75%;
            margin-left:
                    calc(50% - 75% / 2);
        }


        .current {
            font-weight: bold;
        }

    </style>

</head>


<body>


<!-- =============================
     사이드 메뉴
     ============================= -->

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



<!-- =============================
     상단 메뉴
     ============================= -->

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



<!-- =============================
     회원정보 폼
     ============================= -->

<form class="container"
      id="memberForm">


    <div class="mypage">
        MyPage
    </div>


    <ul class="nav">

        <li>
            <a href="<%=request.getContextPath()%>/mypage">
                주문내역
            </a>
        </li>


        <li class="point">
            <a href="<%=request.getContextPath()%>/greenpoint">
                그린포인트
            </a>
        </li>


        <li class="info">

            <a href="<%=request.getContextPath()%>/memberinfo"
               class="current">

                회원정보

            </a>

        </li>


        <li class="out">

            <a href="<%=request.getContextPath()%>/memberout">
                회원탈퇴
            </a>

        </li>

    </ul>



    <!-- =============================
         기본정보
         ============================= -->

    <div class="box1">


        <div class="form-group">

            <label>
                아이디
            </label>

            <input type="text"
                   class="form-control"
                   placeholder="아이디"
                   id="id"
                   name="me_id"
                   readonly>

        </div>



        <div class="form-group">

            <label>
                비밀번호
            </label>

            <input type="password"
                   class="form-control"
                   placeholder="비밀번호"
                   id="pw"
                   name="me_password">

        </div>



        <div class="form-group">

            <label>
                비밀번호 재확인
            </label>

            <input type="password"
                   class="form-control"
                   placeholder="비밀번호"
                   id="pw2"
                   name="me_password2">

        </div>



        <div class="form-group">

            <label>
                이름
            </label>

            <input type="text"
                   class="form-control"
                   placeholder="이름"
                   id="name"
                   name="me_name"
                   readonly>

        </div>



        <div class="form-group">

            <label>
                닉네임
            </label>

            <input type="text"
                   class="form-control"
                   placeholder="닉네임"
                   id="nickname"
                   name="me_nickname">

        </div>


    </div>



    <!-- =============================
         추가정보
         ============================= -->

    <div class="box2">


        <!-- 주소 -->

        <div class="form-group address">

            <label>
                주소
            </label>

            <br>


            도로명

            <input type="text"
                   class="form-control"
                   id="currentAddress"
                   readonly>


            지번

            <input type="text"
                   class="form-control"
                   id="currentJAddress"
                   readonly>


            <input class="form-control address-mod-btn"
                   type="button"
                   value="수정">

            <br>



            <div class="address-box">


                <input class="form-control"
                       type="text"
                       id="sample4_postcode"
                       placeholder="우편번호">


                <input class="form-control"
                       type="button"
                       onclick="sample4_execDaumPostcode()"
                       value="우편번호 찾기">

                <br>


                <input class="form-control"
                       type="text"
                       id="sample4_roadAddress"
                       placeholder="도로명주소">


                <input class="form-control"
                       type="text"
                       id="sample4_jibunAddress"
                       placeholder="지번주소">


                <span class="form-control"
                      id="guide"
                      style="color:#999; display:none;">
                </span>


                <input class="form-control"
                       type="text"
                       id="sample4_detailAddress"
                       placeholder="상세주소">


                <input class="form-control"
                       type="text"
                       id="sample4_extraAddress"
                       placeholder="참고항목">


            </div>


            <!-- 서버로 보낼 실제 주소 -->

            <input type="hidden"
                   id="memberAddress"
                   name="me_address">


            <input type="hidden"
                   id="memberJAddress"
                   name="me_jAddress">


        </div>



        <!-- 전화번호 -->

        <div class="form-group">

            <label>
                전화번호
            </label>

            <input type="text"
                   class="form-control"
                   placeholder="전화번호"
                   id="phone"
                   name="me_phone">

        </div>



        <!-- 성별 -->

        <div class="form-group">

            <label>
                성별
            </label>


            <select class="form-control"
                    name="me_gender"
                    id="gender">


                <option value="">
                    성별
                </option>


                <option value="M">
                    남성
                </option>


                <option value="F">
                    여성
                </option>


            </select>

        </div>



        <!-- 생년월일 -->

        <div class="form-group birth">

            <label>
                생년월일
            </label>

            <br>


            <input type="text"
                   class="form-control mb-2"
                   name="me_birth"
                   id="birth"
                   readonly>


            <input class="form-control mb-2 birth-mod-btn"
                   type="button"
                   value="수정">

            <br>


            <div class="birth-box">


                <input class="form-control col-5"
                       type="text"
                       id="birthYear"
                       placeholder="년(4자)"
                       maxlength="4">


                <select class="form-control col-2"
                        id="birthMonth">


                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>


                </select>


                <input class="form-control col-4"
                       type="text"
                       id="birthDay"
                       placeholder="일"
                       maxlength="2">


            </div>

        </div>



        <!-- 이메일 -->

        <div class="form-group">

            <label>
                이메일
            </label>

            <input type="text"
                   class="form-control"
                   placeholder="이메일"
                   id="email"
                   name="me_email">

        </div>


    </div>



    <button type="submit"
            class="btn btn-info col-12">

        회원정보수정

    </button>


</form>



<script>

    const contextPath =
        '<%=request.getContextPath()%>';



    /* ============================================
       회원정보 조회
       GET /api/memberinfo
       ============================================ */

    function loadMemberInfo() {


        $.ajax({


            url:
                contextPath +
                '/api/memberinfo',


            type:
                'GET',


            success:
                function(user) {


                    console.log(
                        '회원정보 =',
                        user
                    );


                    $('#id')
                        .val(
                            user.me_id || ''
                        );


                    $('#name')
                        .val(
                            user.me_name || ''
                        );


                    $('#nickname')
                        .val(
                            user.me_nickname || ''
                        );


                    $('#phone')
                        .val(
                            user.me_phone || ''
                        );


                    $('#gender')
                        .val(
                            user.me_gender || ''
                        );


                    $('#birth')
                        .val(
                            user.me_birth || ''
                        );


                    $('#email')
                        .val(
                            user.me_email || ''
                        );


                    /* 현재 주소 화면 표시 */

                    $('#currentAddress')
                        .val(
                            user.me_address || ''
                        );


                    $('#currentJAddress')
                        .val(
                            user.me_jAddress || ''
                        );


                    /* 실제 POST 전송용 */

                    $('#memberAddress')
                        .val(
                            user.me_address || ''
                        );


                    $('#memberJAddress')
                        .val(
                            user.me_jAddress || ''
                        );


                },


            error:
                function(error) {


                    console.error(
                        '회원정보 조회 실패 =',
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
                        '회원정보를 불러오지 못했습니다.'
                    );


                }


        });


    }



    /* ============================================
       다음 주소검색
       ============================================ */

    function sample4_execDaumPostcode() {


        new daum.Postcode({


            oncomplete:
                function(data) {


                    var roadAddr =
                        data.roadAddress;


                    var extraRoadAddr =
                        '';



                    if (
                        data.bname !== '' &&
                        /[동|로|가]$/g.test(
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



                    document
                        .getElementById(
                            'sample4_postcode'
                        )
                        .value =
                            data.zonecode;



                    document
                        .getElementById(
                            'sample4_roadAddress'
                        )
                        .value =
                            roadAddr;



                    document
                        .getElementById(
                            'sample4_jibunAddress'
                        )
                        .value =
                            data.jibunAddress;



                    if (
                        roadAddr !== ''
                    ) {


                        document
                            .getElementById(
                                'sample4_extraAddress'
                            )
                            .value =
                                extraRoadAddr;


                    } else {


                        document
                            .getElementById(
                                'sample4_extraAddress'
                            )
                            .value =
                                '';


                    }



                    var guideTextBox =
                        document
                            .getElementById(
                                'guide'
                            );



                    if (
                        data.autoRoadAddress
                    ) {


                        var expRoadAddr =

                            data.autoRoadAddress +
                            extraRoadAddr;


                        guideTextBox.innerHTML =

                            '(예상 도로명 주소 : ' +
                            expRoadAddr +
                            ')';


                        guideTextBox.style.display =
                            'block';



                    } else if (
                        data.autoJibunAddress
                    ) {


                        var expJibunAddr =
                            data.autoJibunAddress;


                        guideTextBox.innerHTML =

                            '(예상 지번 주소 : ' +
                            expJibunAddr +
                            ')';


                        guideTextBox.style.display =
                            'block';



                    } else {


                        guideTextBox.innerHTML =
                            '';


                        guideTextBox.style.display =
                            'none';


                    }



                    makeAddress();


                }


        }).open();


    }



    /* ============================================
       주소 문자열 생성
       ============================================ */

    function makeAddress() {


        var sp =
            $('#sample4_postcode')
                .val() || '';


        var road =
            $('#sample4_roadAddress')
                .val() || '';


        var jibun =
            $('#sample4_jibunAddress')
                .val() || '';


        var detail =
            $('#sample4_detailAddress')
                .val() || '';


        var extra =
            $('#sample4_extraAddress')
                .val() || '';



        var address =

            sp +
            ', ' +
            road +
            ' ' +
            detail +
            ' ' +
            extra;



        var jAddress =

            sp +
            ', ' +
            jibun +
            ' ' +
            detail +
            ' ' +
            extra;



        $('#memberAddress')
            .val(
                address.trim()
            );


        $('#memberJAddress')
            .val(
                jAddress.trim()
            );


    }



    /* ============================================
       페이지 준비
       ============================================ */

    $(function() {


        /* 회원정보 가져오기 */

        loadMemberInfo();



        /* 사이드바 */

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



        /* 스크롤 */

        var prevScrollTop =
            0;


        var nowScrollTop =
            0;



        function wheelDelta() {


            return (

                prevScrollTop -
                nowScrollTop >
                0

                    ? 'up'

                    : 'down'

            );


        }



        $(window)
            .on(
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



        /* 주소 수정 버튼 */

        $('.address-mod-btn')
            .click(
                function() {


                    $('.address-box')
                        .show();


                }
            );



        /* 생년월일 수정 버튼 */

        $('.birth-mod-btn')
            .click(
                function() {


                    $('.birth-box')
                        .show();


                }
            );



        /* 상세주소 변경 시 다시 계산 */

        $('#sample4_detailAddress, #sample4_extraAddress')
            .on(
                'change',
                function() {


                    makeAddress();


                }
            );



        /* ============================================
           validator
           ============================================ */

        $('#memberForm')
            .validate({


                rules: {


                    me_password: {


                        required:
                            false,


                        regex:
                            /^[a-z0-9!@#]{8,16}$/i


                    },


                    me_password2: {


                        required:
                            false,


                        equalTo:
                            '#pw'


                    },


                    me_name: {


                        required:
                            false


                    },


                    me_nickname: {


                        required:
                            false


                    },


                    me_gender: {


                        required:
                            false


                    },


                    me_phone: {


                        required:
                            false


                    },


                    me_birth: {


                        required:
                            false


                    },


                    me_email: {


                        required:
                            false,


                        email:
                            true


                    }


                },



                messages: {


                    me_password: {


                        regex:
                            '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'


                    },


                    me_password2: {


                        equalTo:
                            '비밀번호와 일치하지 않습니다.'


                    },


                    me_email: {


                        email:
                            '메일규칙에 어긋납니다.'


                    }


                },



                /* ============================================
                   회원정보 수정
                   POST /api/memberinfo
                   ============================================ */

                submitHandler:
                    function(form) {


                        /* 생년월일 수정한 경우 */

                        var year =
                            $('#birthYear')
                                .val();


                        var month =
                            $('#birthMonth')
                                .val();


                        var day =
                            $('#birthDay')
                                .val();



                        if (
                            year &&
                            month &&
                            day
                        ) {


                            var birth =

                                year +
                                '년' +
                                month +
                                '월' +
                                day +
                                '일';



                            $('#birth')
                                .val(
                                    birth
                                );


                        }



                        /* 주소를 새로 입력한 경우 */

                        if (
                            $('#sample4_roadAddress')
                                .val()
                        ) {


                            makeAddress();


                        }



                        var data = {


                            me_id:
                                $('#id')
                                    .val(),


                            me_password:
                                $('#pw')
                                    .val(),


                            me_name:
                                $('#name')
                                    .val(),


                            me_nickname:
                                $('#nickname')
                                    .val(),


                            me_address:
                                $('#memberAddress')
                                    .val(),


                            me_jAddress:
                                $('#memberJAddress')
                                    .val(),


                            me_phone:
                                $('#phone')
                                    .val(),


                            me_gender:
                                $('#gender')
                                    .val(),


                            me_birth:
                                $('#birth')
                                    .val(),


                            me_email:
                                $('#email')
                                    .val()


                        };



                        console.log(
                            '회원 수정 data =',
                            data
                        );



                        $.ajax({


                            url:
                                contextPath +
                                '/api/memberinfo',


                            type:
                                'POST',


                            data:
                                JSON.stringify(
                                    data
                                ),


                            contentType:
                                'application/json; charset=UTF-8',



                            success:
                                function(result) {


                                    console.log(
                                        '수정 결과 =',
                                        result
                                    );



                                    if (
                                        result ===
                                        'UPDATE_OK'
                                    ) {


                                        alert(
                                            '회원정보가 수정되었습니다.'
                                        );



                                        /* 수정된 정보 다시 조회 */

                                        loadMemberInfo();



                                        /* 비밀번호 입력칸 초기화 */

                                        $('#pw')
                                            .val('');


                                        $('#pw2')
                                            .val('');


                                        /* 주소 수정창 닫기 */

                                        $('.address-box')
                                            .hide();


                                        $('.birth-box')
                                            .hide();


                                    }


                                },



                            error:
                                function(error) {


                                    console.error(
                                        '수정 실패 =',
                                        error
                                    );



                                    if (
                                        error.status ===
                                        401
                                    ) {


                                        alert(
                                            '로그인이 필요합니다.'
                                        );


                                        return;


                                    }



                                    if (
                                        error.status ===
                                        403
                                    ) {


                                        alert(
                                            '잘못된 회원정보입니다.'
                                        );


                                        return;


                                    }



                                    alert(
                                        '회원정보 수정에 실패했습니다.'
                                    );


                                }


                        });



                        return false;


                    }


            });


    });



    /* ============================================
       정규식 validator
       ============================================ */

    $.validator.addMethod(


        'regex',


        function(
            value,
            element,
            regexp
        ) {


            var re =
                new RegExp(
                    regexp
                );


            return (

                this.optional(
                    element
                ) ||

                re.test(
                    value
                )

            );


        },


        'Please check your input.'


    );


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
