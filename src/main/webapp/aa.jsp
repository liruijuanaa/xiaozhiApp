<%--<%@ page language="java" contentType="text/html; charset=utf-8"--%>
<%--         pageEncoding="utf-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<c:set var="path" value="${pageContext.request.contextPath}"/>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="zh">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8"/>--%>
<%--    <!--在手机网站，都需要加上视口约束！！！-->--%>
<%--    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>--%>
<%--    <!--以最新的内核渲染页面-->--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>--%>
<%--    <title>回答问题</title>--%>
<%--    <!--引入css文件-->--%>

<%--    <script src="${path}/style/js/jquery-3.3.1.min.js"></script>--%>
<%--    <script src="${path}/style/js/jquery.backstretch.min.js"></script>--%>
<%--    <script src="${path}/style/js/jquery.validate.min.js"></script>--%>
<%--    <link rel="stylesheet" type="text/css" href="${path}/style/css/bootstrap.css"/>--%>

<%--    <script src="${path}/style/js/bootstrap.min.js"></script>--%>
<%--    <script>--%>

<%--        $(function (){--%>
<%--            var u_id = sessionStorage.getItem("id")--%>
<%--            var username = sessionStorage.getItem("uname");--%>
<%--            var autho = sessionStorage.getItem("autho");--%>
<%--            console.log("u_id"+u_id);--%>
<%--            console.log("用户权限："+autho);--%>
<%--            // var splitElement = window.location.href.split("=")[1];--%>
<%--            var $panelList=$("#panelList");--%>
<%--            // var themeName = window.location.href.split("=")[2];--%>
<%--            // alert("themename"+splitElement);--%>

<%--            if(document.URL.indexOf("?")<0) return;//获取当前url地址,如果没参数.直接返回--%>
<%--            var str=document.URL.split("?")[1];--%>
<%--            var obj={};--%>
<%--            var arr;--%>

<%--            //当有多个参数时--%>
<%--            arr=str.split("&");--%>
<%--            var arr1;--%>
<%--            for(var i=0;i<arr.length;i++){--%>
<%--                arr1=arr[i].split("=");--%>
<%--                obj[arr1[0]]=arr1[1];--%>
<%--            }--%>
<%--            var splitElement =obj.id;--%>
<%--            var themeName=obj.name;--%>


<%--            console.log(splitElement);--%>

<%--            var $za="<span style=\"color: lightgray\" class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span><em> > </em><a href=\"${path}/homePage.jsp?username="+username+"\">论坛首页</a><em>></em><a href=\"${path}/main.jsp?category_id="+themeName+"\">"+themeName+"</a></div>";--%>
<%--            $("#zz").append($za);--%>

<%--            yy(1);--%>
<%--            $("#gg").click(function (){--%>
<%--                var val = $("#goto").val();--%>
<%--                console.log("文本框输入的值是"+val)--%>
<%--                yy(val);--%>
<%--            })--%>


<%--            //查询用户--%>
<%--            $.ajax({--%>
<%--                url:"${path}/user/selectOne",--%>
<%--                dataType:"JSON",--%>
<%--                data:{username:username},--%>
<%--                type:"post",--%>
<%--                method:"post",--%>
<%--                success:function (data){--%>

<%--                    console.log(data)--%>
<%--                    var $photoimg="欢迎 "+data.username+"  <img src=\"${path}"+data.photo+"\" class=\"img-circle\" alt=\"\" width=\"30px\" height=\"30px\"></a></li>";--%>
<%--                    $("#photoDiv").append($photoimg);--%>
<%--                }--%>
<%--            });--%>
<%--            --%>
<%--            var $submitForm = $("#submitForm");--%>
<%--            if (autho=='admin'){--%>
<%--                var $nr="<div class=\"form-group\">\n" +--%>
<%--                    "                    <input type=\"hidden\" name=\"id\" value=\"012\">\n" +--%>
<%--                    "                    <input type=\"hidden\" name=\"name\" value=\"0\">\n" +--%>
<%--                    "                    <input type=\"hidden\" name=\"USER_ID\" value=\""+u_id+"\">\n"+--%>
<%--                    "                    <input type=\"hidden\" name=\"pid\" value=\""+splitElement+"\">\n" +--%>
<%--                    "                    <label for=\"name\">写回答</label>\n" +--%>
<%--                    "                    <textarea  rows=\"5px\" id=\"name\" class=\"form-control\" placeholder=\"写下您的回答....\" name=\"description\"></textarea>\n" +--%>
<%--                    "                </div>\n" +--%>
<%--                    "                <button type=\"button\" id=\"submitApply\" class=\"btn btn-primary block full-width m-b\">提交回答</button>";--%>
<%--            }else {--%>
<%--                var $nr="<div class=\"form-group\">\n" +--%>
<%--                    "                    <input type=\"hidden\" name=\"id\" value=\"012\">\n" +--%>
<%--                    "                    <input type=\"hidden\" name=\"name\" value=\"0\">\n" +--%>
<%--                    "                    <input type=\"hidden\" name=\"USER_ID\" value=\""+u_id+"\">\n"+--%>
<%--                    "                    <input type=\"hidden\" name=\"pid\" value=\""+splitElement+"\">\n" +--%>
<%--                    "                    <label for=\"name\">写回答</label>\n" +--%>
<%--                    "                    <textarea disabled rows=\"5px\" id=\"name\" class=\"form-control\" placeholder=\"您现在无权发帖....\" name=\"description\"></textarea>\n" +--%>
<%--                    "                </div>\n" +--%>
<%--                    "                <button disabled type=\"button\" id=\"submitApply\" class=\"btn btn-primary block full-width m-b\">提交回答</button>";--%>
<%--            }--%>

<%--            $submitForm.append($nr);--%>

<%--            //写回答--%>
<%--            $("#submitApply").click(function (){--%>
<%--                $.ajax({--%>
<%--                    url:"${path}/comment/addComment",--%>
<%--                    contentType: 'application/json;charset=UTF-8',--%>
<%--                    dataType: "text",--%>
<%--                    data: $("#submitForm").serialize(),--%>
<%--                    success:function (data){--%>
<%--                        location.href="${path}/commen.jsp?id="+splitElement+"";--%>
<%--                    }--%>
<%--                })--%>
<%--            })--%>

<%--            $.ajax({--%>
<%--                url:"${path}/user/queryIfAtten",--%>
<%--                dataType:"json",--%>
<%--                type:"post",--%>
<%--                data:{id:u_id},--%>
<%--                success:function (data){--%>

<%--                    console.log(data)--%>
<%--                    $.each(data,function (index,atten){--%>
<%--                        console.log(atten.topic_id)--%>
<%--                        if (splitElement==atten.topic_id){--%>
<%--                            $("#adda").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"dela\">取消关注</button>")--%>
<%--                        }--%>
<%--                    })--%>
<%--                }--%>
<%--            })--%>
<%--            $("#nonice").on('click','#adda',function (){--%>
<%--                $.ajax({--%>
<%--                    url:"${path}/user/addAtten",--%>
<%--                    type:"post",--%>
<%--                    method:"post",--%>
<%--                    dataType:"json",--%>
<%--                    data:{user_id:u_id,topic_id:splitElement},--%>
<%--                    success:function (data){--%>
<%--                        $("#adda").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"dela\">取消关注</button>")--%>
<%--                    }--%>
<%--                })--%>
<%--            })--%>
<%--            //取消关注--%>
<%--            $("#nonice").on('click','#dela',function (){--%>
<%--                $.ajax({--%>
<%--                    url:"${path}/user/delAtten",--%>
<%--                    type:"post",--%>
<%--                    method:"post",--%>
<%--                    dataType:"json",--%>
<%--                    data:{user_id:u_id,topic_id: splitElement},--%>
<%--                    success:function (data){--%>
<%--                        // $("#adda").text("取消关注")--%>
<%--                        $("#dela").replaceWith(" <button type=\"button\" class=\"btn btn-primary\" id=\"adda\">关注问题</button>")--%>
<%--                        // $("#adda").html()--%>
<%--                    }--%>
<%--                })--%>
<%--            })--%>

<%--            $("#myAttention").click(function (){--%>
<%--                location.href = "${path}/attention.jsp"--%>
<%--            })--%>
<%--            $("#myQuiz").click(function (){--%>
<%--                location.href = "${path}/myPublish.jsp"--%>
<%--            })--%>
<%--        })--%>

<%--        var nn;--%>
<%--        var pageNum;--%>
<%--        function yy(num){--%>
<%--            nn=num;--%>
<%--            $("#myul").empty();--%>
<%--            $panelList.empty();--%>
<%--            $("#num").css("class","active");--%>
<%--            $.ajax({--%>
<%--                url:"${path}/user/queryAtten",--%>
<%--                dataType:"json",--%>
<%--                type:"post",--%>
<%--                data:{id:uid,page:num},--%>
<%--                success:function (data){--%>
<%--                    console.log(data)--%>

<%--                    var ss = data.attlist;--%>
<%--                    var total = data.total;--%>
<%--                    console.log(ss);--%>
<%--                    // console.log("total"+total);--%>
<%--                    pageNum=data.num;--%>
<%--                    $("#pageTotal").text("共"+data.num+"页");--%>
<%--                    var $ao="        <li id=\"pp\" style=\"cursor: pointer\">\n" +--%>
<%--                        "            <a aria-label=\"Previous\" id=\"prevStatu\" onclick=\"prevId()\">\n" +--%>
<%--                        "                <span aria-hidden=\"true\">&laquo;</span>\n" +--%>
<%--                        "            </a>\n" +--%>
<%--                        "        </li>";--%>
<%--                    var $at="            <li  style=\"cursor: pointer\"><a aria-label=\"Next\" id=\"nextStatu\" onclick=\"nextId()\">\n" +--%>
<%--                        "                <span aria-hidden=\"true\">&raquo;</span>\n" +--%>
<%--                        "            </a>\n" +--%>
<%--                        "        </li>";--%>
<%--                    $("#myul").append($ao);--%>
<%--                    for (var i in total){--%>

<%--                        var $ah="<li style=\"cursor: pointer\"><a id=\""+total[i]+"\" onclick=\"yy("+total[i]+")\">"+total[i]+"</a></li>";--%>
<%--                        $("#aa").addClass('active')--%>

<%--                        $("#myul").append($ah);--%>
<%--                    }--%>
<%--                    var $total="<span id='tt'>共"+data.num+"页</span>";--%>
<%--                    $("#goto").val(nn);--%>
<%--                    $("#myul").append($at);--%>

<%--                    $.each(ss,function (index,atten){--%>
<%--                        console.log(atten.topic_id);--%>

<%--                        &lt;%&ndash;var $titlehr="<div class=\"panel\">\n" +&ndash;%&gt;--%>
<%--                        &lt;%&ndash;    "                            <div class=\"panel-body\">\n" +&ndash;%&gt;--%>
<%--                        &lt;%&ndash;    "                                <p>\n" +&ndash;%&gt;--%>
<%--                        &lt;%&ndash;    "                                    <h3><a href=\"${path}/commen.jsp?id="+atten.id+"\">"+atten.name+"</a></h3>" +&ndash;%&gt;--%>
<%--                        &lt;%&ndash;    "                                </p>\n" +&ndash;%&gt;--%>
<%--                        &lt;%&ndash;    "                            </div>";&ndash;%&gt;--%>

<%--                        &lt;%&ndash;$panelList.append($titlehr);&ndash;%&gt;--%>

<%--                        $.ajax({--%>
<%--                            url:"${path}/topic/selectOne",--%>
<%--                            dataType: "json",--%>
<%--                            type: "post",--%>
<%--                            data:{id:atten.topic_id},--%>
<%--                            success:function (data){--%>
<%--                                // var themeNa;--%>
<%--                                //根据icon去查询等级为0的--%>
<%--                                $.ajax({--%>
<%--                                    url:"${path}/topic/queryThemeName",--%>
<%--                                    dataType:"json",--%>
<%--                                    type:"post",--%>
<%--                                    data:{icon:data.icon},--%>
<%--                                    success:function (dd){--%>
<%--                                        var themeNa = dd.name;--%>

<%--                                        console.log(data)--%>
<%--                                        var $titlehr="<div class=\"panel\">\n" +--%>
<%--                                            "                            <div class=\"panel-body\">\n" +--%>
<%--                                            "                                <p>\n" +--%>
<%--                                            "                                    <h3><a href=\"${path}/commen.jsp?id="+data.id+"&name="+themeNa+"\">"+data.name+"</a></h3>" +--%>
<%--                                            "                                </p>\n" +--%>
<%--                                            "                            </div>";--%>
<%--                                        var $cctr=" <div class=\"panel-footer\" style=\"background-color: white;\">\n" +--%>

<%--                                            "                        </div>";--%>
<%--                                        &lt;%&ndash;var $titlehr=" <h3><a href=\"${path}/commen.jsp?id="+data.id+"\">"+data.title+"</a></h3>";&ndash;%&gt;--%>
<%--                                        // var $prisetr="<span class=\"glyphicon glyphicon-thumbs-up\"></span>"+data.prise+"赞</a>";--%>
<%--                                        // var $comment="<span class=\"glyphicon glyphicon-comment\"></span>&nbsp;"+data.comment+"条评论</a>";--%>
<%--                                        $panelList.append($titlehr).append($cctr);--%>
<%--                                    }--%>
<%--                                })--%>



<%--                            }--%>
<%--                        })--%>
<%--                    })--%>
<%--                }--%>
<%--            })--%>
<%--        }--%>
<%--        --%>
<%--        function nextId(){--%>
<%--            if (nn==pageNum||nn>pageNum){--%>
<%--                yy(nn)--%>

<%--            }else {--%>
<%--                yy(nn+1);--%>
<%--            }--%>

<%--        }--%>
<%--        function prevId(){--%>
<%--            if (nn==1||nn<1){--%>
<%--                $("#pp").addClass('disabled');--%>
<%--                yy(nn);--%>
<%--            }else {--%>

<%--                yy(nn-1);--%>
<%--            }--%>

<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <!--顶部导航-->--%>
<%--    <div class="navbar navbar-default " id="navbar-top">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="navbar-header">--%>
<%--                <a href="" class="navbar-brand"><span class="glyphicon glyphicon-th-large"></span></a>--%>
<%--                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu-1">--%>
<%--                    <span class="caret"></span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="navbar-collapse collapse" id="menu-1">--%>

<%--                <ul class="nav navbar-nav">--%>

<%--                    <li><a href="homePage.jsp">首页</a></li>--%>

<%--                </ul>--%>

<%--                &lt;%&ndash;                <a href="${path}/quiz.jsp" type="button" class="navbar-btn btn btn-primary">发帖</a>&ndash;%&gt;--%>
<%--                <div class="navbar-btn navbar-right" style="background-color: transparent" id="photoDiv">--%>

<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!--左侧-->--%>
<%--    <div class="col-md-10">--%>
<%--        <div id="zz">--%>

<%--            <div class="z">--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="panel">--%>
<%--            <div class="panel-heading text-danger" id="nonice">--%>
<%--                <button type="button" class="btn btn-primary" id="adda">关注问题</button>--%>
<%--            </div>--%>
<%--            <div class="panel-body" id="panelList">--%>

<%--            </div>--%>
<%--            <div class="panel-footer" id="topicfooter">--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <!--回答区-->--%>
<%--        <div class="panel">--%>
<%--            <!---写回答------>--%>
<%--            <a name="comment"></a>--%>
<%--            <form role="form" id="submitForm" method="post">--%>

<%--            </form>--%>
<%--        </div>--%>
<%--        <!--分页区-->--%>
<%--        <div class="pp">--%>

<%--            <nav aria-label="Page navigation">--%>

<%--                <div id="fo">--%>


<%--                    <div class="input-group" id="go">--%>
<%--                        <span class="input-group-addon" id="pageTotal">ee</span>--%>
<%--                        <input type="text" style="width: 60px" class="form-control" id="goto">--%>

<%--                        <button class="btn btn-default" type="button" id="gg">Go!</button>--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                    <ul class="pagination" id="myul">--%>


<%--                    </ul>--%>
<%--                </div>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!--右侧-->--%>
<%--    <div class="col-md-2">--%>
<%--        <ul class="list-group">--%>

<%--            <button class="list-group-item" id="myAttention">我关注的问题</button>--%>
<%--            <button id="myQuiz" class="list-group-item">我发出的问题</button>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<!--引入jQuery-->--%>
<%--<script src="IdeaProjects/xiaozhiApp/src/main/webapp/style/js/jquery-3.3.1.min.js" type="text/javascript"></script>--%>
<%--<!--引入js文件-->--%>
<%--<script src="IdeaProjects/xiaozhiApp/src/main/webapp/style/js/bootstrap.min.js" type="text/javascript"></script>--%>
<%--</body>--%>
<%--</html>--%>