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
            <form action="/AddServlet?mark=1" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billId">订单编码：</label>
                    <input type="text" name="billId" id="billId" required/>
                    <span id="billi">*请输入订单编码</span>
                </div>
                <div>
                    <label for="billName">商品名称：</label>
                    <input type="text" name="billName" id="billName" required/>
                    <span id="billn" >*请输入商品名称</span>
                </div>
                <div>
                    <label for="billCom">商品单位：</label>
                    <input type="text" name="billCom" id="billCom" required/>
                    <span id="billc">*请输入商品单位</span>

                </div>
                <div>
                    <label for="billNum">商品数量：</label>
                    <input type="text" name="billNum" id="billNum" required/>
                    <span id="bnum">*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label for="money">总金额：</label>
                    <input type="text" name="money" id="money" required/>
                    <span id="mon">*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div>
                    <label >供应商：</label>
                    <select name="supplier" id="supplier">
                        <option value="">--请选择相应的提供商--</option>
                        <c:forEach items="${Bproviders}" var="provider">
                        <option value="${provider.proName}">${provider.proName}</option>
                        </c:forEach>

                    </select>
                    <span id="supp">*请选择供应商</span>
                </div>
                <div>
                    <label >是否付款：</label>
                    <input type="radio" name="pay" value="1" checked />未付款
                    <input type="radio" name="pay" value="2"/>已付款
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input type="button" value="保存" onclick="add()"/>
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

        $("#billId").blur(function () {
            var billId = $("#billId").val();
            if (billId == "") {
                $("#billi").css("color", "red");
                $("#billi").html("不能为空")
            }else {
                $("#billi").css("color", "green");
                $("#billi").html("👌")
            }
        })


        $("#billName").blur(function () {
            var billName = $("#billName").val();
            if (billName=="") {
                $("#billn").css("color", "red");
                $("#billn").html("不能为空")
            }
            else {
                $("#billn").css("color", "green");
                $("#billn").html("👌")
            }
        })

        $("#billCom").blur(function () {
            var billCom = $("#billCom").val();
            if (billCom=="") {
                $("#billc").css("color", "red");
                $("#billc").html("不能为空")
            }else {
                $("#billc").css("color", "green");
                $("#billc").html("👌")
            }
        })

        $("#billNum").blur(function () {
            var billNum = $("#billNum").val();
            if (billNum=="") {
                $("#bnum").css("color", "red");
                $("#bnum").html("不能为空")
            }else if (billNum<1) {
                $("#bnum").css("color", "red");
                $("#bnum").html("请输入大于零的整数")
            }else {
                $("#bnum").css("color", "green");
                $("#bnum").html("👌")
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

        $("#supplier").blur(function () {
            var supplier = $("#supplier").val();
            if (supplier=="") {
                $("#supp").css("color", "red");
                $("#supp").html("不能为空")
            }else {
                $("#supp").css("color", "green");
                $("#supp").html("👌")
            }
        })
    });

    function add() {
        var billId= $("#billId").val();
        var billName= $("#billName").val();
        var billCom= $("#billCom").val();
        var billNum= $("#billNum").val();
        var money= $("#money").val();
        var supplier= $("#supplier").val();
        var pay= $('input[name="pay"]:checked').val();
        if (flag) {
            location.href="/AddServlet?mark=1&billId="+billId+
                "&billName="+billName+"&billCom="+billCom+
                "&billNum="+billNum+"&money="+money+"&supplier="+supplier+
                "&pay="+pay;
        }else {
            alert("请输入正确")
        }
    }
</script>
</html>