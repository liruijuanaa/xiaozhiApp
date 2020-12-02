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
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.js"></script>

    <style>
        .mytable{
            width: 938px;
            height: 380px;


        }
        tr{
            width: 938px;
            height: 39px;
        }

        td {
            padding: 5px 0;
            border-bottom: 1px solid #C2D5E3;
        }
        td.by {
            width: 105px;
            line-height: 14px;
        }
        td.num {
            width: 130px;
        }
        td.common{
            width: 480px;
            height: 39px;
        }
        td.dd{
            width: 200px;
        }
        .th{
            width: 958px;
            height: 39px;
            border-bottom: 1px solid #C2D5E3;
        }
        .zhu{
            width: 480px;
            height: 39px;
        }
        .dat{
            width: 200px;
        }
        .look{
            width: 130px;
        }
        .new{
            width: 30px;

        }
        nav{
            width: 938px;
            display: flex;
            float: right;
        }
        .pagination{
            float: right;
        }
        #go{
            width: 200px;
            float: right;
            margin: 20px;
        }
        .pp{
            width: 938px;

        }
        a:active{
            background-color: black;
        }

        li:active{
            background-color: black;
        }


        #tt{
            height: 40px;
            padding-left: 50px;
            margin-top: 80px;
        }
        #fo{
            width: 820px;
            float: right;
        }
        #publishabc{

            height: 34px;
            width: 70px;
            margin-top: 20px;
            margin-right: 150px;
        }
    </style>
    <script>
        var u_id;
        var category_id;
        $(function (){


            category_id = window.location.href.split("=")[1];
            console.log("一级类别ID是"+category_id)
            var username = sessionStorage.getItem("uname");

            var $photoimg="欢迎 "+username+"</a></li>";
            $("#photoDiv").append($photoimg);

            $(document).click(function(e) { // 在页面任意位置点击而触发此事件
                alert($(e.target().attr('id')));
            })
            yy(1);
            $("#gg").click(function (){
                var val = $("#goto").val();
                console.log("文本框输入的值是"+val)
                yy(val);
            })




            $("#publishabc").click(function (){

                location.href="${path}/quiz.jsp?category_id="+category_id+"";
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
            $("#mytable").empty();
            $("#num").css("class","active");
            $.ajax({
                type : "post",
                method:"post",
                async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "${path}/category/queryTwoCategoryFenye", //请求发送到Page处
                data : {category_id:category_id,page:num},
                dataType : "json", //返回数据形式为json
                success:function(data) {
                    console.log(data);
                    var ss = data.topiclist;
                    var total = data.total;
                    console.log(ss);
                    console.log("total"+total);
                    pageNum=data.num;
                    $("#pageTotal").text("共"+data.num+"页");
                    var $ao="        <li id=\"pp\">\n" +
                        "            <a href=\"#\" aria-label=\"Previous\" id=\"prevStatu\" onclick=\"prevId()\">\n" +
                        "                <span aria-hidden=\"true\">&laquo;</span>\n" +
                        "            </a>\n" +
                        "        </li>";
                    var $at="            <li><a href=\"#\" aria-label=\"Next\" id=\"nextStatu\" onclick=\"nextId()\">\n" +
                        "                <span aria-hidden=\"true\">&raquo;</span>\n" +
                        "            </a>\n" +
                        "        </li>";
                    $("#myul").append($ao);
                    for (var i in total){

                            var $ah="<li ><a  id=\""+total[i]+"\" href=\"#\" onclick=\"yy("+total[i]+")\">"+total[i]+"</a></li>";
                        $("#aa").addClass('active')

                        $("#myul").append($ah);
                    }
                    var $total="<span id='tt'>共"+data.num+"页</span>";
                    $("#goto").val(nn);
                    $("#myul").append($at);
                    //
                    //
                    //请求成功时执行该函数内容，result即为服务器返回的json对象
                    $.each(ss,function (index,topic){

                        var user;
                        //根据话题ID去查询用户
                        $.ajax({
                            type : "post",
                            method:"post",
                            url : "${path}/user/queryUser", //请求发送到Page处
                            data : {id:topic.id},
                            dataType : "json", //返回数据形式为json
                            success:function (userData){
                                //将获得的数据加入col-md-12 column

                                console.log(userData);
                                console.log(userData.username);
                               user=userData.username;
                                var $ab=
                                    "<small style='color: red'>[求助]</small>&nbsp;&nbsp;";
                                if (topic.status==1){
                                    $ab="<small style='color: green'>[已解决]</small>&nbsp;&nbsp;";
                                }
                                var $tr=
                                    " <tr><td class=\"new\"><a target=\"_blank\" href=\"${path}/commen.jsp?id="+topic.id+"\"><span class=\"glyphicon glyphicon-credit-card\"></span></a></td>" +
                                    "<td class=\"common\">"+$ab+"<a href=\"${path}/commen.jsp?id="+topic.id+"\">"+topic.title+"</a></td>"+
                                    "<td class=\"by\">"+userData.username+"</td>"+
                                    "<td class=\"num\"><a href=\"${path}/commen.jsp?id="+topic.id+"\"><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+topic.comment+"</a></td>"+
                                    "<td class=\"dd\"><span class=\"glyphicon glyphicon-pencil\"></span>&nbsp;"+topic.publish_date+"</a></td></tr></u>";
                                $("#mytable").append($tr);
                            }
                        })

                    })

                }
            });
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
                <a href="" class="navbar-brand"><span class="glyphicon glyphicon-list" aria-hidden="true"></span></a>
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
    <div class="col-md-10" id="contentBig">
        <div class="th">
            <table cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <th class="zhu" colspan="6">
                        <div>
                            <span onclick="setatarget(1)" class="y" title="在新窗口中打开帖子">新窗</span>
                            <a href="javascript:;" class="showmenu xi2" onclick="showMenu(this.id)">全部主题</a>&nbsp;

<span class="pipe">|</span>
</span>
                        </div>
                    </th>
                    <td class="by">作者</td>
                    <td class="look">回复/查看</td>
                    <td class="dat">发表时间</td>
                </tr>
                </tbody></table>
        </div>
        <table id="mytable"></table>
        <div class="pp">

            <nav aria-label="Page navigation">
                <a type="button"  style="height: 34px" id="publishabc" class="navbar-btn btn btn-primary">发帖</a>
                <div id="fo">


                <div class="input-group" id="go">
                    <span class="input-group-addon" id="pageTotal">ee</span>
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