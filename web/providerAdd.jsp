﻿
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
                <li><a href="billList.jsp">账单管理</a></li>
                <li id="active"><a href="providerList.jsp">供应商管理</a></li>
                <li><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面 >> 供应商添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="/AddServlet?mark=2" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">供应商编码：</label>
                    <input type="text" name="providerId" id="providerId"/>
                    <span id="pid">*请输入供应商编码</span>
                </div>
                <div>
                    <label for="providerName">供应商名称：</label>
                    <input type="text" name="providerName" id="providerName"/>
                    <span id="pname">*请输入供应商名称</span>
                </div>
                <div>
                    <label for="people">联系人：</label>
                    <input type="text" name="people" id="people"/>
                    <span id="peo" >*请输入联系人</span>

                </div>
                <div>
                    <label for="phone">联系电话：</label>
                    <input type="text" name="phone" id="phone"/>
                    <span id="phone1">*请输入联系电话</span>
                </div>
                <div>
                    <label for="address">联系地址：</label>
                    <input type="text" name="address" id="address"/>
                    <span></span>
                </div>
                <div>
                    <label for="fax">传真：</label>
                    <input type="text" name="fax" id="fax"/>
                    <span></span>
                </div>
                <div>
                    <label for="describe">描述：</label>
                    <input type="text" name="describe" id="describe"/>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.html">返回</a>-->
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

        $("#providerId").blur(function () {
            var providerId = $("#providerId").val();
            if (providerId == "") {
                $("#pid").css("color", "red");
                $("#pid").html("不能为空")
            }else {
                $("#pid").css("color", "green");
                $("#pid").html("ok👌")
            }
        })


        $("#providerName").blur(function () {
            var providerName = $("#providerName").val();
            if (providerName=="") {
                $("#pname").css("color", "red");
                $("#pname").html("不能为空")
            }
            else {
                $("#pname").css("color", "green");
                $("#pname").html("👌")
            }
        })

        $("#people").blur(function () {
            var people = $("#people").val();
            if (people=="") {
                $("#peo").css("color", "red");
                $("#peo").html("不能为空")
            }else {
                $("#peo").css("color", "green");
                $("#peo").html("👌")
            }
        })

        $("#phone").blur(function () {
            var phone = $("#phone").val();
            if (phone=="") {
                $("#phone1").css("color", "red");
                $("#phone1").html("不能为空")
            }else {
                $("#phone1").css("color", "green");
                $("#phone1").html("👌")
            }
        })
    });
    function add() {
        var providerId= $("#providerId").val();
        var providerName= $("#providerName").val();
        var people= $("#people").val();
        var phone= $("#phone").val();
        var address= $("#address").val();
        var fax= $("#fax").val();
        var describe= $("#describe").val();
        if (flag) {
            location.href="/AddServlet?mark=2&providerId="+providerId+
                "&providerName="+providerName+"&people="+people+ "&phone="+phone+
                "&address="+address+"&fax="+fax+"&describe="+describe;
        }else {
            alert("请输入正确")
        }
    }

</script>
</html>