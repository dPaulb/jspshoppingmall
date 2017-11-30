<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: paul
  Date: 2017. 11. 28.
  Time: PM 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    String adminLoginSession = null;
    if(session.getAttribute("adminLoginSession") != null){
        PrintWriter writer = response.getWriter();
        writer.write("<script>alert('이미 로그인 되어있습니다.');history.back();</script>");
    }
%>
    <div class="container">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="jumbotron">
                <h1>쇼핑몰 관리자 페이지</h1>
            </div>
            <form name="adminForm" action="/admin/adminLoginAction" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control" name="adminID" placeholder="관리자 아이디를 입력하세요."/>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="adminPassword" placeholder="관리자 비밀번호를 입력하세요."/>
                </div>
                <input type="submit" class="btn btn-primary" value="로그인"/>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</body>
</html>
