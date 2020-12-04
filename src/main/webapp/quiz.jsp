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
    <style>
        select{
            border-radius: 5px;
            height: 30px;
        }
    </style>
    <script>
        var options;
        var options2;
        $(function (){
            var user_id = sessionStorage.getItem("id");
            var category_id = window.location.href.split("=")[1];
            var username = sessionStorage.getItem("uname");

            var $sel = $("#select");
            options=$("#select option:first").val();
            var $sel2 = $("#select2");
            options2=$("#select2 option:first").val();

            $sel2.change(function (){
                options2=$("#select2 option:selected").val();
                // alert("options2的值是："+options2)

            })

            $sel.change(function (){
                options = $("#select option:selected").val();
                // alert(options.val())
                $("#select2").empty();
                if (options==0){
                    options2=0;

                }else {
                    $.ajax({
                        type : "post",
                        method:"post",
                        async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                        url : "${path}/category/queryTwoCategory2", //请求发送到Page处
                        data : {category_id:options},
                        dataType : "json", //返回数据形式为json
                        success:function(data) {
                            console.log("------")
                            console.log(data);
                            var $top=" <option value=\"0\">全部</option>";
                            $sel2.append($top);
                            $.each(data,function (index,cat){

                                var $op="<option value=\""+cat.id+"\">"+cat.description+"</option>";
                                $sel2.append($op);
                            })
                        }
                    });

                }
            })

            var $za="<span style=\"color: lightgray\" class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span><em> > </em><a href=\"${path}/homePage.jsp?username="+username+"\">论坛首页</a><em>></em><a href=\"${path}/main.jsp?category_id="+category_id+"\">"+category_id+"</a></div>";
            $("#zz").append($za);

            var two_id;
            $.ajax({
                type : "post",
                method:"post",
                async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${path}/category/queryTwoCategory", //请求发送到Page处
                data : {category_id:category_id},
                dataType : "json", //返回数据形式为json
                success:function(data) {
                    console.log(data);
                    $.each(data,function (index,cat){

                        var $op="<option value=\""+cat.id+"\">"+cat.description+"</option>";
                        $sel.append($op);
                    })
                }
            });


            $("#publishID").click(function (){
                console.log("two_id  "+options2);
                if (options2==0){
                    alert("请选择类别")
                }else {
                    var cont = $("#publishtext").val();
                    console.log(cont)
                    var tt = $('#c_title').val();
                    $.ajax({
                        url: "${path}/topic/addTopic",
                        dataType: "text",
                        type: "post",

                        data: {title:tt, content:cont, user_id:user_id,category_id:options2},
                        success:function (data){
                            location.href="${path}/main.jsp?category_id="+category_id+"";
                        }
                    })
                }


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

                <button type="button" class="navbar-btn btn btn-primary">发帖</button>
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
        <div>
            <select id="select">
                <option value="0">请选择发帖类别</option>
            </select>
            <select id="select2">
                <option value="0"></option>
            </select>
        </div>

        <!--热榜-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>提问</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body" id="panelList">
                <form id="publishForm">
                    <div>
                        <input class="form-control" type="text" name="title" id="c_title" placeholder="标题...">
                    </div>
                    <div class="form-group">
                        <textarea id="publishtext" rows="5px" class="form-control" placeholder="话题内容..."></textarea>
                    </div>
                    <button id="publishID" type="button" class="btn btn-primary block full-width m-b">发表</button>
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