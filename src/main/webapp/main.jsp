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

    <link rel="stylesheet" type="text/css" href="${path}/style/bootstrap/css/bootstrap.css"/>
    <script src="${path}/style/bootstrap/js/jquery.min.js"></script>
    <script src="${path}/style/bootstrap/js/bootstrap.min.js"></script>
    <script src="${path}/style/js/jquery.backstretch.min.js"></script>
    <script src="${path}/style/js/jquery.validate.min.js"></script>
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
                    alert("selectOne查询成功")
                    console.log(data)
                    var $photoimg="欢迎 "+data.username+"  <img src=\"${path}"+data.photo+"\" class=\"img-circle\" alt=\"\" width=\"30px\" height=\"30px\"></a></li>";
                    $("#photoDiv").append($photoimg);
                }
            });

            //热股榜
            $.ajax({
                url:"${path}/topic/queryHot",
                dataType:"json",
                type:"post",
                method:"post",
                success:function (data){

                    console.log("这是热股榜的数据")
                    console.log(data)
                    var $hotDiv=$("#hotDiv");
                    var $hotFoot=$("#hotFoot");
                    var $panelList=$("#panelList");
                    $.each(data,function (index,hot){
                        var $titlehr=" <h3><a href=\"${path}/commen.jsp?id="+hot.id+"\">"+hot.title+"</a><small>精选评论（2）</small></h3>";
                        $hotDiv.append($titlehr);
                        var $prisetr="<a href=\"\"><span class=\"glyphicon glyphicon-thumbs-up\"></span>"+hot.prise+"赞</a>";
                        var $comment="<a href=\"\" id='more'><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+hot.comment+"条评论</a>";
                        var $collectiontr=" <a href=\"\"><span class=\"glyphicon glyphicon-star\"></span>&nbsp;收藏</a>";
                        $hotFoot.append($prisetr).append($comment).append($collectiontr);

                        //获取评论信息
                        $.ajax({
                            url:"${path}/comment/queryComment",
                            dataType:"json",
                            data:{id:hot.id},
                            type:"post",
                            method:"post",
                            success:function (datas){
                                console.log("这是获取评论信息对象")
                                console.log(datas);
                                $.each(datas,function (index,msg){
                                    // console.log("index的值："+index)

                                    var $uutr="<div class=\"panel\">\n" +
                                        "                            <div class=\"panel-body\">\n" +
                                        "                                <p>\n" +
                                        "                                    <img src=\"${path}"+msg.photo+"\" alt=\"\" class=\"img-circle\" width=\"25px\" height=\"25px\">&nbsp;&nbsp;"+msg.username+"\n" +
                                        "                                </p>\n" +
                                        "                                <p>"+msg.content+"</p>\n" +
                                        "                            </div>";
                                    var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +
                                        "                                <a id=\"updatePrise\"  href=\"${path}/comment/updateComment?id="+msg.id+"&uid="+u_id+"\" style=\"color:gray;\"><span class=\"glyphicon glyphicon-thumbs-up\" ></span>"+msg.prise+"赞</a>\n" +
                                        "                                &nbsp;&nbsp;\n" +
                                        "                                <a href=\"\" style=\"color:gray;\"  ><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;查看回复</a>\n" +
                                        "                            </div>\n" +
                                        "                        </div>";

                                    $panelList.append($uutr).append($cctr);

                                })


                            }
                        })
                    })
                    //获取评论信息

                }

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
                    <button type="submit" class="   btn btn-default">搜索</button>
                </form>
                <button type="button" class="navbar-btn btn btn-primary">提问</button>
                <div class="navbar-btn navbar-right" style="background-color: transparent" id="photoDiv">

                </div>

            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10">
<%--        <!--推荐-->--%>
<%--        <div class="panel panel-default">--%>
<%--            <div class="panel-heading">--%>
<%--                    <h3>推荐</h3>--%>
<%--            </div>--%>
<%--            <!--问题浏览-->--%>
<%--            <div class="panel-body">--%>
<%--                <div class="panel">--%>
<%--                    <div class="panel-heading text-danger">--%>
<%--                        <div class="page-header">--%>
<%--                            <h3><a href="${path}/commen.jsp">如何长时间高效学习？</a><small>精选评论（2）</small></h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!--评论回答-->--%>
<%--                    <div class="panel-body">--%>
<%--                        <div class="panel">--%>
<%--                            <div class="panel-body">--%>
<%--                                <p>--%>
<%--                                    <img src="${path}/img/pkq07.jpg" alt="" class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问必答--%>
<%--                                </p>--%>
<%--                                <p>多读书，多看报，少吃饭多睡觉！</p>--%>
<%--                            </div>--%>
<%--                            <div class="panel-footer" style="background-color: white;">--%>
<%--                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-thumbs-up" ></span>191赞</a>--%>
<%--                                &nbsp;&nbsp;--%>
<%--                                <a href="" style="color:gray;"  ><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="panel">--%>
<%--                            <div class="panel-body">--%>
<%--                                <p>--%>
<%--                                    <img src="${path}/img/pkq02.jpg" alt="" class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问有答--%>
<%--                                </p>--%>
<%--                                <p>回想的过程就是从大脑中提取知识的过程，可以帮助我们记忆更久远、更牢固。当你发现有个知识回想不起来的时候，说明你该去复习它了！~</p>--%>
<%--                            </div>--%>
<%--                            <div class="panel-footer" style="background-color: white;">--%>
<%--                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-thumbs-up" ></span>228赞</a>--%>
<%--                                &nbsp;&nbsp;--%>
<%--                                <a href="" style="color:gray;"  ><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div class="panel-footer">--%>
<%--                        <a href=""><span class="glyphicon glyphicon-thumbs-up"></span>2048赞</a>--%>
<%--                        &nbsp;&nbsp;--%>
<%--                        <a href=""><span class="glyphicon glyphicon-comment"></span>&nbsp;3227条评论</a>--%>
<%--                        &nbsp;&nbsp;--%>
<%--                        <a href=""><span class="glyphicon glyphicon-star"></span>&nbsp;收藏</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!--关注-->--%>
<%--        <div class="panel panel-default">--%>
<%--            <div class="panel-heading">--%>
<%--                <h3>关注</h3>--%>
<%--            </div>--%>
<%--            <!--问题浏览-->--%>
<%--            <div class="panel-body">--%>
<%--                <div class="panel">--%>
<%--                    <div class="panel-heading text-danger">--%>
<%--                        <div class="page-header">--%>
<%--                            <h3><a href="">如何让他（她）爱上你？</a><small>精选评论（2）</small></h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!--评论回答-->--%>
<%--                    <div class="panel-body">--%>
<%--                        <div class="panel">--%>
<%--                            <div class="panel-body">--%>
<%--                                <p>--%>
<%--                                    <img src="${path}/img/pkq07.jpg" alt="" class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问必答--%>
<%--                                </p>--%>
<%--                                <p>多读书，多看报，少吃饭多睡觉！</p>--%>
<%--                            </div>--%>
<%--                            <div class="panel-footer" style="background-color: white;">--%>
<%--                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-thumbs-up" ></span>191赞</a>--%>
<%--                                &nbsp;&nbsp;--%>
<%--                                <a href="" style="color:gray;"  ><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="panel">--%>
<%--                            <div class="panel-body">--%>
<%--                                <p>--%>
<%--                                    <img src="${path}/img/pkq02.jpg" alt="" class="img-circle" width="25px" height="25px">&nbsp;&nbsp;有问有答--%>
<%--                                </p>--%>
<%--                                <p>回想的过程就是从大脑中提取知识的过程，可以帮助我们记忆更久远、更牢固。当你发现有个知识回想不起来的时候，说明你该去复习它了！~</p>--%>
<%--                            </div>--%>
<%--                            <div class="panel-footer" style="background-color: white;">--%>
<%--                                <a href="" style="color:gray;"><span class="glyphicon glyphicon-thumbs-up" ></span>228赞</a>--%>
<%--                                &nbsp;&nbsp;--%>
<%--                                <a href="" style="color:gray;"  ><span class="glyphicon glyphicon-comment"></span>&nbsp;查看回复</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div class="panel-footer">--%>
<%--                        <a href=""><span class="glyphicon glyphicon-thumbs-up"></span>2048赞</a>--%>
<%--                        &nbsp;&nbsp;--%>
<%--                        <a href=""><span class="glyphicon glyphicon-comment"></span>&nbsp;3227条评论</a>--%>
<%--                        &nbsp;&nbsp;--%>
<%--                        <a href=""><span class="glyphicon glyphicon-star"></span>&nbsp;收藏</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <!--热榜-->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>热榜</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body">
                <div class="panel">
                    <div class="panel-heading text-danger">
                        <div class="page-header" id="hotDiv">

                        </div>
                    </div>
                    <!--评论回答-->
                    <div class="panel-body" id="panelList">

                    </div>
                    <div class="panel-footer" id="hotFoot">

                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--右侧-->
    <div class="col-md-2">
        <ul class="list-group">
            <li class="list-group-item">写回答</li>
            <li class="list-group-item">我的草稿</li>
            <li class="list-group-item">我的收藏</li>
            <li class="list-group-item">我关注的问题</li>
            <li class="list-group-item">我的邀请</li>
        </ul>
    </div>
</div>


</body>
</html>