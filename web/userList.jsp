<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市账单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>${Time}</span><span style="color: #fff21b"> ${user.userName}</span> , 欢迎你！</p>
            <a href="login.jsp">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li><a href="/SelectAllServlet?mark=0">账单管理</a></li>
                    <li><a href="/SelectAllServlet?mark=2">供应商管理</a></li>
                    <li  id="active"><a href="userList.jsp">用户管理</a></li>
                    <li><a href="password.jsp">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
                <form action="/SelectAllServlet?mark=1" method="post">
                <span>用户名：</span>
                <input type="text" name="username" value="${username}" placeholder="请输入用户名"/>
                <input type="submit" value="查询"/>
                </form>
                <a href="userAdd.jsp">添加用户</a>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>
                <c:forEach items="${users}" var="user1">
                    <tr <c:if test="${user1.id==user.id}">hidden</c:if>>
                    <td>${user1.userCode}</td>
                    <td>${user1.userName}</td>
                    <td><c:if test="${user1.gender==1}">女</c:if><c:if test="${user1.gender==2}">男</c:if></td>
                    <td>${user1.birthday}</td>
                    <td>${user1.phone}</td>
                    <td><c:forEach items="${roles}" var="role">
                        <c:if test="${role.id==user1.userRole}">${role.roleName}</c:if>
                    </c:forEach></td>
                    <td>
                        <a href="/UpdateSelectServlet?view=1&mark=1&userName=${user1.userName}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="/UpdateSelectServlet?mark=1&userCode=${user1.userCode}&view=0"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <button type="button" onclick="confirmDel(${user1.id})"><img src="img/schu.png" alt="删除" title="删除"/></button>
                        <%--<a href="#" class="removeUser"><img src="img/schu.png" alt="删除" title="删除"/></a>--%>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <a href="/SelectAllServlet?mark=1&index=1&username=${username}">首页</a>
            <a href="/SelectAllServlet?mark=1&username=${username}&index=<c:if test="${pageindexUser>1}">${pageindexUser-1}</c:if><c:if test="${pageindexUser==1}">1</c:if>">上一页</a>
            <c:forEach begin="1" end="${countUser}" var="index">
                <a href="/SelectAllServlet?mark=1&username=${username}&index=${index}">${index}</a>
            </c:forEach>
            <a href="/SelectAllServlet?mark=1&username=${username}&index=<c:if test="${pageindexUser<countUser}">${pageindexUser+1}</c:if><c:if test="${pageindexUser==countUser}">${countUser}</c:if>">下一页</a>
            <a href="/SelectAllServlet?mark=1&username=${username}&index=${countUser}">尾页</a>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<%--<div class="zhezhao"></div>--%>
<%--<div class="remove" id="removeUse">--%>
    <%--<div class="removerChid">--%>
        <%--<h2>提示</h2>--%>
        <%--<div class="removeMain">--%>
            <%--<p>你确定要删除该用户吗？</p>--%>
            <%--<a href="#" id="yes">确定</a>--%>
            <%--<a href="#" id="no">取消</a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

    <footer class="footer">
    </footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
<script type="text/javascript">
    function confirmDel(param)
    {
        if(window.confirm("您确定要删除吗？")){
            document.location="/DelServlet?id="+param+"&mark=1";
        }
    }
</script>
</html>