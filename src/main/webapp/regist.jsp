<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <!--引入css文件-->
    <script src="${path}/style/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/style/js/jquery.backstretch.min.js"></script>
    <script src="${path}/style/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/style/css/bootstrap.css"/>

    <script src="${path}/style/js/bootstrap.min.js"></script>
    <script>
        $(function (){
            //表单验证
            $("#loginForm").validate({
                rules:{
                    username:{required:true},
                    password:{required: true,minlength:6},
                    repassword:{required:true,minlength:6,equalTo:"#pwd"}
                },
                message:{
                    username: {required:"请填写用户名"},
                    password: {required:"请输入密码",minlength:"密码最少为6位"},
                    repassword: {required:"请输入密码",minlength:"密码最少为6位",equalTo:"两次密码必须一样",}
                }

            });
            <%--$("#registButtonId").click(function () {--%>
            <%--    //先判断表单验证是否通过--%>
            <%--    // var isOk = $("#loginForm").valid(); //开启表单验证--%>
            <%--    // if (isOk) {--%>
            <%--        //获取表单数据--%>
            <%--        //提交表单数据--%>
            <%--        $.ajax({--%>
            <%--            url: "${path}/user/addUser",--%>
            <%--            dataType: "text",--%>
            <%--            type: "post",--%>
            <%--            data: {username:username,password:pwd,file:photo},--%>
            <%--            success: function (data) {--%>
            <%--                &lt;%&ndash;location.href="${path}/login.jsp"&ndash;%&gt;--%>
            <%--            }--%>
            <%--        })--%>
            <%--    // } else {--%>
            <%--    //     alert("请认证填写登录信息！")--%>
            <%--    // }--%>
            <%--})--%>
        })
    </script>
</head>
<body class="container">
<div class="col-md-4 col-md-offset-4">
    <div class="panel" style="width: 300px;">
        <div class="middle-box text-center loginscreen  animated fadeInDown">
            <div>
                <div>

                    <h1 class="logo-name"><img src="${path}/style/img/logo.png"></h1>

                </div>
                <h3>欢迎使用 小知</h3>
                <span id="msgDiv"></span>
                <form role="form" id="loginForm" action="${path}/user/addUser" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="用户名/手机号/邮箱" name="username">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="密码" name="password">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="确认密码" name="repassword" id="pwd">
                    </div>

                    <div class="form-group">
                        <small>上传头像</small>
                        <input type="file" name="file"> <br>
                    </div>

                    <button id="registButtonId" type="submit" class="btn btn-primary block full-width m-b">注册</button>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>