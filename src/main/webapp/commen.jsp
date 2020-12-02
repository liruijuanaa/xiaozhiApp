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
            var u_id = sessionStorage.getItem("id")
            var username = sessionStorage.getItem("uname");
            var autho = sessionStorage.getItem("autho");
            console.log("u_id"+u_id);
            console.log("用户权限："+autho);
            // var splitElement = window.location.href.split("=")[1];
            var $panelList=$("#panelList");
            // var themeName = window.location.href.split("=")[2];
            // alert("themename"+splitElement);

            if(document.URL.indexOf("?")<0) return;//获取当前url地址,如果没参数.直接返回
            var str=document.URL.split("?")[1];
            var obj={};
            var arr;

            //当有多个参数时
            arr=str.split("&");
            var arr1;
            for(var i=0;i<arr.length;i++){
                arr1=arr[i].split("=");
                obj[arr1[0]]=arr1[1];
            }
            var splitElement =obj.id;
            var themeName=obj.name;


            console.log(splitElement);

            var $za="<span style=\"color: lightgray\" class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span><em> > </em><a href=\"${path}/homePage.jsp?username="+username+"\">论坛首页</a><em>></em><a href=\"${path}/main.jsp?category_id="+themeName+"\">"+themeName+"</a></div>";
            $("#zz").append($za);



            //查询用户
            $.ajax({
                url:"${path}/user/selectOne",
                dataType:"JSON",
                data:{username:username},
                type:"post",
                method:"post",
                success:function (data){

                    console.log(data)
                    var $photoimg="欢迎 "+data.username+"  <img src=\"${path}"+data.photo+"\" class=\"img-circle\" alt=\"\" width=\"30px\" height=\"30px\"></a></li>";
                    $("#photoDiv").append($photoimg);
                }
            });
            //根据话题ID去查询话题详情和评论信息
            $.ajax({
                url:"${path}/topic/selectOne",
                dataType:"json",
                type:"post",
                method:"post",
                data:{id:splitElement},
                success:function (data){
                    console.log("这是comment页面获取的话题信息")
                    console.log(data)

                    //再根据话题ID去查询哪个用户发表的
                    <%--$.ajax({--%>
                    <%--    url:"${path}/user/queryPub",--%>
                    <%--    dataType:"json",--%>
                    <%--    type:"post",--%>
                    <%--    method:"post",--%>
                    <%--    data:{id:data.id},--%>
                    <%--    success:function (userdata){--%>

                    <%--        console.log(userdata);--%>

                    <%--        var $nonice = $("#nonice");--%>
                    <%--        var $con="<h3>"+data.name+"</h3>\n" +--%>
                    <%--            "<div style='color: black;padding-top: 15px'>"+userdata.username+""+data.description+"</div>"+--%>
                    <%--            "                <div class=\"page-header\">\n" +--%>
                    <%--            // "                    "+data.comment+"条评论\n" +--%>
                    <%--            "                </div>";--%>
                    <%--        $nonice.append($con);--%>

                    <%--        var $topicfooter = $("#topicfooter");--%>
                    <%--        var $confoot=--%>
                    <%--            "                <a href=\"\"><span class=\"glyphicon glyphicon-star\"></span>&nbsp;收藏</a>";--%>
                    <%--        $topicfooter.append($confoot)--%>

                    <%--      --%>
                    <%--    }--%>
                    <%--})--%>

                            var $nonice = $("#nonice");
                            var $con="<h3>"+data.name+"</h3>\n" +
                                "<div style='color: black;padding-top: 15px'>"+data.description+"</div>"+
                                "                <div class=\"page-header\">\n" +
                                // "                    "+data.comment+"条评论\n" +
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
                            //遍历评论信息
                            $.each(datas,function (index,msg){
                                console.log("index的值："+index)

                                var $uutr="<div class=\"panel\">\n" +
                                    "                            <div class=\"panel-body\">\n" +
                                    "                                <p>\n" +
                                    "                                    <img src=\"${path}\" alt=\"\" class=\"img-circle\" width=\"25px\" height=\"25px\">&nbsp;&nbsp;\n" +
                                    "                                </p>\n" +
                                    "                                <p>"+msg.description+"</p>\n" +
                                    "                            </div>";
                                <%--var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +--%>
                                <%--    "                                <a id=\"updatePrise\"  href=\"${path}/comment/updateComment?id="+msg.id+"&topid="+splitElement+"\" style=\"color:gray;\"><span class=\"glyphicon glyphicon-thumbs-up\" ></span>"+msg.prise+"赞</a>\n" +--%>
                                <%--    "                                &nbsp;&nbsp;\n" +--%>
                                <%--    "                                <a href=\"\" style=\"color:gray;\"  ><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;查看回复</a>\n" +--%>
                                <%--    "                            </div>\n" +--%>
                                <%--    "                        </div>";--%>

                                // $panelList.append($uutr).append($cctr);
                                $panelList.append($uutr);
                            })


                        }
                    })
                }
            })

            var $submitForm = $("#submitForm");
            if (autho=='admin'){
                var $nr="<div class=\"form-group\">\n" +
                    "                    <input type=\"hidden\" name=\"id\" value=\"012\">\n" +
                    "                    <input type=\"hidden\" name=\"name\" value=\"0\">\n" +
                    "                    <input type=\"hidden\" name=\"USER_ID\" value=\""+u_id+"\">\n"+
                    "                    <input type=\"hidden\" name=\"pid\" value=\""+splitElement+"\">\n" +
                    "                    <label for=\"name\">写回答</label>\n" +
                    "                    <textarea  rows=\"5px\" id=\"name\" class=\"form-control\" placeholder=\"写下您的回答....\" name=\"description\"></textarea>\n" +
                    "                </div>\n" +
                    "                <button type=\"button\" id=\"submitApply\" class=\"btn btn-primary block full-width m-b\">提交回答</button>";
            }else {
                var $nr="<div class=\"form-group\">\n" +
                    "                    <input type=\"hidden\" name=\"id\" value=\"012\">\n" +
                    "                    <input type=\"hidden\" name=\"name\" value=\"0\">\n" +
                    "                    <input type=\"hidden\" name=\"USER_ID\" value=\""+u_id+"\">\n"+
                    "                    <input type=\"hidden\" name=\"pid\" value=\""+splitElement+"\">\n" +
                    "                    <label for=\"name\">写回答</label>\n" +
                    "                    <textarea disabled rows=\"5px\" id=\"name\" class=\"form-control\" placeholder=\"您现在无权发帖....\" name=\"description\"></textarea>\n" +
                    "                </div>\n" +
                    "                <button disabled type=\"button\" id=\"submitApply\" class=\"btn btn-primary block full-width m-b\">提交回答</button>";
            }

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
                url:"${path}/user/queryIfAtten",
                dataType:"json",
                type:"post",
                data:{id:u_id},
                success:function (data){

                     console.log(data)
                    $.each(data,function (index,atten){
                        console.log(atten.topic_id)
                       if (splitElement==atten.topic_id){
                           $("#adda").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"dela\">取消关注</button>")
                       }
                    })
                }
            })
            $("#nonice").on('click','#adda',function (){
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

                    <li><a href="homePage.jsp">首页</a></li>

                </ul>

<%--                <a href="${path}/quiz.jsp" type="button" class="navbar-btn btn btn-primary">发帖</a>--%>
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
            <form role="form" id="submitForm" method="post">

            </form>
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


<!--引入jQuery-->
<script src="IdeaProjects/xiaozhiApp/src/main/webapp/style/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<!--引入js文件-->
<script src="IdeaProjects/xiaozhiApp/src/main/webapp/style/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>