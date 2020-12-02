<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8"/>
    <!--在手机网站，都需要加上视口约束！！！-->
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <!--以最新的内核渲染页面-->
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>回答问题</title>
    <!--引入css文件-->

    <script src="${path}/style/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/style/js/jquery.backstretch.min.js"></script>
    <script src="${path}/style/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/style/css/bootstrap.css"/>

    <script src="${path}/style/js/bootstrap.min.js"></script>
    <script>
        $(function (){
            var user_id = sessionStorage.getItem("id");
            var fatherName = window.location.href.split("=")[1];

            // alert("主题名"+fatherName);
            // alert("user"+user_id);
            var username = sessionStorage.getItem("uname");

            var $za="<span style=\"color: lightgray\" class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span><em> > </em><a href=\"${path}/homePage.jsp?username="+username+"\">论坛首页</a><em>></em><a href=\"${path}/main.jsp?category_id="+fatherName+"\">"+fatherName+"</a></div>";
            $("#zz").append($za);

            $("#publishID").click(function (){


                var tt = $('#c_title').val();
                $.ajax({
                    url: "${path}/topic/addCate",
                    dataType: "text",
                    type: "post",

                    data: {title:tt, user_id:user_id,fatherName:fatherName},
                    success:function (data){
                        location.href="${path}/main.jsp?category_id="+fatherName+"";
                    }
                })



            })
            $("#myAttention").click(function (){
                location.href = "${path}/attention.jsp"
            })
            $("#myQuiz").click(function (){
                location.href = "${path}/myPublish.jsp"
            })




        })
    </script>
</head>
<body>
<div class="container">
    <!--顶部导航-->
    <div class="navbar navbar-default " id="navbar-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="" class="navbar-brand"><span class="glyphicon glyphicon-th-large"></span></a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu-1">
                    <span class="caret"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" id="menu-1">

                <ul class="nav navbar-nav">

                    <li><a href="${path}/homePage.jsp">首页</a></li>

                </ul>


                <div class="navbar-btn navbar-right" style="background-color: transparent" id="photoDiv">

                </div>

            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10">

        <div id="zz">

            <div class="z">

            </div>
        </div>

        <!--热榜-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>添加类别</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body" id="panelList">
                <form id="publishForm">
                    <div>
                        <input class="form-control" type="text" name="title" id="c_title" placeholder="类别名...">
                    </div>

                    <button id="publishID" type="button" class="btn btn-primary block full-width m-b">添加</button>
                </form>
            </div>
        </div>

    </div>
    <!--右侧-->
    <div class="col-md-2">
        <ul class="list-group">
            <button class="list-group-item" id="myAttention">我关注的问题</button>
            <button id="myQuiz" class="list-group-item">我发出的问题</button>
        </ul>
    </div>
</div>

</body>
</html>