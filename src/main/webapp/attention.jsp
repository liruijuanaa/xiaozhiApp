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
        .new{
            width: 30px;
            padding-left: 10px;
            padding-top: 10px;
            padding-right: 10px;
        }
        nav{
            width: 938px;
            display: flex;
            float: right;
        }
        .pagination{
            float: right;
        }
        .pagination li:active{
            background-color: black;
        }
        #go{
            width: 200px;
            float: right;
            margin: 20px;
            margin-right: 0;
            padding-right: 0;
        }
        .pp{
            width: 938px;

        }
        #tt{
            height: 40px;
            padding-left: 50px;
            margin-top: 80px;
        }
        #fo{
            width: 753px;
            float: right;
        }
        #publishabc{

            height: 34px;
            width: 70px;
            margin-top: 20px;
            margin-right: 150px;
        }
        .bmw {
            border: 1px solid #CDCDCD;
        }
        .bm {
            border: 1px solid #CDCDCD;
            background: #FFF;
        }
        .bm, .bn {
            margin-bottom: 10px;
        }
        #zz{
            padding-bottom: 7px;
        }
        #rig{
            padding-top: 23px;
        }
    </style>
    <script>
        var uid;
        var $panelList;
        $(function (){
             uid= sessionStorage.getItem("id");
            $panelList=$("#panelList");
            // var $aa = $("#aaa");

            yy(1);
            $("#gg").click(function (){
                var val = $("#goto").val();
                console.log("文本框输入的值是"+val)
                yy(val);
            })

            $("#myAttention").click(function (){
                location.href = "${path}/attention.jsp"
            })
            $("#myQuiz").click(function (){
                location.href = "${path}/myPublish.jsp"
            })
        })

        var nn;
        var pageNum;
        function yy(num){
            nn=num;
            $("#myul").empty();
            $panelList.empty();
            $("#num").css("class","active");
            $.ajax({
                url:"${path}/user/queryAtten",
                dataType:"json",
                type:"post",
                data:{id:uid,page:num},
                success:function (data){
                    console.log(data)

                    var ss = data.attlist;
                    var total = data.total;
                    console.log(ss);
                    // console.log("total"+total);
                    pageNum=data.num;
                    $("#pageTotal").text("共"+data.num+"页");
                    var $ao="        <li id=\"pp\" style=\"cursor: pointer\">\n" +
                        "            <a aria-label=\"Previous\" id=\"prevStatu\" onclick=\"prevId()\">\n" +
                        "                <span aria-hidden=\"true\">&laquo;</span>\n" +
                        "            </a>\n" +
                        "        </li>";
                    var $at="            <li  style=\"cursor: pointer\"><a aria-label=\"Next\" id=\"nextStatu\" onclick=\"nextId()\">\n" +
                        "                <span aria-hidden=\"true\">&raquo;</span>\n" +
                        "            </a>\n" +
                        "        </li>";
                    $("#myul").append($ao);
                    for (var i in total){

                        var $ah="<li style=\"cursor: pointer\"><a id=\""+total[i]+"\" onclick=\"yy("+total[i]+")\">"+total[i]+"</a></li>";
                        $("#aa").addClass('active')

                        $("#myul").append($ah);
                    }
                    var $total="<span id='tt'>共"+data.num+"页</span>";
                    $("#goto").val(nn);
                    $("#myul").append($at);

                    $.each(ss,function (index,atten){
                        console.log(atten.topic_id);

                        <%--var $titlehr="<div class=\"panel\">\n" +--%>
                        <%--    "                            <div class=\"panel-body\">\n" +--%>
                        <%--    "                                <p>\n" +--%>
                        <%--    "                                    <h3><a href=\"${path}/commen.jsp?id="+atten.id+"\">"+atten.name+"</a></h3>" +--%>
                        <%--    "                                </p>\n" +--%>
                        <%--    "                            </div>";--%>

                        <%--$panelList.append($titlehr);--%>

                        $.ajax({
                            url:"${path}/topic/selectOne",
                            dataType: "json",
                            type: "post",
                            data:{id:atten.topic_id},
                            success:function (data){
                                // var themeNa;
                                //根据icon去查询等级为0的
                                $.ajax({
                                    url:"${path}/topic/queryThemeName",
                                    dataType:"json",
                                    type:"post",
                                    data:{icon:data.icon},
                                    success:function (dd){
                                       var themeNa = dd.name;

                                        console.log(data)
                                        var $titlehr="<div class=\"panel\">\n" +
                                            "                            <div class=\"panel-body\">\n" +
                                            "                                <p>\n" +
                                            "                                    <h3><a href=\"${path}/commen.jsp?id="+data.id+"&name="+themeNa+"\">"+data.name+"</a></h3>" +
                                            "                                </p>\n" +
                                            "                            </div>";
                                        var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +

                                            "                        </div>";
                                        <%--var $titlehr=" <h3><a href=\"${path}/commen.jsp?id="+data.id+"\">"+data.title+"</a></h3>";--%>
                                        // var $prisetr="<span class=\"glyphicon glyphicon-thumbs-up\"></span>"+data.prise+"赞</a>";
                                        // var $comment="<span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+data.comment+"条评论</a>";
                                        $panelList.append($titlehr).append($cctr);
                                    }
                                })



                            }
                        })
                    })
                }
            })
        }
        function nextId(){
            if (nn==pageNum||nn>pageNum){
                yy(nn)

            }else {
                yy(nn+1);
            }

        }
        function prevId(){
            if (nn==1||nn<1){
                $("#pp").addClass('disabled');
                yy(nn);
            }else {

                yy(nn-1);
            }

        }
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
                <h3>我的关注</h3>
            </div>
            <!--问题浏览-->
            <div class="panel-body" id="panelList">
<%--                <div class="panel">--%>
<%--                    <div class="panel-heading text-danger" >--%>

<%--                    </div>--%>
<%--                    <!--评论回答-->--%>
<%--                    <div class="panel-body"  id="panelList">--%>

<%--                    </div>--%>
<%--                    <div class="panel-footer" id="hotFoot">--%>

<%--                    </div>--%>
<%--                </div>--%>
            </div>
        </div>

        <div class="pp">

            <nav aria-label="Page navigation">

                <div id="fo">


                    <div class="input-group" id="go">
                        <span class="input-group-addon" id="pageTotal"> </span>
                        <input type="text" style="width: 60px" class="form-control" id="goto">

                        <button class="btn btn-default" type="button" id="gg">Go!</button>
                        </span>
                    </div>
                    <ul class="pagination" id="myul">


                    </ul>
                </div>
            </nav>
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