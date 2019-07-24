
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery.js"></script>
    <script src="js/js.js"></script>
    <script src="js/time.js"></script>
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
                    <li ><a href="/SelectAllServlet?mark=0">账单管理</a></li>
                    <li><a href="/SelectAllServlet?mark=2">供应商管理</a></li>
                    <li><a href="/SelectAllServlet?mark=1">用户管理</a></li>
                    <li id="active"><a href="password.jsp">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>密码修改页面</span>
            </div>
            <div class="providerAdd">
                <form>
                    <!--div的class 为error是验证错误，ok是验证成功-->
                    <div class="">
                        <label for="oldPassword">旧密码：</label>
                        <input type="password" name="oldPassword" id="oldPassword" required autofocus/>
                        <input type="password" name="password" value="${user.userPassword}" id="password" hidden/>
                        <span id="old">*请输入原密码</span>
                    </div>
                    <div>
                        <label for="newPassword">新密码：</label>
                        <input type="password" name="newPassword" id="newPassword" required/>
                        <span id="new">*请输入新密码</span>
                    </div>
                    <div>
                        <label for="reNewPassword">确认新密码：</label>
                        <input type="password" name="reNewPassword" id="reNewPassword" required/>
                        <span id="renew">*请输入新确认密码，保证和新密码一致</span>
                    </div>
                    <div class="providerAddBtn">
                        <!--<a href="#">保存</a>-->
                        <input type="button" onclick="Change()" value="保存"/>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <footer class="footer">
    </footer>

</body>
<script type="text/javascript">
    var flag=true;
    $(function () {
        $("#oldPassword").blur(function () {
            var oldPassword = $("#oldPassword").val();
            var password = $("#password").val();
            if (oldPassword == password) {
                $("#old").css("color", "green");
                $("#old").html("ok");
            } else if (oldPassword=="") {
                $("#old").css("color", "red");
                $("#old").html("不能为空")
            }else {
                $("#old").css("color", "red");
                $("#old").html("密码错误")
            }
            //var old=$("#oldPassword");
            // $.post(
            //     "/PasswordServlet",
            //     {"password": $("#oldPassword")},
            //     function (result) {
            //         if (result) {
            //             $("#oldPassword").css("border", "2px solid red");
            //             flag=true;
            //         }else {
            //             $("#oldPassword").css("border", "2px solid red")
            //             //document.getElementById("old").innerHTML="两次输入密码不一致，请重新输入";//在div显示错误信息
            //             flag=false;
            //         }
            //     },
            //     "json"
            // );
        });
        $("#reNewPassword").blur(function () {
            var reNewPassword = $("#reNewPassword").val();
            var newPassword = $("#newPassword").val();
            if (reNewPassword=="") {
                $("#renew").css("color", "red");
                $("#renew").html("不能为空")
            } else if (reNewPassword==newPassword) {
                $("#renew").css("color", "green");
                $("#renew").html("ok")
            }else{
                $("#renew").css("color", "red");
                $("#renew").html("两次密码不一致")
            }
        })

        $("#newPassword").blur(function () {
            var newPassword = $("#newPassword").val();
            if (newPassword=="") {
                $("#new").css("color", "red");
                $("#new").html("不能为空")
            }else {
                $("#new").css("color", "green");
                $("#new").html("ok")
            }
        })
    });

    function Change() {
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var reNewPassword = $("#reNewPassword").val();

        if (newPassword==reNewPassword) {
            location.href="/CPasswordServlet?oldPassword="+oldPassword+"&newPassword="+newPassword;
        }else {
            alert("两次密码不同！")
        }
    }
    // function checkpwd(){
    //     var p1=document.form1.pwd1.value;//获取密码框的值
    //     var p2=document.form1.pwd2.value;//获取重新输入的密码值
    //     if(p1==""){
    //         alert("请输入密码！");//检测到密码为空，提醒输入//
    //         document.form1.pwd1.focus();//焦点放到密码框
    //         return false;//退出检测函数
    //     }//如果允许空密码，可取消这个条件
    //     if(p1!=p2){//判断两次输入的值是否一致，不一致则显示错误信息
    //         document.getElementById("old").innerHTML="两次输入密码不一致，请重新输入";//在div显示错误信息
    //         return false;
    //     }else{
    // //密码一致，可以继续下一步操作
    //     }
    // }
</script>
</html>