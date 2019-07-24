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
                    <li id="active"><a href="billList.jsp">账单管理</a></li>
                    <li><a href="/SelectAllServlet?mark=2">供应商管理</a></li>
                    <li><a href="/SelectAllServlet?mark=1">用户管理</a></li>
                    <li><a href="password.jsp">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>账单管理页面</span>
            </div>
            <div class="search">
                <form action="/SelectAllServlet?mark=3" method="post">
                <span>商品名称：</span>
                <input type="text" name="productName" value="${productName}" placeholder="请输入商品的名称"/>
                
                <span>供应商：</span>
                <select name="supplier" >
                    <option value="">--请选择--</option>
                    <c:forEach items="${Bproviders}" var="provider">
                        <option value="${provider.id}" <c:if test="${supplier==provider.id}">selected</c:if> >${provider.proName}</option>
                    </c:forEach>
                </select>

                <span>是否付款：</span>
                <select name="fukuan">
                    <option value="">--请选择--</option>
                    <option value="2" <c:if test="${Pay=='2'}">selected</c:if>>已付款</option>
                    <option value="1" <c:if test="${Pay=='1'}">selected</c:if>>未付款</option>
                </select>

                <input type="submit" value="查询"/>
                </form>
                <a href="billAdd.jsp">添加订单</a>
            </div>
            <!--账单表格 样式和供应商公用-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">账单编码</th>
                    <th width="20%">商品名称</th>
                    <th width="10%">供应商</th>
                    <th width="10%">账单金额</th>
                    <th width="10%">是否付款</th>
                    <th width="10%">创建时间</th>
                    <th width="30%">操作</th>
                </tr>
                <c:forEach items="${bills}" var="bill">
                <tr>
                    <td>${bill.billCode}</td>
                    <td>${bill.productName}</td>
                    <td><c:forEach items="${Bproviders}" var="provider">
                        <c:if test="${provider.id==bill.providerId}">${provider.proName}</c:if>
                    </c:forEach>
                    </td>
                    <td>${bill.totalPrice}</td>
                    <td><c:if test="${bill.isPayment==1}">未支付</c:if><c:if test="${bill.isPayment==2}">已支付</c:if></td>
                    <td>${bill.creationDate}</td>
                    <td>
                        <a href="/UpdateSelectServlet?view=1&mark=3&billCode=${bill.billCode}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="/UpdateSelectServlet?mark=3&productName=${bill.productName}&view=0"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <button type="button" onclick="confirmDel(${bill.id})"><img src="img/schu.png" alt="删除" title="删除"/></button>
                        <%--<a href="#" class="removeBill"><img src="img/schu.png" alt="删除" title="删除"/></a>--%>
                    </td>
                </tr>

                </c:forEach>
            </table>
            <a href="/SelectAllServlet?mark=3&index=1&productName=${productName}&supplier=${supplier}&Pay=${Pay}">首页</a>
            <a href="/SelectAllServlet?mark=3&productName=${productName}&supplier=${supplier}&Pay=${Pay}&index=<c:if test="${pageindexBill>1}">${pageindexBill-1}</c:if><c:if test="${pageindexBill==1}">1</c:if>">上一页</a>
            <c:forEach begin="1" end="${countBill}" var="index">
                <a href="/SelectAllServlet?mark=3&index=${index}&productName=${productName}&supplier=${supplier}&Pay=${Pay}">${index}</a>
            </c:forEach>
            <a href="/SelectAllServlet?mark=3&productName=${productName}&supplier=${supplier}&Pay=${Pay}&index=<c:if test="${pageindexBill<countBill}">${pageindexBill+1}</c:if><c:if test="${pageindexBill==countBill}">${countBill}</c:if>">下一页</a>
            <a href="/SelectAllServlet?mark=3&index=${countBill}&productName=${productName}&supplier=${supplier}&Pay=${Pay}">尾页</a>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<%--<div class="zhezhao"></div>--%>
<%--<div class="remove" id="removeBi">--%>
    <%--<div class="removerChid">--%>
        <%--<h2>提示</h2>--%>
        <%--<div class="removeMain">--%>
            <%--<p>你确定要删除该订单吗？</p>--%>
            <%--<a href="/DelServlet?id=${bill.id}" id="yes">确定</a>--%>
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
            document.location="/DelServlet?id="+param+"&mark=3";
        }
    }
</script>
</html>