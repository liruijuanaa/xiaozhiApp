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
            var ii = sessionStorage.getItem("id");
            var splitElement = window.location.href.split("=")[1];
            var $panelList=$("#panelList");
            // var ii = sessionStorage.getItem("id");
            console.log("iii"+ii);
            console.log(splitElement);

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
            $.ajax({
                url:"${path}/topic/selectOne",
                dataType:"json",
                type:"post",
                method:"post",
                data:{id:splitElement},
                success:function (data){
                    console.log("这是comment页面获取的话题信息")
                    console.log(data)
                    var $nonice = $("#nonice");
                    var $con="<h3>"+data.title+"</h3>\n" +

                        "                <div class=\"page-header\">\n" +
                        "                    "+data.comment+"条评论\n" +
                        "                </div>";
                    $nonice.append($con);

                    var $topicfooter = $("#topicfooter");
                    var $confoot=
                        "                <a href=\"\"><span class=\"glyphicon glyphicon-star\"></span>&nbsp;收藏</a>";
                    $topicfooter.append($confoot)

                    //获取评论信息
                    $.ajax({
                        url:"${path}/comment/queryComment",
                        dataType:"json",
                        data:{id:data.id},
                        type:"post",
                        method:"post",
                        success:function (datas){
                            console.log("这是获取评论信息对象")
                            console.log(datas);
                            $.each(datas,function (index,msg){
                                console.log("index的值："+index)

                                var $uutr="<div class=\"panel\">\n" +
                                    "                            <div class=\"panel-body\">\n" +
                                    "                                <p>\n" +
                                    "                                    <img src=\"${path}"+msg.photo+"\" alt=\"\" class=\"img-circle\" width=\"25px\" height=\"25px\">&nbsp;&nbsp;"+msg.username+"\n" +
                                    "                                </p>\n" +
                                    "                                <p>"+msg.content+"</p>\n" +
                                    "                            </div>";
                                var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +
                                    "                                <a id=\"updatePrise\"  href=\"${path}/comment/updateComment?id="+msg.id+"&topid="+splitElement+"\" style=\"color:gray;\"><span class=\"glyphicon glyphicon-thumbs-up\" ></span>"+msg.prise+"赞</a>\n" +
                                    "                                &nbsp;&nbsp;\n" +
                                    "                                <a href=\"\" style=\"color:gray;\"  ><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;查看回复</a>\n" +
                                    "                            </div>\n" +
                                    "                        </div>";

                                $panelList.append($uutr).append($cctr);

                            })


                        }
                    })
                }
            })

            var $submitForm = $("#submitForm");
            var $nr="<div class=\"form-group\">\n" +
                "                    <input type=\"hidden\" name=\"id\" value=\"012\">\n" +
                "                    <input type=\"hidden\" name=\"prise\" value=\"0\">\n" +
                "                    <input type=\"hidden\" name=\"topicId\" value=\""+splitElement+"\">\n" +
                "                    <input type=\"hidden\" name=\"userId\" value=\""+ii+"\">\n" +
                "                    <label for=\"name\">写回答</label>\n" +
                "                    <input type=\"text\" id=\"name\" class=\"form-control\" placeholder=\"写下您的回答....\" name=\"content\">\n" +
                "                </div>\n" +
                "                <button type=\"button\" id=\"submitApply\" class=\"btn btn-primary block full-width m-b\">提交回答</button>";
            $submitForm.append($nr);

            //写回答
            $("#submitApply").click(function (){
                $.ajax({
                    url:"${path}/comment/addComment",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "text",
                    data: $("#submitForm").serialize(),
                    success:function (data){
                        location.href="${path}/commen.jsp?id="+splitElement+"";
                    }
                })
            })

            $.ajax({
                url:"${path}/user/queryAtten",
                dataType:"json",
                type:"post",
                data:{id:ii},
                success:function (data){
                    // console.log(data)
                    $.each(data,function (index,atten){
                        console.log(atten.topic_id)
                       if (splitElement==atten.topic_id){
                           $("#adda").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"dela\">取消关注</button>")
                       }
                    })
                }
            })
            $("#adda").click(function (){
                $.ajax({
                    url:"${path}/user/addAtten",
                    type:"post",
                    method:"post",
                    dataType:"json",
                    data:{user_id:u_id,topic_id:splitElement},
                    success:function (data){
                        $("#adda").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"dela\">取消关注</button>")
                    }
                })
            })
            //取消关注
            $("#nonice").on('click','#dela',function (){
                $.ajax({
                    url:"${path}/user/delAtten",
                    type:"post",
                    method:"post",
                    dataType:"json",
                    data:{user_id:u_id,topic_id: splitElement},
                    success:function (data){
                        // $("#adda").text("取消关注")
                        $("#dela").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"adda\">关注问题</button>")
                        // $("#adda").html()
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
                    <li><a href="">关于小知</a></li>
                    <li><a href="main.jsp">首页</a></li>
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
    <div class="col-md-10">

        <div class="panel">
            <div class="panel-heading text-danger" id="nonice">
                <button type="button" class="btn btn-primary" id="adda">关注问题</button>
            </div>
            <div class="panel-body" id="panelList">

            </div>
            <div class="panel-footer" id="topicfooter">

            </div>
        </div>
        <!--回答区-->
        <div class="panel">
            <!---写回答------>
            <a name="comment"></a>
            <form role="form" id="submitForm">

            </form>
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


<!--引入jQuery-->
<script src="IdeaProjects/xiaozhiApp/src/main/webapp/style/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<!--引入js文件-->
<script src="IdeaProjects/xiaozhiApp/src/main/webapp/style/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>