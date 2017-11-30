<%@ page import="shoppingmall.Item.ItemDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="shoppingmall.Item.ItemDTO" %><%--
  Created by IntelliJ IDEA.
  User: paul
  Date: 2017. 11. 28.
  Time: PM 11:53
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
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/admin/adminPage">AdminPage</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">회원목록<span class="sr-only">(current)</span></a></li>
                    <li><a href="#">관리자 추가</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">상품 등록 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/uploadItem?itemCategory=top">상의</a></li>
                            <li><a href="/admin/uploadItem?itemCategory=bottom">하의</a></li>
                            <li><a href="/admin/uploadItem?itemCategory=outer">아우터</a></li>
                            <li><a href="/admin/uploadItem?itemCategory=shoes">신발</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">상품목록 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/itemList?itemCategory=top">상의</a></li>
                            <li><a href="/admin/itemList?itemCategory=bottom">하의</a></li>
                            <li><a href="/admin/itemList?itemCategory=outer">아우터</a></li>
                            <li><a href="/admin/itemList?itemCategory=shoes">신발</a></li>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">관리자 계정 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/adminLogoutAction">로그아웃</a></li>
                            <li><a href="#">관리자 비밀번호 변경</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <table class="table table-bordered table-hovered">
            <tr>
                <th>상품 번호</th>
                <th>섬네일</th>
                <th>상품 이름</th>
                <th>상품 가격</th>
            </tr>
            <%

                String itemCategory = request.getParameter("itemCategory");
                ItemDAO itemDAO = new ItemDAO();
                ArrayList<ItemDTO> itemList;

                itemList = itemDAO.getItemList(itemCategory);
                for (int i = 0; i < itemList.size(); i++) {
            %>
            <tr>
                <td class="col-sm-3"><%=itemList.get(i).getItemNumber()%>
                </td>
                <td class="col-sm-3">
                    <img style="width:100%;
    height: 130px;" src="<%=itemList.get(i).getItemThumbnail()%>"/>
                </td>
                <td class="col-sm-3"><%=itemList.get(i).getItemName()%>
                </td>
                <td class="col-sm-3"><%=itemList.get(i).getItemPrice()%>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <div class="col-md-2"></div>

</div>
</body>
</html>
