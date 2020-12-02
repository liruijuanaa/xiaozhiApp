<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--    <meta charset="UTF-8"/>--%>
    <!--在手机网站，都需要加上视口约束！！！-->
<%--    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>--%>
    <!--以最新的内核渲染页面-->
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>--%>
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
            $.extend($.validator.messages, {
                required: "<span style='color:red' >这是必填字段</span>",  //再需要验证的input上加入 required属性
                minlength: $.validator.format("<span style='color:red' >最少要输入 4 个字符</span>"),  //再需要验证的input上加入  minlength="4"

            });
            $("#loginButtonId").click(function () {
                //先判断表单验证是否通过
                var isOk = $("#loginForm").valid(); //开启表单验证
                if (isOk) {
                    //获取表单数据
                    //提交表单数据
                    $.ajax({
                        url: "${path}/user/login",
                        dataType: "json",
                        type: "post",
                        data: $("#loginForm").serialize(),
                        success: function (data) {
                            console.log(data);
                            if (data.status == "200") {
                                //登录成功跳转至首页
                                sessionStorage.setItem("id",data.id);
                                location.href = "${path}/main.jsp";
                            } else {
                                //没有登陆成功 展示提示信息
                                $("#msgDiv").html("<span style='color:red'>" + data.msg + "</span>");
                            }
                        }
                    })
                } else {
                    alert("请认证填写登录信息！")
                }
            })
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
                <form class="" role="form" action="" id="loginForm">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="用户名/手机号/邮箱" required name="username">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="密码" required name="password">
                    </div>
                    <button id="loginButtonId" type="button" class="btn btn-primary block full-width m-b">登 录</button>


                    <p class="text-muted text-center"><a href="IdeaProjects/xiaozhiApp/src/main/webapp/login.jsp#">

                    </a>  <a href="${path}/regist.jsp">没有账号？注册一个新账号</a>
                    </p>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>