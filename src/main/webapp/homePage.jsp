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
    <link type="text/css" rel="styleSheet"  href="${path}/style/homePage.css" />
    <script src="${path}/style/js/bootstrap.min.js"></script>
    <script>

        $(function (){

            var $za="<span style=\"color: lightgray\" class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span><em> > </em><a href=\"${path}/homePage.jsp?username="+username+"\">论坛首页</a>";
            $("#zz").append($za);

            var username = window.location.href.split("=")[1];
            sessionStorage.setItem("uname",username);
            //查询用户ID
            $.ajax({
                url:"${path}/user/selectOne",
                dataType:"JSON",
                data:{username:username},
                type:"post",
                method:"post",
                success:function (data){

                    console.log(data);
                    u_id=sessionStorage.setItem("id",data.id);
                    sessionStorage.setItem("autho",data.usergroup);
                    var $photoimg="欢迎 "+data.username+"  <img src=\"${path}\" class=\"img-circle\" alt=\"\" width=\"30px\" height=\"30px\"></a></li>";
                    $("#photoDiv").append($photoimg);
                }
            });
            //查询所有一级类别
            var $TABLE = $("#showTable");

            $.ajax({
                url:"${path}/category/queryAll",
                dataType:"JSON",
                type:"post",
                method:"post",
                success:function (data){

                    console.log("查询所有一级类别：")
                    console.log(data);

                    $.each(data,function (index,firstCategory){
                        index=index+2;

                        //如果index/2等于0，则开始创建tr
                        console.log("index的值： "+index%2)
                        <%--$.ajax({--%>
                        <%--    url:"${path}/category/queryLatest",--%>
                        <%--    dataType:"JSON",--%>
                        <%--    type:"post",--%>
                        <%--    method:"post",--%>
                        <%--    data:{id:firstCategory.id},--%>
                        <%--    success:function (dd){--%>
                        <%--        console.log("最新发布的帖子")--%>
                        <%--        console.log(dd);--%>


                        <%--    }--%>
                        <%--})--%>

                        if (index%2==0){
                            var $tr="<tr class=\"fl_row\">";
                            var $tdf="<td class=\"fl_g\" width=\"49.9%\">\n" +
                                "                        <div class=\"fl_icn_g\">\n" +
                                "                            <a href=\"${path}/main.jsp?category_id="+firstCategory.name+"\"><img src=\"${path}/style/img/pkq01.jpg\" alt=\""+firstCategory.description+"\"></a>\n" +
                                "                        </div>\n" +
                                "                        <dl>\n" +
                                "                            <dt><a href=\"${path}/main.jsp?category_id="+firstCategory.name+"\" style=\"color: blue;\">"+firstCategory.description+"</a><em class=\"xw0 xi1\" title=\"今日\"> </em></dt>\n" +

                                // "                            <a href=\"forum.php?mod=redirect&amp;tid=3852549&amp;goto=lastpost#lastpost\" class=\"xi2\"></a> <cite><span title=\"2020-11-24 08:32\"></span> <a href=\"home.php?mod=space&amp;username=allthebest\">allthebest</a></cite>\n" +
                                "                        </dd>\n" +
                                "                        </dl>\n" +
                                "                    </td>";
                        }else {
                            var $tdt="<td class=\"fl_g\" width=\"49.9%\">\n" +
                                "                        <div class=\"fl_icn_g\">\n" +
                                "                            <a href=\"${path}/main.jsp?category_id="+firstCategory.name+"\"><img src=\"${path}/style/img/pkq01.jpg\" alt=\""+firstCategory.description+"\"></a>\n" +
                                "                        </div>\n" +
                                "                        <dl>\n" +
                                "                            <dt><a href=\"${path}/main.jsp?category_id="+firstCategory.name+"\" style=\"color: blue;\">"+firstCategory.description+"</a><em class=\"xw0 xi1\" title=\"今日\"> </em></dt>\n" +

                                // "                            <a href=\"forum.php?mod=redirect&amp;tid=3852722&amp;goto=lastpost#lastpost\" class=\"xi2\"></a> <cite><span title=\"\"></span> <a href=\"home.php?mod=space&amp;username=starrivers3000\">starrivers3000</a></cite>\n" +
                                "                        </dd>\n" +
                                "                        </dl>\n" +
                                "                    </td>\n" +
                                "                </tr>";
                        }

                        $TABLE.append($tr).append($tdf).append($tdt);
                    })
                }
            });

            $("#myAttention").click(function (){
                location.href = "${path}/attention.jsp"
            })
            $("#myQuiz").click(function (){
                location.href = "${path}/myPublish.jsp"
            })

            $("#mkdirTheme").click(function (){

                location.href="${path}/mkdirTheme.jsp";
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

                    <li><a href="${path}/homePage.jsp">首页</a></li>

                </ul>


                <div class="navbar-btn navbar-right" style="background-color: transparent" id="photoDiv">

                </div>

            </div>
        </div>
    </div>
    <!--左侧-->
    <div class="col-md-10" id="contentBig">

            <div class="zz">
               </div>

        <div class="mn">
            <div class="fl bm">
<%--                <div class="bm bmw  cl">--%>
<%--                    <div class="bm_h cl">--%>
<%--&lt;%&ndash;<span class="o">&ndash;%&gt;--%>
<%--&lt;%&ndash;<img id="category_30_img" src="static/image/common/collapsed_no.gif" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_30');">&ndash;%&gt;--%>
<%--&lt;%&ndash;</span>&ndash;%&gt;--%>
<%--                        <h2 id="cc"><a  href="#" style="">xxx</a></h2>--%>
<%--                    </div>--%>
<%--                    <div id="category_30" class="bm_c" style="">--%>
<%--                        <table class="fl_tb" cellspacing="0" cellpadding="0">--%>
<%--                            <tbody><tr><td class="fl_icn">--%>
<%--                                <a href="forum-10-1.html"><img src="static/image/common/forum.gif" alt="xx"></a>--%>
<%--                            </td>--%>
<%--                                <td>--%>
<%--                                    <h2><a href="" style="color: red;">xx</a></h2>--%>
<%--                                    <p class="xg2">xxxxxxxxxxx</p><p>版主: <span class="xi2"><a href="home.php?mod=space&amp;username=monkeye" class="notabs" c="1" mid="card_9140">monkeye</a>, <a href="home.php?mod=space&amp;username=oldhu" class="notabs" c="1" mid="card_6674">oldhu</a></span></p></td>--%>
<%--                                <td class="fl_i">--%>
<%--                                    <span class="xi2">86</span><span class="xg1"> / 4185</span></td>--%>
<%--                                <td class="fl_by">--%>
<%--                                    <div>--%>
<%--                                        <a href="forum.php?mod=redirect&amp;tid=2141686&amp;goto=lastpost#lastpost" class="xi2">xxx ...</a> <cite><span title="2020-11-19 07:20">7&nbsp;天前</span> <a href="home.php?mod=space&amp;username=abcnic1">abcnic1</a></cite>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr class="fl_row">--%>
<%--                            </tr>--%>
<%--                            </tbody></table>--%>
<%--                    </div>--%>
<%--                </div><div class="bm bmw  flg cl">--%>
        <div class="bm_h cl">
<%--            <span class="o">--%>
<%--                <img id="category_1_img" src="static/image/common/collapsed_no.gif" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_1');">--%>
<%--            </span>--%>
            <h2 id="cc"><a href="" style="">PunchList</a></h2>
        </div>
        <div id="category_1" class="bm_c" style="">
            <table class="fl_tb" cellspacing="0" cellpadding="0" width="920px">
                <tbody id="showTable">


                </tbody></table>
        </div>

    </div>
<%--            <a type="button"  style="height: 34px" id="mkdirTheme" class="navbar-btn btn btn-primary">创建主题</a>--%>
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

</div>
</body>
</html>