<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户列表</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
    href="<c:url value='/jsps/pager/pager.css'/>" />
<script type="text/javascript"
    src="<c:url value='/jsps/pager/pager.js'/>"></script>
<link rel="stylesheet" type="text/css"
    href="<c:url value='/adminjsps/admin/css/order/list.css'/>" />
<link rel="stylesheet" type="text/css"
    href="<c:url value='/css/css.css'/>" />

</head>

<body>
    <%-- <p class="pLink">
        <a href="<c:url value='/admin/order/findByStatus.do?status=1'/>">未付款</a>
        | <a href="<c:url value='/admin/order/findByStatus.do?status=2'/>">已付款</a>
        | <a href="<c:url value='/admin/order/findByStatus.do?status=3'/>">已发货</a>
        | <a href="<c:url value='/admin/order/findByStatus.do?status=4'/>">交易成功</a>
        | <a href="<c:url value='/admin/order/findByStatus.do?status=5'/>">已取消</a>
    </p> --%>
    <div class="divMain">
        <div class="title">
            <div style="margin-top: 7px;">
                <span style="margin-left: 50px; margin-right: 50px;">用户名</span>
                <span style="margin-left: 100px; margin-right: 100px;">用户密码</span>
                <span style="margin-left: 80px; margin-right: 100px;">邮箱地址</span>
                <span style="margin-left: 250px;">操作</span>
            </div>
        </div>
        <br />
        <table align="center" border="0" width="100%" cellpadding="0"
            cellspacing="0">
<c:forEach items="${pb.beanList }" var="user">
            <tr>
                
                <td>${user.loginname }
                </td>
                <td>${user.loginpass }
                </td>
                <td>${user.email }
                </td>
                <td>
                <a href="#">删除</a><br />
                </td>
            </tr>
</c:forEach>             
        </table>
        <br />
        <%@include file="/jsps/pager/pager.jsp"%>
    </div>
</body>
</html>
