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
            var aa;
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
                        aa=quiz.topic_id;
                        $.ajax({
                            url:"${path}/topic/selectOne",
                            dataType: "json",
                            type: "post",
                            data:{id:quiz.topic_id},
                            success:function (data){
                                console.log(data)
                                var $titlehr="<div class=\"panel\">\n" +
                                    "                            <div class=\"panel-body\" id=\"aa\">\n" +
                                    "                                <p>\n" +
                                    "                                    <h3><a href=\"${path}/commen.jsp?id="+data.id+"\">"+data.title+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "<a type=\"button\" id=\"deleteQuiz\"> <small><span class=\"glyphicon glyphicon-trash\"></span></small></a></h3>" +
                                    "                                </p>\n" +
                                    "                            </div>";
                                var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +
                                    "                                <span class=\"glyphicon glyphicon-thumbs-up\"></span>"+data.prise+"赞<span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+data.comment+"条评论</a>\n" +
                                    "                                &nbsp;&nbsp;\n" +
                                    "                        </div>";
                                $panelList.append($titlehr).append($cctr);




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
            //删除发布
            $("#panelList").on('click','#deleteQuiz',function (){
                $.ajax({
                    url:"${path}/user/delQuiz",
                    type:"post",
                    method:"post",
                    dataType:"json",
                    data:{user_id:uid,topic_id: aa},
                    success:function (){
                        location.href="${path}/myPublish.jsp";
                    }
                })
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
                    <li><a href="">关于小知</a></li>
                    <li><a href="${path}/main.jsp">首页</a></li>
                    <li><a href="">等你来答</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <a href="${path}/quiz.jsp" type="button" class="navbar-btn btn btn-primary">提问</a>
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
            <li class="list-group-item">写回答</li>
            <li class="list-group-item">我的草稿</li>
            <li class="list-group-item">我的收藏</li>
            <button class="list-group-item" id="myAttention">我关注的问题</button>
            <button id="myQuiz" class="list-group-item">我发出的问题</button>
        </ul>
    </div>
</div>

</body>
</html>