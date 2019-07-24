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
                <li><a href="providerList.jsp">供应商管理</a></li>
                <li><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 订单添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="/UpdateServlet?mark=3&id=${b.id}" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billCode">订单编码：</label>
                    <input type="text" name="bId" id="bId" value="${b.id}" hidden/>
                    <input type="text" name="billCode" id="billCode" value="${b.billCode}"/>
                    <span id="bCode">*</span>
                </div>
                <div>
                    <label for="proname">商品名称：</label>
                    <input type="text" name="proname" id="proname" value="${b.productName}"/>
                    <span id="pname">*</span>
                </div>
                <div>
                    <label for="unit">商品单位：</label>
                    <input type="text" name="unit" id="unit" value="${b.productUnit}"/>
                    <span id="un">*</span>

                </div>
                <div>
                    <label for="count">商品数量：</label>
                    <input type="text" name="count" id="count" value="${b.productCount}"/>
                    <span id="count1">*</span>
                </div>
                <div>
                    <label for="money">总金额：</label>
                    <input type="text" name="money" id="money" value="${b.totalPrice}"/>
                    <span id="mon">*</span>
                </div>
                <div>
                    <%--<label for="provider">供应商：</label>--%>
                    <%--<c:forEach items="${Bproviders}" var="provider">--%>
                        <%--<c:if test="${provider.id==b.providerId}">--%>
                            <%--<input type="text" name="provider" id="provider" value="${provider.proName}"/>--%>
                            <%--<input type="text" name="providerId" id="providerId" value="${provider.id}" hidden/>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                        <label for="provider">供应商：</label>
                    <select name="provider" id="provider">
                        <option value="">--请选择相应的提供商--</option>
                        <c:forEach items="${Bproviders}" var="provider">
                            <option value="${provider.id}" <c:if test="${provider.id==b.providerId}">selected</c:if>>
                                ${provider.proName}
                            </option>
                        </c:forEach>

                    </select>
                    <span id="pro">*</span>
                </div>
                <div>
                    <label >是否付款：</label>
                    <input type="radio" name="zhifu" value="1" <c:if test="${b.isPayment==1}">checked</c:if> />未付款
                    <input type="radio" name="zhifu" value="2" <c:if test="${b.isPayment==2}">checked</c:if> />已付款
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input type="button" value="保存" onclick="update()"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
</footer>
<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
<script>
    var flag=true;;
    $(function () {

        $("#billCode").blur(function () {
            var billCode = $("#billCode").val();
            if (billCode == "") {
                $("#bCode").css("color", "red");
                $("#bCode").html("不能为空")
            }else {
                $("#bCode").css("color", "green");
                $("#bCode").html("👌")
            }
        })


        $("#proname").blur(function () {
            var proname = $("#proname").val();
            if (proname=="") {
                $("#pname").css("color", "red");
                $("#pname").html("不能为空")
            }
            else {
                $("#pname").css("color", "green");
                $("#pname").html("👌")
            }
        })

        $("#unit").blur(function () {
            var unit = $("#unit").val();
            if (unit=="") {
                $("#un").css("color", "red");
                $("#un").html("不能为空")
            }else {
                $("#un").css("color", "green");
                $("#un").html("👌")
            }
        })

        $("#count").blur(function () {
            var count = $("#count").val();
            if (count=="") {
                $("#count1").css("color", "red");
                $("#count1").html("不能为空")
            }else if (count<1) {
                $("#count1").css("color", "red");
                $("#count1").html("请输入大于零的整数")
            }else {
                $("#count1").css("color", "green");
                $("#count1").html("👌")
            }
        })

        $("#money").blur(function () {
            var money = $("#money").val();
            if (money=="") {
                $("#mon").css("color", "red");
                $("#mon").html("不能为空")
            }else if (billNum<1) {
                $("#mon").css("color", "red");
                $("#mon").html("请输入大于零的整数")
            }else {
                $("#mon").css("color", "green");
                $("#mon").html("👌")
            }
        })

        $("#provider").blur(function () {
            var provider = $("#provider").val();
            if (provider=="") {
                $("#pro").css("color", "red");
                $("#pro").html("不能为空")
            }else {
                $("#pro").css("color", "green");
                $("#pro").html("👌")
            }
        })
    });

    function update() {
        var bId= $("#bId").val();
        var billCode= $("#billCode").val();
        var proname= $("#proname").val();
        var unit= $("#unit").val();
        var count= $("#count").val();
        var money= $("#money").val();
        var provider= $("#provider").val();
        var zhifu= $('input[name="zhifu"]:checked').val();
        if (flag) {
            location.href="/UpdateServlet?mark=3&billCode="+billCode+
                "&proname="+proname+"&unit="+unit+
                "&count="+count+"&money="+money+
                "&provider="+provider+"&zhifu="+zhifu+"&id="+bId;
        }else {
            alert("请输入正确")
        }
    }
</script>
</html>