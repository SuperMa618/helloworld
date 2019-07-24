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
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="/UpdateServlet?mark=1&id=${u.id}" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userId" id="userId" value="${u.id}" hidden/>
                    <input type="text" name="userName" id="userName" value="${u.userName}"/>
                    <span id="name">*</span>
                </div>
                <div>
                    <label >用户性别：</label>
                    <select name="gender" id="gender">
                        <option value="2" <c:if test="${u.gender==2}">selected</c:if>>男</option>
                        <option value="1" <c:if test="${u.gender==1}">selected</c:if>>女</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="text" name="birthday" id="birthday" value="${u.birthday}"/>
                    <span id="birthday1">*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="userphone" id="userphone" value="${u.phone}"/>
                    <span id="phone">*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="userAddress" id="userAddress" value="${u.address}"/>
                </div>
                <div>
                    <label >用户类别：</label>
                    <input type="radio" name="userlei" value="1" <c:if test="${u.userRole==1}">checked</c:if>/>管理员
                    <input type="radio" name="userlei" value="2" <c:if test="${u.userRole==2}">checked</c:if>/>经理
                    <input type="radio" name="userlei" value="3" <c:if test="${u.userRole==3}">checked</c:if>/>普通用户

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.html">返回</a>-->
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
    var flag=true;
    $(function () {
        $("#userName").blur(function () {
            var userName = $("#userName").val();
            if (userName == "") {
                $("#name").css("color", "red");
                $("#name").html("不能为空")
            }else {
                $("#name").css("color", "green");
                $("#name").html("👌")
            }
        })

        $("#birthday").blur(function () {
            var birthday = $("#birthday").val();
            if (birthday == "") {
                $("#birthday1").css("color", "red");
                $("#birthday1").html("不能为空")
            }else {
                $("#birthday1").css("color", "green");
                $("#birthday1").html("👌")
            }
        })

        $("#userphone").blur(function () {
            var userphone = $("#userphone").val();
            if (userphone == "") {
                $("#phone").css("color", "red");
                $("#phone").html("不能为空")
            }else {
                $("#phone").css("color", "green");
                $("#phone").html("👌")
            }
        })
    });
    function update() {
        var userId= $("#userId").val();
        var userName= $("#userName").val();
        var gender= $("#gender").val();
        var birthday= $("#birthday").val();
        var userlei= $('input[name="userlei"]:checked').val();
        var userphone= $("#userphone").val();
        var userAddress= $("#userAddress").val();
        if (flag) {
            location.href="/UpdateServlet?mark=1&id="+userId+
                "&userName="+userName+"&gender="+gender+
                "&birthday="+birthday+"&userphone="+userphone+
                "&userAddress="+userAddress+"&userlei="+userlei;
        }else {
            alert("请输入正确")
        }
    }
</script>
</html>