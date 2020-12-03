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
    <style>

        ul.tab_but li.current {
            position: relative;
            background: #fff;
            border-bottom: 0;
            height: 26px;
            line_height: 27px;
            font-weight: 700;
        }

    </style>
    <script src="${path}/style/js/bootstrap.min.js"></script>
    <script>
        var options;
        var options2;
        $(function (){

            $("#lei li").click(function() {
                $(this).siblings('li').removeClass('current');  // 删除其他兄弟元素的样式
                $(this).addClass('current');                            // 添加当前元素的样式
            })

            var category_id = window.location.href.split("=")[1];
            var $sel = $("#select");
            var $sel2 = $("#select2");
            options=$("#select option:first").val();
            options2=$("#select2 option:first").val();

            $sel.change(function (){
                options = $("#select option:selected").val();
                alert(options);
                $("#select2").empty();
                $.ajax({
                    type : "post",
                    method:"post",
                    async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                    url : "${path}/category/queryTwoCategory2", //请求发送到Page处
                    data : {category_id:options},
                    dataType : "json", //返回数据形式为json
                    success:function(data) {
                        console.log("------")
                        console.log(data);
                        var $top=" <option value=\"0\">根据二级类别查询</option>";
                        $sel2.append($top);
                        $.each(data,function (index,cat){

                            var $op="<option value=\""+cat.id+"\">"+cat.description+"</option>";
                            $sel2.append($op);
                        })
                    }
                });
            })
            $sel2.change(function (){
                options2=$("#select2 option:selected").val();
                alert("options2的值是："+options2)
            })
            console.log("options"+options);
            console.log("options2"+options2)
            //遍历0级类别下的1级类别  页面加载时进行展示
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
        })
    </script>
</head>
<body>
<select id="select">
    <option value="0">根据类别查询</option>
</select>
<select id="select2">
    <option value="0">根据二级类别查询</option>
</select>

<ul class="J_tabs tab_but cu_li" id="lei">
    <li value="1">参与用户</li>
    <li value="2">抽奖</li>
    <li value="3">新老玩家</li>
    <li value="4">点击数</li>
    <li value="5">帮砍用户机型</li>
    <li value="6">砍价完成</li>
</ul>
</body>
</html>