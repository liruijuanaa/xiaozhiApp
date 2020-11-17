<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>login</title>
    <script src="${path}/style/bootstrap/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/style/bootstrap/css/bootstrap.min.css"/>

    <script src="${path}/style/bootstrap/js/bootstrap.min.js"></script>
    <script src="${path}/style/js/jquery.backstretch.min.js"></script>
    <script src="${path}/style/js/jquery.validate.min.js"></script>
    <script src="${path}/shujv.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化，加载完成后执行
        window.onload=function(){
            search();
        };
        //搜索按钮绑定回车事件
        document.onkeydown = function(event){
            if (event.keyCode == 13) {
                event.cancelBubble = true;
                event.returnValue = false;
                search();
            }
        }

        //下一步
        function next(){
            //得到当前选中项的页号
            var id=$("#pageNum option:selected").val();
            //计算下一页的页号
            var nextPage=parseInt(id)+1;
            //得到select的option集合
            var list=document.getElementById("pageNum").options;
            //得到select中，下一页的option
            var nextOption=list[nextPage-1];
            //修改select的选中项
            nextOption.selected=true;
            //调用查询方法
            search();
        }

        //上一步
        function previous(){

            //得到当前选中项的页号
            var id=$("#pageNum option:selected").val();
            //计算上一页的页号
            var previousPage=parseInt(id)-1;
            //得到select的option集合
            var list=document.getElementById("pageNum").options;
            //得到select中，上一页的option
            var previousOption=list[previousPage-1];
            //修改select的选中项
            previousOption.selected=true;
            //调用查询方法
            search();
        }
        //搜索，模糊查询学生违纪信息
        function search(){
            //得到查询条件
            var searchString=$("#searchString").val();
            //得到每页显示条数
            var pageSize=$("#pageSize").val();
            //得到显示第几页
            var pageNum=$("#pageNum").val();

            $.ajax({
                type: "POST",
                async: false,
                url: "queryStudentDisciplineByPage",
                data:{"searchString":searchString,
                    "pageSize":pageSize,
                    "pageNum":pageNum,
                },
                dataType:"text",
                success: function (data) {

                    //将json字符串转为json对象
                    var pageEntity=JSON.parse(data);
                    //得到结果集
                    var obj=pageEntity["rows"];

                    //将除模板行的thead删除，即删除之前的数据重新加载
                    $("thead").eq(0).nextAll().remove();
                    //将获取到的数据动态的加载到table中
                    for (var i = 0; i < obj.length; i++) {
                        //获取模板行，复制一行
                        var row = $("#tem").clone();

                        //给每一行赋值
                        row.find("#studentId").text(obj[i].studentId); //学号
                        row.find("#studentName").text(obj[i].studentName); //学生姓名
                        row.find("#courseId").text(obj[i].courseId); //课程名称
                        row.find("#examRoomId").text(obj[i].examRoomId); //考场号
                        row.find("#className").text(obj[i].className); //所属班级
                        row.find("#teacherId").text(obj[i].teacherId); //监考教师Id

                        //将新行添加到表格中
                        row.appendTo("#table");
                    }
                    //当前记录总数
                    var pageNumCount=pageEntity["total"];
                    //当前记录开始数
                    var pageNumBegin=(pageNum-1)*pageSize+1;
                    //当前记录结束数
                    var pageNumEnd=pageNum*pageSize
                    //如果结束数大于记录总数，则等于记录总数
                    if(pageNumEnd>pageNumCount){
                        pageNumEnd=pageNumCount;
                    }
                    //得到总页数
                    var pageCount;
                    if(pageNumCount/pageSize==0){
                        pageCount=pageNumCount/pageSize;
                    }else{
                        pageCount=Math.ceil(pageNumCount/pageSize);
                    }

                    //输出"显示第 1 至 10 项记录，共 57 项"
                    document.getElementById("DataTables_Table_0_info").innerHTML=
                        "显示第"+pageNumBegin.toString()
                        +" 至 "+pageNumEnd.toString()
                        +" 项记录，共 "+pageNumCount.toString()+" 项";

                    //显示所有的页码数
                    var pageSelect =document.getElementById("page");
                    var pageOption="";
                    var flag;
                    //删除select下所有的option，清除所有页码
                    document.getElementById("pageNum").options.length=0;
                    for(var i=0;i<pageCount;i++){
                        flag=(i+1).toString();
                        var option;
                        //如果等于当前页码
                        if(flag==pageNum){
                            //实例化一个option,则当前页码为选中状态
                            option=new Option(flag, flag, false, true);
                        }else{
                            option=new Option(flag, flag, false, false);
                        }
                        //将option加入select中
                        document.getElementById("pageNum").options.add(option);
                    }

                }
            });
        }

    </script>

</head>

<!-- 搜索区域 -->
<div class="row" style="padding-bottom: 20px;margin-top:20px;">
    <!-- 搜索框的长度为该行的3/4 -->
    <div class="col-md-9">
        <div class="input-group">
            <input id="searchString" type="text" style="height:28px;" class="form-control" placeholder="请输入实体名">
            <span class="input-group-btn">
  　　  <button type="button" class="btn btn-info" onclick="search()" onkeypress="Enter()">
   <span class="glyphicon glyphicon-search" aria-hidden="true"/>
   搜索
   </button>
  </span>
        </div>
    </div>
</div>

<!-- 表格显示 -->
<div class="row">
    <div class="col-md-12" style="margin-top:20px;">
        <div class="panel panel-info">
            <div class="panel-heading">学生违纪信息</div>
            <table id="table" class="table table-striped table-bordered table-hover datatable">
                <thead id="tem">
                <th id="studentId">学号</th>
                <th id="studentName">姓名</th>
                <th id="courseId">考试科目</th>
                <th id="examRoomId">考场号</th>
                <th id="className">班级</th>
                <th id="teacherId">监考人员</th>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 页面底部显示 -->
<!-- 每页显示几条记录 -->
<div id="bottomTool" class="row-fluid" >
    <!-- 显示第 1 至 10 项记录，共 57 项 -->
    <div class="span6" style="width:25%;" >
        <div id="DataTables_Table_0_info" class="dataTables_info">显示第 1 至 10 项记录，共 57 项</div>
    </div>
    <!-- 第2页 -->
    <div class="span6" style="width:30%;">
        <div class="dataTables_paginate paging_bootstrap pagination">
            <ul id="previousNext">
                <li onclick="previous()" class="prev disabled"><a id="previousPage" href="#">← 上一页</a></li>
                <div id="page" style="float:left;">
                    <select id="pageNum" onchange="search()"
                            style="width:50PX;margin-right:1px;" aria-controls="DataTables_Table_0" size="1" name="DataTables_Table_0_length">
                        <option selected="selected" value="1">1</option>
                    </select>
                </div>
                <li class="next" onclick="next()"><a id="nextPage" href="#">下一页 → </a></li>
            </ul>
        </div>
    </div>

</div>
</body>
</html>


</body>
</html>