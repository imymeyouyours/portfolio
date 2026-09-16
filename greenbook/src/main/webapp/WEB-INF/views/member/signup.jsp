<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Signup</title>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/css/common.css">

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js">
    </script>

    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js">
    </script>

    <style>

        body {
            background-image:
                    url(<%=request.getContextPath()%>/resources/js/whitewater.jpg);
            background-size: 300%;
        }

        .container {
            padding: 30px;
            margin: 120px auto;
            width: 700px;
        }

        h1 {
            font-size: 40px;
            text-align: center;
            font-weight: bold;
            font-style: italic;
            letter-spacing: 0;
            color: #000;
            margin-bottom: 40px;
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

    </style>

</head>

<body>


<form class="container" id="signupForm">

    <div class="box1">

        <h1>SignUp</h1>


        <!-- 아이디 -->

        <div class="form-group">

            <label>아이디</label>

            <input type="text"
                   class="form-control"
                   placeholder="아이디"
                   id="id"
                   name="me_id">

        </div>


        <button type="button"
                class="id-dup-btn mb-3 col-12 btn btn-outline-secondary">

            아이디 중복 확인

        </button>


        <!-- 비밀번호 -->

        <div class="form-group">

            <label>비밀번호</label>

            <input type="password"
                   class="form-control"
                   placeholder="비밀번호"
                   id="pw"
                   name="me_password">

        </div>


        <!-- 비밀번호 확인 -->

        <div class="form-group">

            <label>비밀번호 재확인</label>

            <input type="password"
                   class="form-control"
                   placeholder="비밀번호"
                   id="pw2"
                   name="me_password2">

        </div>


        <!-- 이름 -->

        <div class="form-group">

            <label>이름</label>

            <input type="text"
                   class="form-control"
                   placeholder="이름"
                   id="name"
                   name="me_name">

        </div>


        <!-- 닉네임 -->

        <div class="form-group">

            <label>닉네임</label>

            <input type="text"
                   class="form-control"
                   placeholder="닉네임"
                   id="nickname"
                   name="me_nickname">

        </div>

    </div>


    <div class="box2">


        <!-- 주소 -->

        <div class="form-group address">

            <label>주소</label>

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


        <!-- 전화번호 -->

        <div class="form-group">

            <label>전화번호</label>

            <input type="text"
                   class="form-control"
                   placeholder="전화번호"
                   id="phone"
                   name="me_phone">

        </div>


        <!-- 성별 -->

        <div class="form-group">

            <label>성별</label>

            <select class="form-control"
                    name="me_gender"
                    id="gender">

                <option value="">성별</option>
                <option value="M">남성</option>
                <option value="F">여성</option>

            </select>

        </div>


        <!-- 생년월일 -->

        <div class="form-group birth">

            <label>생년월일</label>

            <br>

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


        <!-- 주민번호 -->

        <div class="form-group">

            <label>주민번호</label>

            <br>

            <input type="text"
                   placeholder="주민번호"
                   id="jumin1"
                   class="form-control col-5"
                   maxlength="6">

            -

            <input type="password"
                   placeholder="주민번호"
                   id="jumin2"
                   class="form-control col-5"
                   maxlength="7">

        </div>


        <!-- 이메일 -->

        <div class="form-group">

            <label>이메일</label>

            <input type="text"
                   class="form-control"
                   placeholder="이메일"
                   id="email"
                   name="me_email">

        </div>

    </div>


    <button type="submit"
            class="btn btn-info col-12">

        회원가입

    </button>

</form>


<!-- 다음 주소 API -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>


<script>

    var contextPath = '<%=request.getContextPath()%>';

    // 아이디 중복확인 여부
    var idChecked = false;


    /* =====================================================
       다음 주소 검색
    ===================================================== */

    function sample4_execDaumPostcode() {

        new daum.Postcode({

            oncomplete: function(data) {

                var roadAddr = data.roadAddress;

                var extraRoadAddr = '';


                if (data.bname !== '' &&
                    /[동|로|가]$/g.test(data.bname)) {

                    extraRoadAddr += data.bname;
                }


                if (data.buildingName !== '' &&
                    data.apartment === 'Y') {

                    extraRoadAddr +=
                        (extraRoadAddr !== ''
                            ? ', ' + data.buildingName
                            : data.buildingName);
                }


                if (extraRoadAddr !== '') {

                    extraRoadAddr =
                        ' (' + extraRoadAddr + ')';
                }


                $('#sample4_postcode')
                    .val(data.zonecode);

                $('#sample4_roadAddress')
                    .val(roadAddr);

                $('#sample4_jibunAddress')
                    .val(data.jibunAddress);


                if (roadAddr !== '') {

                    $('#sample4_extraAddress')
                        .val(extraRoadAddr);

                } else {

                    $('#sample4_extraAddress')
                        .val('');
                }


                var guideTextBox =
                    document.getElementById('guide');


                if (data.autoRoadAddress) {

                    var expRoadAddr =
                        data.autoRoadAddress +
                        extraRoadAddr;

                    guideTextBox.innerHTML =
                        '(예상 도로명 주소 : ' +
                        expRoadAddr +
                        ')';

                    guideTextBox.style.display =
                        'block';


                } else if (data.autoJibunAddress) {

                    var expJibunAddr =
                        data.autoJibunAddress;

                    guideTextBox.innerHTML =
                        '(예상 지번 주소 : ' +
                        expJibunAddr +
                        ')';

                    guideTextBox.style.display =
                        'block';


                } else {

                    guideTextBox.innerHTML = '';

                    guideTextBox.style.display =
                        'none';
                }
            }

        }).open();
    }


    /* =====================================================
       jQuery Validate 정규식 추가
    ===================================================== */

    $.validator.addMethod(

        "regex",

        function(value, element, regexp) {

            var re = new RegExp(regexp);

            return this.optional(element) ||
                   re.test(value);
        },

        "Please check your input."

    );


    $(function() {


        /* =================================================
           아이디를 변경하면 중복확인 다시 해야 함
        ================================================= */

        $('#id').on('input', function() {

            idChecked = false;

        });


        /* =================================================
           아이디 중복 확인
        ================================================= */

        $('.id-dup-btn').click(function() {

            var id = $('#id').val();

            var idRegex =
                /^[a-z0-9_-]{5,20}$/;


            if (!idRegex.test(id)) {

                alert(
                    '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'
                );

                idChecked = false;

                return;
            }


            $.ajax({

                type: 'POST',

                url:
                    contextPath +
                    '/api/id/check',

                data: {
                    id: id
                },


                success: function(res) {

                    console.log(
                        '아이디 중복확인:',
                        res
                    );


                    if (res === 'POSSIBLE') {

                        alert(
                            '가입 가능한 아이디입니다.'
                        );

                        idChecked = true;


                    } else if (
                        res === 'DUPLICATE'
                    ) {

                        alert(
                            '이미 가입된 아이디입니다.'
                        );

                        idChecked = false;


                    } else {

                        alert(
                            '아이디 확인 중 오류가 발생했습니다.'
                        );

                        idChecked = false;
                    }
                },


                error: function(xhr) {

                    console.log(
                        '아이디 확인 오류:',
                        xhr.responseText
                    );


                    idChecked = false;


                    if (
                        xhr.responseText ===
                        'INVALID'
                    ) {

                        alert(
                            '올바른 아이디를 입력하세요.'
                        );

                    } else {

                        alert(
                            '아이디 중복 확인 중 오류가 발생했습니다.'
                        );
                    }
                }

            });

        });


        /* =================================================
           회원가입 Validation
        ================================================= */

        $('#signupForm').validate({

            rules: {

                me_id: {

                    required: true,

                    regex:
                        /^[a-z0-9_-]{5,20}$/
                },


                me_password: {

                    required: true,

                    regex:
                        /^[a-z0-9!@#]{8,16}$/i
                },


                me_password2: {

                    required: true,

                    equalTo: '#pw'
                },


                me_name: {

                    required: true
                },


                me_nickname: {

                    required: true
                },


                me_gender: {

                    required: true
                },


                me_phone: {

                    required: true
                },


                me_email: {

                    required: true,

                    email: true
                }

            },


            messages: {

                me_id: {

                    required:
                        '필수 정보입니다.',

                    regex:
                        '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'
                },


                me_password: {

                    required:
                        '필수 정보입니다.',

                    regex:
                        '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'
                },


                me_password2: {

                    required:
                        '필수 정보입니다.',

                    equalTo:
                        '비밀번호와 일치하지 않습니다.'
                },


                me_name: {

                    required:
                        '필수 정보입니다.'
                },


                me_nickname: {

                    required:
                        '필수 정보입니다.'
                },


                me_gender: {

                    required:
                        '필수 정보입니다.'
                },


                me_phone: {

                    required:
                        '필수 정보입니다.'
                },


                me_email: {

                    required:
                        '필수 정보입니다.',

                    email:
                        '메일규칙에 어긋납니다.'
                }

            },


            /* =================================================
               Validation 성공
            ================================================= */

            submitHandler: function(form) {


                /* 아이디 중복 확인 여부 */

                if (!idChecked) {

                    alert(
                        '아이디 중복 확인을 해주세요.'
                    );

                    return false;
                }


                /* =============================================
                   주소 생성
                ============================================= */

                var sp =
                    $('#sample4_postcode')
                        .val();

                var road =
                    $('#sample4_roadAddress')
                        .val();

                var jibun =
                    $('#sample4_jibunAddress')
                        .val();

                var detail =
                    $('#sample4_detailAddress')
                        .val();

                var extra =
                    $('#sample4_extraAddress')
                        .val();


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


                /* =============================================
                   생년월일 생성
                ============================================= */

                var year =
                    $('#birthYear').val();

                var month =
                    $('#birthMonth').val();

                var day =
                    $('#birthDay').val();


                var birth =
                    year +
                    '년' +
                    month +
                    '월' +
                    day +
                    '일';


                /* =============================================
                   주민번호 생성
                ============================================= */

                var jumin1 =
                    $('#jumin1').val();

                var jumin2 =
                    $('#jumin2').val();


                var residentNum =
                    jumin1 + jumin2;


                /* =============================================
                   서버로 보낼 MemberDto 데이터
                ============================================= */

                var member = {

                    me_id:
                        $('#id').val(),

                    me_password:
                        $('#pw').val(),

                    me_name:
                        $('#name').val(),

                    me_nickname:
                        $('#nickname').val(),

                    me_address:
                        address,

                    me_jAddress:
                        jAddress,

                    me_phone:
                        $('#phone').val(),

                    me_gender:
                        $('#gender').val(),

                    me_birth:
                        birth,

                    me_resident_num:
                        residentNum,

                    me_email:
                        $('#email').val()

                };


                console.log(
                    '회원가입 데이터:',
                    member
                );


                /* =============================================
                   AJAX 회원가입
                ============================================= */

                $.ajax({

                    type: 'POST',

                    url:
                        contextPath +
                        '/api/signup',

                    contentType:
                        'application/json; charset=UTF-8',

                    data:
                        JSON.stringify(member),


                    success: function(res) {

                        console.log(
                            '회원가입 결과:',
                            res
                        );


                        alert(
                            '회원가입이 완료되었습니다.'
                        );


                        location.href =
                            contextPath +
                            '/login';
                    },


                    error: function(xhr) {

                        console.log(
                            '회원가입 오류:',
                            xhr.status,
                            xhr.responseText
                        );


                        if (
                            xhr.responseText ===
                            'DUPLICATE'
                        ) {

                            alert(
                                '이미 가입된 아이디입니다.'
                            );

                            idChecked = false;


                        } else if (
                            xhr.responseText ===
                            'INVALID'
                        ) {

                            alert(
                                '올바르지 않은 회원정보입니다.'
                            );


                        } else {

                            alert(
                                '회원가입 중 오류가 발생했습니다.'
                            );
                        }
                    }

                });


                return false;
            }

        });

    });

</script>


</body>

</html>