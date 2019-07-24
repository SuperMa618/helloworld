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
                <li><a href="billList.jsp">账单管理</a></li>
                <li ><a href="providerList.jsp">供应商管理</a></li>
                <li id="active"><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="/AddServlet?mark=3" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="userId">用户编码：</label>
                    <input type="text" name="userId" id="userId"/>
                    <span id="userbm" name="userbm">*请输入用户编码，且不能重复</span>
                </div>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName"/>
                    <span id="uname">*请输入用户名称</span>
                </div>
                <div>
                    <label for="userpassword">用户密码：</label>
                    <input type="text" name="userpassword" id="userpassword"/>
                    <span id="pwdlength">*密码长度必须大于6位小于20位</span>

                </div>
                <div>
                    <label for="userRemi">确认密码：</label>
                    <input type="text" name="userRemi" id="userRemi"/>
                    <span id="remi">*请输入确认密码</span>
                </div>
                <div>
                    <label >用户性别：</label>

                    <select name="sex">
                        <option value="man">男</option>
                        <option value="woman">女</option>
                    </select>
                    <span></span>
                </div>
                <div>
                    <label for="date">出生日期：</label>
                    <input type="date" name="date" id="date"/>
                    <span id="date1">*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="userphone" id="userphone"/>
                    <span id="phone">*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="userAddress" id="userAddress"/>
                </div>
                <div>
                    <label >用户类别：</label>
                    <input type="radio" name="userlev" value="管理员"/>管理员
                    <input type="radio" name="userlev" value="经理"/>经理
                    <input type="radio" name="userlev" value="普通用户"/>普通用户
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.html">返回</a>-->
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
        $("#userId").blur(function () {
            var userId = $("#userId").val();
            if (userId=="") {
                $("#userbm").css("color", "red");
                $("#userbm").html("不能为空")
            }
            $.post(
                "/UserIdServlet",
                {"userId": userId},
                function (result) {
                    if (result) {
                        $("#userbm").css("color", "red");
                        $("#userbm").html("已存在")
                        flag = false;
                    } else {
                        $("#userbm").css("color", "green");
                        $("#userbm").html("👌")
                        flag = true;
                    }
                },
                "json"
            );
        });
        $("#userName").blur(function () {
            var userName = $("#userName").val();
            if (userName == "") {
                $("#uname").css("color", "red");
                $("#uname").html("不能为空")
            }else {
                $("#uname").css("color", "green");
                $("#uname").html("👌")
            }
        })


        $("#userpassword").blur(function () {
            var userpassword = $("#userpassword").val();
            if (userpassword=="") {
                $("#pwdlength").css("color", "red");
                $("#pwdlength").html("不能为空")
            }
            else {
                $("#pwdlength").css("color", "green");
                $("#pwdlength").html("👌")
            }
            if(userpassword.length > 20) {
                $("#pwdlength").css("color", "red");
                $("#pwdlength").html("不能大于20位")
            }else{
                $("#pwdlength").css("color", "green");
                $("#pwdlength").html("👌")
            }
        })

        $("#userRemi").blur(function () {
            var userRemi = $("#userRemi").val();
            var userpassword=$("#userpassword").val();
            if (userRemi!=userpassword) {
                $("#remi").css("color", "red");
                $("#remi").html("两次密码不同")
            }else if (userpassword=="") {
                $("#remi").css("color", "red");
                $("#remi").html("不能为空")
            }else{
                $("#remi").css("color", "green");
                $("#remi").html("👌")
            }
        })

        $("#date").blur(function () {
            var date = $("#date").val();
            if (date=="") {
                $("#date1").css("color", "red");
                $("#date1").html("不能为空")
            }else {
                $("#date1").css("color", "green");
                $("#date1").html("👌")
            }
        })
        $("#userphone").blur(function () {
            var userphone = $("#userphone").val();
            if (userphone=="") {
                $("#phone").css("color", "red");
                $("#phone").html("不能为空")
            }else {
                $("#phone").css("color", "green");
                $("#phone").html("👌")
            }
        })

    });

    function add() {
        var userId= $("#userId").val();
        var userName= $("#userName").val();
        var userpassword= $("#userpassword").val();
        var sex= $("#sex").val();
        var date= $("#date").val();
        var userphone= $("#userphone").val();
        var userAddress= $("#userAddress").val();
        var userlev= $('input[name="userlev"]:checked').val();
        if (flag) {
            location.href="/AddServlet?mark=3&userId="+userId+
                "&userName="+userName+"&userpassword="+userpassword+
                "&sex="+sex+"&date="+date+"&userphone="+userphone+
                "&userAddress="+userAddress+"&userlev="+userlev;
        }else {
            alert("请输入正确")
        }
    }
</script>
</html>