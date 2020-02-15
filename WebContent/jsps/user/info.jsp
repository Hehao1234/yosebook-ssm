<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>个人信息</title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
    href="<c:url value='/css/css.css'/>">
<link rel="stylesheet" type="text/css"
    href="<c:url value='/jsps/css/user/pwd.css'/>">
<script type="text/javascript"
    src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script src="<c:url value='/js/common.js'/>"></script>
<script src="<c:url value='/jsps/js/user/pwd.js'/>"></script>
</head>

<body>
    <header>
     <img src="<c:url value='/images/ysmall_logo.png'/>">
    <%--  <img src="<c:url value='/images/welcome_mdfPwd.png'/>" class="welcome_mdfPwd"> --%>
    </header>
    <!-- <div class="div0">
    	<span>修改密码</span>
    </div>
 -->
    <section>
        <div class="div">
            <form action="<c:url value='/user/updateInfo.do'/>" method="post"
                target="_top">
                <table>
                    <tr>
                        <td class="textTd">&nbsp;</td>
                        <td class="inputTd"><label class="error"></label></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="textTd">用户名：</td>
                        <td class="inputTd"><input class="input" type="text"
                            name="loginpass" id="loginpass" disabled="disabled" value="${user.loginname }" /></td>
                    <tr>
                        <td align="right" class="textTd">邮箱：</td>
                        <td class="inputTd"><input class="input" type="text"
                            name="email" id="email" value="${user.email }" /></td>
                    </tr>
                    <tr>
                        <td align="right" class="textTd">性别：</td>
                        <td class="inputTd"><input class="input" type="text"
                            name="gender" id="gender" value="${user.gender }" /></td>
                    </tr>
                    <!-- <tr>
                        <td align="right"></td>
                        <td><img id="vCode" src="/yosebook/verifyCode" title="点击更换" 
                        onclick="this.setAttribute('src','/yosebook/verifyCode?'+Math.random());"/>
                         <a href="javascript:_change();">看不清，换一张</a></td>
                    </tr> -->
                    <tr>
                        <td align="right" class="textTd">昵称：</td>
                        <td class="inputTd"><input class="input" type="text"
                            name="nickname" id="nickname" value="${user.nickname }" /></td>
                    </tr>
                    <tr>
                        <td align="right"></td>
                        <td><input id="submit" type="submit"
                            value="确认修改" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
</body>
</html>
