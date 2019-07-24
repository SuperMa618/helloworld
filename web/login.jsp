
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>系统登录 - 超市账单管理系统</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery.js"></script>

</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>超市账单管理系统</h1>
        </header>
        <section class="loginCont">
            <form class="loginForm" >
                <div class="inputbox">
                    <label for="userName">用户名：</label>
                    <input id="userName" type="text" name="userName" placeholder="请输入用户名" required autofocus/>
                </div>
                <div class="inputbox">
                    <label for="passWord">密码：</label>
                    <input id="passWord" type="password" name="passWord" placeholder="请输入密码" required/>
                </div>
                <div class="subBtn">
                    <input type="button" onclick="login()" value="登录"/>
                    <input type="reset" value="重置"/>
                </div>

            </form>
        </section>
    </section>

</body>
<script type="text/javascript">
    var flag=false;
    var flag1=true;
    $(function () {
        $("#userName").blur(function () {
            var userName = $("#userName").val();
            $.post(
                "/UserNameServlet",
                {"userName": userName},
                function (result) {
                    if (result) {
                        $("#userName").css("border", "2px solid rgb(204,204,204)");
                        flag=true;
                    }else {
                        $("#userName").css("border", "2px solid red");
                        flag=false;
                    }
                },
                "json"
            );
        });

        $("#passWord").blur(function () {
            var password = $("#passWord").val();
            $.post(
                "/PasswordServlet",
                {"password":password},
                function (result) {
                    if (result) {
                        $("#passWord").css("border", "1px solid rgb(204,204,204)");
                        flag1=true;
                    }else {
                        $("#passWord").css("border", "1px solid red");
                        flag1=false;
                    }
                },
                "json"
            );
        });
    });
    function login() {
        var username;
        username = $("#userName").val();
        var password;
        password = $("#passWord").val();
        if (flag) {
            if (flag1) {
                location.href="/LoginServlet?username="+username+"&password="+password;
            }else {
                alert("密码错误")
            }

        }else {
            alert("用户名不存在")
        }
    }
</script>
</html>