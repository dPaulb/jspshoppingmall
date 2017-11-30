<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: paul
  Date: 2017. 11. 27.
  Time: AM 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script>

    </script>
</head>
<body>
<%
    String loginSessionID = null;
    if(session.getAttribute("loginSessionID") != null){
        loginSessionID = (String) session.getAttribute("loginSessionID");
        PrintWriter writer = response.getWriter();
        writer.write("<script>alert('이미 로그인 하셨으므로 들어올수 없습니다.');history.back();</script>");
    }

%>
<div class="container">
    <div class="jumbotron">
        <h2>ShoppingMall</h2>
    </div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/home">ShoppingMall</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/shopItem?itemCategory=shoes">신발<span class="sr-only">(current)</span></a>
                    </li>
                    <li>
                        <a href="/shopItem?itemCategory=top">상의</a>
                    </li>
                    <li>
                        <a href="/shopItem?itemCategory=bottom">하의</a>
                    </li>
                    <li>
                        <a href="/shopItem?itemCategory=outer">아우터</a>
                    </li>
                    <li>
                        <a href="/shopItem/cart">장바구니</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Link</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">계정<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%
                                if (loginSessionID != null) {


                            %>
                            <li><a href="/accountPage">계정관리</a></li>
                            <li><a href="/logoutAction">로그아웃</a></li>
                            <%
                            } else {
                            %>
                            <li><a href="/joinpage">회원가입</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
                            <%
                                }
                            %>

                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">로그인</h4>
                </div>
                <div class="modal-body">
                    <form name="joinForm" action="/loginAction" method="POST">
                        <div class="form-group">
                            <h2>아이디</h2>
                            <input type="text" id="userIDLogin" class="form-control" name="userID" placeholder="ID"/>
                        </div>
                        <div class="form-group">
                            <h2>비밀번호</h2>
                            <input type="password" id="userPasswordLogin" class="form-control" name="userPassword"
                                   placeholder="Password"/>
                        </div>
                        <input type="submit" class="btn btn-primary" value="로그인">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="container">
    <div class="col-md-2">
    </div>

    <div class="col-md-8">
        <div class="jumbotron">
            <h2>회원가입 양식</h2>
            <form name="joinForm" action="/join/joinAction" method="post">
                <div class="form-group">
                    <h2>아이디</h2>
                    <input id="userID" type="text" class="form-control" name="userID" placeholder="아이디를 입력하세요."/>
                    <span style="margin-top:10px" class="btn btn-primary" onclick="idCheck();">중복 확인</span>
                </div>
                <div class="form-group">
                    <h2>비밀번호</h2>
                    <input id="userPassword1" type="password" class="form-control" name="userPassword1"
                           placeholder="비밀번호를 입력하세요." onkeyup="passwordCheck();"/>
                </div>
                <div class="form-group">
                    <h2>비밀번호확인</h2>
                    <input id="userPassword2" type="password" class="form-control" name="userPassword2"
                           placeholder="비밀번호 확인." onkeyup="passwordCheck();"/>
                    <p id="passwordCheckLabel"></p>
                </div>
                <div class="form-group">
                    <h2>이름</h2>
                    <input id="userName" type="text" class="form-control" name="userName" placeholder="이름"/>
                </div>
                <div class="form-group">
                    <h2>생년월일</h2>
                    <div class="selectContainer">
                        <div class="col-xs-4">
                            <select id="userYear" class="form-control" name="userYear">
                                <%
                                    for (int i = 1920; i <= 2000; i++) {
                                        out.println("<option value=\"" + i + "\">" + i + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-xs-4">
                            <select id="userMonth" class="form-control" name="userMonth">
                                <%
                                    for (int i = 1; i <= 12; i++) {
                                        out.println("<option value=\"" + i + "\">" + i + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="col-xs-4">
                            <select id="userDay" class="form-control" name="userDay">
                                <%
                                    for (int i = 1; i <= 31; i++) {
                                        out.println("<option value=\"" + i + "\">" + i + "</option>");
                                    }
                                %>
                            </select>
                        </div>


                    </div>
                </div>
                <br>
                <div class="form-group">
                    <h2>성별</h2>
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-primary active">
                            <input type="radio" name="userGender" autocomplete="off" value="남자" checked/>남자
                        </label>
                        <label class="btn btn-primary">
                            <input type="radio" name="userGender" autocomplete="off" value="여자"/>여자
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <h2>이메일</h2>
                    <input id="userEmail" type="text" class="form-control" name="userEmail" placeholder="메일"/>
                </div>
                <div class="form-group">
                    <h2>주소</h2>
                    <input id="userAddress" type="text" class="form-control" name="userAddress" placeholder="주소"
                           readonly/>
                </div>

                <div class="form-group">
                    <h2>우편번호</h2>
                    <input id="userPostCode" type="text" class="form-control" name="userPostCode" placeholder="000-000"
                           readonly/>
                    <span style="margin-top:10px" class="btn btn-primary" onclick="setDaumPostcode()">우편번호 찾기</span>
                </div>
                <div class="form-group">
                    <h2>상세주소</h2>
                    <input id="userDetailAddress" type="text" class="form-control" name="userDetailAddress"
                           placeholder="상세주소를 입력하세요."/>
                </div>
                <div class="form-group">
                    <h2>핸드폰 번호</h2>
                    <input id="userPhoneNumber" type="text" class="form-control" name="userPhoneNumber"
                           placeholder="ex)01012345678"/>
                </div>
                <input type="submit" class="btn btn-primary pull-right" value="회원가입">
            </form>
        </div>
    </div>

    <div class="col-md-2">

    </div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

    function checkSpace(str) {
        if (str.search(/\s/) != -1) {
            return true;
        } else {
            return false;
        }
    }

    function checkSpecial(str) {
        var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
        if (special_pattern.test(str) == true) {
            return true;
        } else {
            return false;
        }
    }


    function idCheck() {
        var userID = $('#userID').val();
        if (userID == "") {
            alert("아이디를 입력해주세요");
            $('#userID').focus();
            return false;
        }
        var koreanCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        var upperCheck = /[A-Z]/;
        if (koreanCheck.test(userID)) {
            alert("아이디는 한글을 포함할수 없습니다.");
            return false;
        }
        if(checkSpace(userID)){
            alert("아이디에 공백이 있을수 없습니다.");
            return false;
        }
        if(checkSpecial(userID)){
            alert("아이디에 특수문자가 있을수 없습니다.");
            return false;
        }
        if (upperCheck.test(userID)) {
           alert("아이디는 대문자일수 없습니다.");
           return false;
        }


        var check = {
            data: {
                "userID": userID
            },
            dataType: 'json',
            type: 'POST',
            url: '/join/idcheck',
            cache: false,
            error: function (xhr, textStatus, error) {
                alert(error);
            },
            success: function (data) {
                if (true == data.result) {
                    alert("가입 가능한 아이디입니다.");
                }
                else {
                    if (1 == data.errorReason) {
                        alert("중복된 아이디입니다. 다른것으로 시도해주세요.");
                    }
                    else if (-1 == data.errorReason)
                        alert("오류가 났습니다. 다시 시도해주세요.");
                }
            }

        }
        $.ajax(check);
    }

    function passwordCheck() {
        var userPassword1 = $('#userPassword1').val();
        var userPassword2 = $('#userPassword2').val();

        var check = {
            data: {
                "userPassword1": userPassword1,
                "userPassword2": userPassword2
            },
            dataType: 'json',
            type: 'POST',
            url: '/join/passwordcheck',
            cache: false,
            error: function (xhr, textStatus, error) {
                alert(error);
            },
            success: function (data) {
                if (true == data.result) {
                    $('#passwordCheckLabel').removeClass("text-danger");
                    $('#passwordCheckLabel').addClass("text-primary");
                    $('#passwordCheckLabel').text("두 패스워드가 일치합니다.");
                } else {
                    $('#passwordCheckLabel').removeClass("text-primary");
                    $('#passwordCheckLabel').addClass("text-danger");
                    $('#passwordCheckLabel').text("두 패스워드가 일치하지 않습니다.");
                }
            }

        }
        $.ajax(check);

    }
</script>
<script>
    function setDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if (data.userSelectedType === 'R') {
                    //법정동명이 있을 경우 추가한다.
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('input[name=userPostCode]').val(data.zonecode);
                $('input[name=userAddress]').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('input[name=userDetailAddress]').focus();
            }
        }).open();
    }
</script>
<script>

    function login() {
        var userID = $('#userIDLogin').val();
        var userPassword = $('#userPasswordLogin').val();

        var loginAction = {
            data: {
                "userID": userID,
                "userPassword": userPassword
            },
            dataType: 'json',
            type: 'POST',
            url: '/loginAction',
            cache: false,
            error: function (xhr, textStatus, error) {
                alert(error);
            },
            success: function (data) {
                if (true == data.result) {
                    alert("로그인에 성공하였습니다.");


                } else {
                    if (0 == data.errorReason) {
                        alert("아이디 혹은 패스워드가 입력되지 않았습니다.");
                    }
                    if (1 == data.errorReason) {
                        alert("비밀번호가 틀립니다.");
                    }
                    if (2 == data.errorReason) {
                        alert("존재하지 않는 아이디입니다.");
                    }
                    if (3 == data.errorReason) {
                        alert("알수없는 오류가 발생했습니다.");
                    }
                }
                location.reload();
            }

        }
        $.ajax(loginAction);

    }

</script>
</body>
</html>
