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
                <li id="active"><a href="providerList.jsp">供应商管理</a></li>
                <li><a href="/SelectAllServlet?mark=1">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
            <form action="/SelectAllServlet?mark=2" method="post">
            <span>供应商名称：</span>
            <input type="text" name="proname" value="${proname}" placeholder="请输入供应商的名称"/>
            <input type="submit" value="查询"/>
            </form>
            <a href="providerAdd.jsp">添加供应商</a>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach items="${providers}" var="provider">
            <tr>
                <td>${provider.proCode}</td>
                <td>${provider.proName}</td>
                <td>${provider.proContact}</td>
                <td>${provider.proPhone}</td>
                <td>${provider.proFax}</td>
                <td>${provider.creationDate}</td>
                <td>
                    <a href="/UpdateSelectServlet?view=1&mark=2&proName=${provider.proName}"><img src="img/read.png" alt="查看" title="查看"/></a>
                    <a href="/UpdateSelectServlet?mark=2&proName=${provider.proName}&view=0"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                    <button type="button" onclick="confirmDel(${provider.id})"><img src="img/schu.png" alt="删除" title="删除"/></button>
                    <%--<a href="#" class="removeProvider"><img src="img/schu.png" alt="删除" title="删除"/></a>--%>
                </td>
            </tr>
            </c:forEach>
        </table>
        <a href="/SelectAllServlet?mark=2&index=1&proname=${proname}">首页</a>
        <a href="/SelectAllServlet?mark=2&proname=${proname}&index=<c:if test="${pageindexProvider>1}">${pageindexProvider-1}</c:if><c:if test="${pageindexProvider==1}">1</c:if>">上一页</a>
        <c:forEach begin="1" end="${countProvider}" var="index">
            <a href="/SelectAllServlet?mark=2&proname=${proname}&index=${index}">${index}</a>
        </c:forEach>
        <a href="/SelectAllServlet?mark=2&proname=${proname}&index=<c:if test="${pageindexProvider<countProvider}">${pageindexProvider+1}</c:if><c:if test="${pageindexProvider==countProvider}">${countProvider}</c:if>">下一页</a>
        <a href="/SelectAllServlet?mark=2&proname=${proname}&index=${countProvider}">尾页</a>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>


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
            document.location="/DelServlet?id="+param+"&mark=2";
        }
    }
</script>
</html>