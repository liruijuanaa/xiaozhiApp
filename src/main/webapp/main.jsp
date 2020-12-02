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
    <link type="text/css" rel="styleSheet"  href="${path}/style/main.css" />
    <script src="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.js"></script>

    <style>

    </style>
    <script>
        var u_id;
        var category_id;
        var nn;
        var pageNum;
        var options;
        $(function (){


            category_id = window.location.href.split("=")[1];
            console.log("一级类别ID是"+category_id)
            var username = sessionStorage.getItem("uname");

            var $sel = $("#select");
            options=$("#select option:first").val();
            $sel.change(function (){
                options = $("#select option:selected").val();
                // alert(options);
                yy(1);
            })
            // alert(options);
            <%--$.ajax({--%>
            <%--    type : "post",--%>
            <%--    method:"post",--%>
            <%--    url : "${path}/category/selectOne", //请求发送到Page处--%>
            <%--    data : {id:category_id},--%>
            <%--    dataType : "json", //返回数据形式为json--%>
            <%--    success:function (data){--%>
            <%--        console.log(data)--%>
                    var $za="<span style=\"color: lightgray\" class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span><em> > </em><a href=\"${path}/homePage.jsp?username="+username+"\">论坛首页</a><em>></em></div>";
                    $("#zz").append($za);
            //     }
            // })


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

            var $photoimg="欢迎 "+username+"</a></li>";
            $("#photoDiv").append($photoimg);

            $(document).click(function(e) { // 在页面任意位置点击而触发此事件
                // alert($(e.target().attr('id')));
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

            //创建类别
            $("#mkdirId").click(function (){
                location.href="${path}/mkdirCategory.jsp?name="+category_id+"";
            })
        })

        function yy(num){

            console.log("options的值是："+options)

            if (options==0){
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
                        var ss = data.subsystemList;
                        console.log(ss);
                        var total = data.total;
                        console.log("total"+total);
                        pageNum=data.num;
                        console.log(data.num);
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
                        //
                        //
                        //请求成功时执行该函数内容，result即为服务器返回的json对象
                        $.each(ss,function (index,topic){

                            var user;
                            //根据话题ID去查询用户
                            <%--$.ajax({--%>
                            <%--    type : "post",--%>
                            <%--    method:"post",--%>
                            <%--    url : "${path}/user/queryUser", //请求发送到Page处--%>
                            <%--    data : {id:topic.id},--%>
                            <%--    dataType : "json", //返回数据形式为json--%>
                            <%--    success:function (userData){--%>
                            <%--        //将获得的数据加入col-md-12 column--%>

                            <%--        console.log(userData);--%>
                            <%--        console.log(userData.username);--%>
                            <%--        user=userData.username;--%>
                            <%--        var $ab=--%>
                            <%--            "<small style='color: red'>[求助]</small>&nbsp;&nbsp;";--%>
                            <%--        if (topic.status==1){--%>
                            <%--            $ab="<small style='color: green'>[已解决]</small>&nbsp;&nbsp;";--%>
                            <%--        }--%>
                            <%--       --%>
                            <%--    }--%>
                            <%--})--%>
                            var $tr=
                                " <tr><td class=\"new\"><a target=\"_blank\" href=\"${path}/commen.jsp?id="+topic.id+"&name="+category_id+"\"><span class=\"glyphicon glyphicon-credit-card\"></span></a></td>" +
                                "<td class=\"common\"><a href=\"${path}/commen.jsp?id="+topic.id+"&name="+category_id+"\">"+topic.description+"</a></td>"+
                                // "<td class=\"by\">"+userData.username+"</td>"+
                                <%--"<td class=\"num\"><a href=\"${path}/commen.jsp?id="+topic.id+"\"><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+topic.comment+"</a></td>"+--%>
                                "<td class=\"dd\"><span class=\"glyphicon glyphicon-pencil\"></span>&nbsp;"+topic.create_time+"</a></td></tr></u>";
                            $("#mytable").append($tr);
                        })

                    }
                });
            }else {
                nn=num;
                $("#myul").empty();
                $("#mytable").empty();
                $("#num").css("class","active");
                $.ajax({
                    type : "post",
                    method:"post",
                    async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                    url : "${path}/category/queryRequest", //请求发送到Page处
                    data : {id:options,page:num},
                    dataType : "json", //返回数据形式为json
                    success:function(data) {
                        console.log(data);
                        var ss = data.subsystemList;
                        console.log(ss);
                        var total = data.total;
                        console.log("total"+total);
                        pageNum=data.num;
                        console.log(data.num);
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
                        //
                        //
                        //请求成功时执行该函数内容，result即为服务器返回的json对象
                        $.each(ss,function (index,topic){

                            var user;
                            var $tr=
                                " <tr><td class=\"new\"><a target=\"_blank\" href=\"${path}/commen.jsp?id="+topic.id+"&name="+category_id+"\"><span class=\"glyphicon glyphicon-credit-card\"></span></a></td>" +
                                "<td class=\"common\"><a href=\"${path}/commen.jsp?id="+topic.id+"&name="+category_id+"\">"+topic.description+"</a></td>"+
                                // "<td class=\"by\">"+userData.username+"</td>"+
                                <%--"<td class=\"num\"><a href=\"${path}/commen.jsp?id="+topic.id+"\"><span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+topic.comment+"</a></td>"+--%>
                                "<td class=\"dd\"><span class=\"glyphicon glyphicon-pencil\"></span>&nbsp;"+topic.create_time+"</a></td></tr></u>";
                            $("#mytable").append($tr);
                        })

                    }
                });
            }


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

            <div id="selsty">
                <div id="zz">


                </div>
                <div id="ccc">
                    <select id="select">
                        <option value="0">根据类别查询</option>
                    </select>
                </div>
            </div>
            <div id="threadlist" class="tl bm bmw">

                <div class="th" id="leftth">
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

<%--                            <td class="bys">作者</td>--%>
<%--                            <td class="look">回复/查看</td>--%>
                            <td class="dat">发表时间</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <table id="mytable"></table>
            </div>
            <div class="pp">

                <nav aria-label="Page navigation">
                    <a type="button"  style="height: 34px" id="publishabc" class="navbar-btn btn btn-primary">发帖</a>
                    <a type="button"  style="height: 34px" id="mkdirId" class="navbar-btn btn btn-primary">创建类别</a>
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
    <div class="col-md-2" id="rig">
        <ul class="list-group">

            <button class="list-group-item" id="myAttention">我关注的问题</button>
            <button id="myQuiz" class="list-group-item">我发出的问题</button>
        </ul>
    </div>
</div>



</body>
</html>