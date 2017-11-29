<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: paul
  Date: 2017. 11. 28.
  Time: PM 10:13
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
<%
    String adminLoginSession = null;
    if(session.getAttribute("adminLoginSession") != null){
        adminLoginSession = (String) session.getAttribute("adminLoginSession");
    }
    else{
        PrintWriter writer = response.getWriter();
        writer.write("<script>alert('오직 관리자만 입장할수 있습니다.');location.href='/admin/loginPage';</script>");
    }
%>
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <form name="uploadItemForm" action="/admin/uploadItemDo" method="post" enctype="multipart/form-data">
            <input type="hidden" name="itemCategory" value="<%=request.getParameter("itemCategory")%>"/>
            <div class="form-group">
                <input type="text" class="form-control" name="itemName" placeholder="상품 이름">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="itemPrice" placeholder="상품 가격">
            </div>
            <div class="form-group">
                <input type="file" class="form-control" name="itemThumbnail" placeholder="상품 섬네일">
            </div>
            <textarea id="summernote" name="itemDescription"></textarea>
            <input type="submit" class="btn btn-primary" value="상품 올리기"/>
        </form>
    </div>
    <div class="col-md-2"></div>
</div>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
<!-- 자바스크립트관련 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
<!-- 한글관련 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/lang/summernote-ko-KR.min.js"></script>
<script>
    $(document).ready(function(){

        $('#summernote').summernote({
            lang: 'ko-KR',
            height: 300,
            callbacks : {
                onImageUpload: function(files) {
//                    sendFile(files[0]);
                    for(var i = 0;i<files.length;i++){
                        sendFile(files[i]);
                    }
                }
            }
        });

        function sendFile(file, editor, welEditable) {
            data = new FormData();
            data.append("thumbnail", file);
            $.ajax({
                data: data,
                type: "POST",
                url: '/admin/uploadItemAction',
                cache: false,
                contentType: false,
                processData: false,
                success: function(url) {
                    $('#summernote').summernote("insertImage", url);
                }
            });
        }

    });


</script>

</body>
</html>
