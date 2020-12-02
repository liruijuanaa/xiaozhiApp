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
        body, input, button, select, textarea {
            font: 12px/1.5 Tahoma,'Microsoft Yahei','Simsun';
            color: #444;
        }
        .mn {
            overflow: hidden;
        }
        .fl {
            border: 1px solid #CDCDCD;

            background: #FFF;
        }
        .bm {
            border: 1px solid #CDCDCD;
            background: #FFF;
        }
        .bm, .bn {
            margin-bottom: 10px;
        }
        .fl .bm {
            margin-bottom: 0;
            border: none;
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
        .fl .bm_h {
            border-width: 1px 0;
            border-color: #C2D5E3;
            background: #E5EDF2 url("https://www.discuz.net/static/image/common/titlebg.png") repeat-x 0 0;
        }
        .bmw .bm_h {
            border-right: 1px solid #FFF;
            border-left: 1px solid #FFF;
        }
        .bm_h {
            padding: 0 10px;
            height: 31px;
            border-top: 1px solid #FFF;
            border-bottom: 1px solid #C2D5E3;
            line-height: 31px;
            white-space: nowrap;
            overflow: hidden;
        }
        .bm_h .o {
            float: right;
            width: 30px;
        }
        h1, h2, h3, h4, h5, h6 {
            font-size: 1em;
        }
        .fl .bm_c, #online .bm_c, .lk .bm_c {
            padding-top: 0;
            padding-bottom: 0;
        }
        .bm_c {
            padding: 10px;}

        元素 {

        }
        .fl_tb {

            width: 100%;

        }
        table {

            empty-cells: show;
            border-collapse: collapse;

        }
        .fl_tb td {
            padding: 10px 0;

        }
        .fl_icn {
            padding-right: 10px !important;
            width: 31px;
        }
        .fl_tb td {
            padding: 10px 0;
        }
        .fl_i {
            width: 150px;
            text-align: right;
        }
        .fl_by {
            width: 220px;
        }
        .fl .bm {
            margin-bottom: 0;
            border: none;
        }
        .fl .bm_h {
            border-width: 1px 0;
            border-color: #C2D5E3;
            background: #E5EDF2 url("https://www.discuz.net/static/image/common/titlebg.png") repeat-x 0 0;
        }
        .bmw .bm_h {

            border-right: 1px solid #FFF;


            border-left: 1px solid #FFF;


        }
        .bm_h {
            padding: 0 10px;
            height: 31px;
            border-top: 1px solid #FFF;

            border-bottom: 1px solid #C2D5E3;


            line-height: 31px;
            white-space: nowrap;
            overflow: hidden;
        }
        .fl .bm_c, #online .bm_c, .lk .bm_c {
            padding-top: 0;
            padding-bottom: 0;
        }
        .bm_c {
            padding: 10px;}
        .fl_tb {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="mn">
    <div class="fl bm">
        <div class="bm bmw  cl">
            <div class="bm_h cl">
<span class="o">
<img id="category_30_img" src="static/image/common/collapsed_no.gif" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_30');">
</span>
                <h2><a href="forum.php?gid=30" style="">Discuz! 产品动态</a></h2>
            </div>
            <div id="category_30" class="bm_c" style="">
                <table class="fl_tb" cellspacing="0" cellpadding="0">
                    <tbody><tr><td class="fl_icn">
                        <a href="forum-10-1.html"><img src="static/image/common/forum.gif" alt="Discuz! 官方发布"></a>
                    </td>
                        <td>
                            <h2><a href="forum-10-1.html" style="color: red;">Discuz! 官方发布</a></h2>
                            <p class="xg2">第一时间提供 Discuz! 论坛最新程序、升级补丁、转换程序的免费下载，请随时关注新版本动态。</p><p>版主: <span class="xi2"><a href="home.php?mod=space&amp;username=monkeye" class="notabs" c="1" mid="card_9140">monkeye</a>, <a href="home.php?mod=space&amp;username=oldhu" class="notabs" c="1" mid="card_6674">oldhu</a></span></p></td>
                        <td class="fl_i">
                            <span class="xi2">86</span><span class="xg1"> / 4185</span></td>
                        <td class="fl_by">
                            <div>
                                <a href="forum.php?mod=redirect&amp;tid=2141686&amp;goto=lastpost#lastpost" class="xi2">Comsenz 核心产品 Discuz! X2 RC ...</a> <cite><span title="2020-11-19 07:20">7&nbsp;天前</span> <a href="home.php?mod=space&amp;username=abcnic1">abcnic1</a></cite>
                            </div>
                        </td>
                    </tr>
                    <tr class="fl_row">
                    </tr>
                    </tbody></table>
            </div>
        </div><div class="bm bmw  flg cl">


    </div>
    </div>
</div>

</body>
</html>

