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
            var uid = sessionStorage.getItem("id");
            var $panelList=$("#panelList");

            // var $aa = $("#aaa");
            $.ajax({
                url:"${path}/user/queryQuiz",
                dataType:"json",
                type:"post",
                data:{id:uid},
                success:function (data){
                    // console.log(data)
                    $.each(data,function (index,quiz){
                        console.log(quiz.topic_id)

                        $.ajax({
                            url:"${path}/topic/selectOne",
                            dataType: "json",
                            type: "post",
                            data:{id:quiz.topic_id},
                            success:function (data){

                                $.ajax({
                                    url:"${path}/topic/queryThemeName",
                                    dataType:"json",
                                    type:"post",
                                    data:{icon:data.icon},
                                    success:function (dd){
                                        var themeNa = dd.name;

                                        if (data.status==1){
                                            // $("#help_id").replaceWith("<button type=\"button\" id=\"resolved_id\" class=\"btn btn-success\">已解决</button>");
                                            var $state="<a href=\"${path}/topic/updateStatus?status=0&id="+data.id+"\" type=\"button\" id=\"resolved_id\" class=\"btn btn-success\">已解决</a>";
                                        }else {
                                            var $state="<a href=\"${path}/topic/updateStatus?status=1&id="+data.id+"\" type=\"button\" id=\"help_id\" class=\"btn btn-danger\">求助</a>";
                                        }
                                        console.log(data)
                                        var $titlehr="<div class=\"panel\">\n" +
                                            "                            <div class=\"panel-body\" id=\"aa\">\n" +
                                            "                                <p>\n" +
                                            "                                    <h3><a href=\"${path}/commen.jsp?id="+data.id+"&name="+themeNa+"\">"+data.name+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                            $state+
                                            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a type=\"button\" href=\"${path}/user/delQuiz?user_id="+uid+"&topic_id="+data.id+"\" id=\"deleteQuiz\"> <small><span class=\"glyphicon glyphicon-trash\"></span></small></a></h3>" +
                                            "                                </p>\n" +
                                            "                            </div>";
                                        // var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +
                                        //     "                                <span class=\"glyphicon glyphicon-thumbs-up\"></span>赞<span class=\"glyphicon glyphicon-comment\"></span>&nbsp;条评论</a>\n" +
                                        //     "                                &nbsp;&nbsp;\n" +
                                        //     "                        </div>";
                                        $panelList.append($titlehr);
                                    }
                                })





                            }
                        })

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

<%--                <a href="${path}/quiz.jsp" type="button" class="navbar-btn btn btn-primary">发帖</a>--%>
                <div class="navbar-btn navbar-right" style="background-color: transparent" id="photoDiv">

                </div>

            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10">
        <!--热榜-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>我发出的问题</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body" id="panelList">

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