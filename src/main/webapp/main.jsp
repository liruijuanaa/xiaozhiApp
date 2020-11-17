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
    <title>主页</title>
    <!--引入css文件-->
    <script src="${path}/style/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/style/js/jquery.backstretch.min.js"></script>
    <script src="${path}/style/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/style/css/bootstrap.css"/>

    <script src="${path}/style/js/bootstrap.min.js"></script>

    <script>
        $(function (){
            var u_id = sessionStorage.getItem("id")
            console.log("u_id"+u_id);

            $.ajax({
                url:"${path}/user/selectOne",
                dataType:"JSON",
                data:{id:u_id},
                type:"post",
                method:"post",
                success:function (data){

                    console.log(data)
                    var $photoimg="欢迎 "+data.username+"  <img src=\"${path}"+data.photo+"\" class=\"img-circle\" alt=\"\" width=\"30px\" height=\"30px\"></a></li>";
                    $("#photoDiv").append($photoimg);
                }
            });
            var $contentBig = $("#contentBig");
            //热股榜
            $.ajax({
                url:"${path}/topic/queryAll",
                dataType:"json",
                type:"post",
                method:"post",
                success:function (data){

                    console.log(data)

                    $.each(data,function (index,hot){

                        var $titlehr=
                            "                <div class=\"panel\">\n" +
                            "                    <div class=\"panel-heading text-danger\">\n" +
                            "                        <div class=\"page-header\">\n" +
                            "                            <h3><a href=\"${path}/commen.jsp?id="+hot.id+"\">"+hot.title+"</a></h3>";
                        <%--var $titlehr=" <h3><a href=\"${path}/commen.jsp?id="+hot.id+"\">"+hot.title+"</a></h3>";--%>

                        var $hotFoot="<div id=\"panelList\"></div><div class=\"panel-footer\">\n" +
                            "                        <a  href=\"${path}/topic/updateTopic?id="+hot.id+"\"><span class=\"glyphicon glyphicon-thumbs-up\"></span>"+hot.prise+"赞</a>\n" +
                            "                        &nbsp;&nbsp;\n" +
                            "                        <a href=\"${path}/commen.jsp?id="+hot.id+"\"><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+hot.comment+"</a>\n" +
                            "                        &nbsp;&nbsp;\n" +
                            "                        <a href=\"\"><span class=\"glyphicon glyphicon-star\"></span>&nbsp;收藏</a>\n" +

                            "            </div>\n" +
                            "        </div>";
                        var $panelList=$("#panelList");
                        //获取评论信息
                        var $uutr;
                        var $cctr;
                        $.ajax({

                            url:"${path}/comment/queryComment",
                            dataType:"json",
                            data:{id:hot.id},
                            type:"post",
                            method:"post",
                            success:function (datas){
                                if (datas.length!=0){
                                    console.log("这是获取评论信息对象")
                                    console.log(datas);
                                    $.each(datas,function (index,msg){

                                        // console.log("index的值："+index)

                                       $uutr="<div><div class=\"panel-body\"><div class=\"panel\">\n" +
                                            "                            <div class=\"panel-body\">\n" +
                                            "                                <p>\n" +
                                            "                                    <img src=\"${path}"+msg.photo+"\" alt=\"\" class=\"img-circle\" width=\"25px\" height=\"25px\">&nbsp;&nbsp;"+msg.username+"\n" +
                                            "                                </p>\n" +
                                            "                                <p>"+msg.content+"</p>\n" +
                                            "                            </div>";
                                        $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +
                                            "                                <a id=\"updatePrise\"  href=\"${path}/comment/updateComment?id="+msg.id+"&uid="+u_id+"\" style=\"color:gray;\"><span class=\"glyphicon glyphicon-thumbs-up\" ></span>"+msg.prise+"赞</a>\n" +
                                            "                                &nbsp;&nbsp;\n" +
                                            "                                <a href=\"\" style=\"color:gray;\"  ><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;查看回复</a>\n" +
                                            "                            </div>\n" +
                                            "                        </div></div></div>";

                                         // $panelList.append($uutr).append($cctr);



                                })
                                }

                            }
                        })

                        $contentBig.append($titlehr).append($uutr).append($cctr).append($hotFoot);
                    })
                    //获取评论信息

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
                <a href="" class="navbar-brand"><span class="glyphicon glyphicon-list" aria-hidden="true"></span></a>
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
                    <button type="submit" class="   btn btn-default">搜索</button>
                </form>
                <a href="${path}/quiz.jsp" type="button" class="navbar-btn btn btn-primary">提问</a>
                <div class="navbar-btn navbar-right" style="background-color: transparent" id="photoDiv">

                </div>

            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10" id="contentBig">


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