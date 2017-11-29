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
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <table class="table table-bordered table-hovered">
            <tr>
                <th>상품 번호</th>
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
                <td><%=itemList.get(i).getItemNumber()%></td>
                <td><%=itemList.get(i).getItemName()%></td>
                <td><%=itemList.get(i).getItemPrice()%></td>
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
