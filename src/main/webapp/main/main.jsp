<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>main</title>
    </head>
    <body>
        <h1 align="center">欢迎来到主页面</h1>
        <div align="right">

            <%--认证成功之后展示的内容 记住我登陆不算是认证通过 subject.login(token) --%>
            <%--<shiro:authenticated>
                您好：<span style="color: coral "><shiro:principal/></span>，欢迎来到主页面，<a href="${path}/logout" >退出</a>
            </shiro:authenticated>--%>

            <%--没有通过认证展示的内容 用户认证未通过展示的内容 subject.login(token)  --%>
            <%--<shiro:notAuthenticated>
                如果想浏览更多信息请<a href="${path}/user/login.jsp">登录</a>
                <h2 align="center">这是没有登录展示的内容</h2>
            </shiro:notAuthenticated>--%>

            <%--认证成功之后展示的内容/记住我登陆--%>
            <shiro:user>
                您好：<span style="color: coral "><shiro:principal/></span>，欢迎来到主页面，<a href="${path}/logout" >退出</a>
                <div align="left">

                    <%--当前主体是否有该角色--%>
                    <shiro:hasRole name="sAdmin">
                        <button>管理员管理</button><br><br>
                        <shiro:hasPermission name="admin:select">
                            管理员查询<br><br>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="admin:update">
                            管理员修改<br><br>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="admin:delete">
                            管理员删除<br><br>
                        </shiro:hasPermission>
                        <button>日志管理</button><br><br>
                    </shiro:hasRole>

                    <%--当前主体是否有任意一角色--%>
                    <shiro:hasAnyRoles name="admin,sAdmin">
                        <button>用户管理</button><br><br>
                        <%--当前主体是否有该权限--%>
                        <shiro:hasPermission name="user:select">
                            用户查询<br><br>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="user:update">
                            用户修改<br><br>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="user:delete">
                            用户删除<br><br>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="user:insert">
                            用户添加<br><br>
                        </shiro:hasPermission>
                        <button>类别管理</button><br><br>
                        <button>视频管理</button><br><br>
                    </shiro:hasAnyRoles>

                    <%--当前主体没有该角色--%>
                    <shiro:lacksRole name="sAdmin">
                        <button>反馈管理</button><br><br>
                    </shiro:lacksRole>

                </div>
            </shiro:user>


            <%--当前主体没有该角色--%>
            <%--<shiro:lacksRole name=""></shiro:lacksRole>--%>
            <%--当前主体是否有该权限--%>
            <%--<shiro:hasPermission name="user:select"></shiro:hasPermission>--%>
            <%--当前主体没有该权限--%>
            <%--<shiro:lacksPermission name=""></shiro:lacksPermission>--%>

            <%--没有认证成功之后展示的内容  游客访问到的内容--%>
            <shiro:guest>
                如果想浏览更多信息请<a href="${path}/user/login.jsp">登录</a>
                <h2 align="center">这是没有登录展示的内容</h2>
            </shiro:guest>



        </div>
    </body>
</html>