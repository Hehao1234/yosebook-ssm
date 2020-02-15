<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/desc.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#score").val()) {
				alert("评分不能为空！");
				return false;
			}
			if(!$("#comment").val()) {
				alert("评论不能为空！");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
<body>
	<div class="divOrder">
		<span>订单号：${order.oid }
			<span style="color:#CC3300;">
            <c:choose>
                <c:when test="${order.status eq 1 }">(等待付款)</c:when>
                <c:when test="${order.status eq 2 }">(准备发货)</c:when>
                <c:when test="${order.status eq 3 }">(等待确认)</c:when>
                <c:when test="${order.status eq 4 }">(交易成功)</c:when>
                <c:when test="${order.status eq 5 }">(已取消)</c:when>
            </c:choose>
            </span>
		　　　下单时间：<span style="color:#CC3300;">${order.ordertime }</span></span>
	</div>
	<div class="divContent">
		<div class="div2">
			<dl>
				<dt>收货人信息</dt>
				<dd>${order.address }</dd>
			</dl>
		</div>
		<div class="div2">
			<dl>
				<dt>商品清单</dt>
				<dd>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th class="tt">商品名称</th>
							<th class="tt" align="left">单价</th>
							<th class="tt" align="left">数量</th>
							<th class="tt" align="left">小计</th>
						</tr>
                    <c:forEach items="${order.orderItemList }" var="item">
						<tr style="padding-top: 20px; padding-bottom: 20px;">
							<td class="td" width="400px">
								<div class="bookname">
								  <img align="middle" width="70" src="<c:url value='/${item.book.image_b }'/>"/>
								  <a href="<c:url value='/book/load.do?bid=${item.book.bid }'/>">${item.book.bname }</a>
								</div>
							</td>
							<td class="td" >
								<span>&yen;${item.book.currPrice }</span>
							</td>
							<td class="td">
								<span>${item.quantity }</span>
							</td>
							<td class="td">
								<span>&yen;${item.subtotal }</span>
							</td>			
						</tr>
					</c:forEach>	
					</table>
				</dd>
			</dl>
		</div>
	<div style="margin: 10px 10px 10px 550px;">
		 <form action="<c:url value='/order/addComment.do?oid=${order.oid }'/>" method="post" onsubmit="return checkForm()">
    	评分：<input type="text" name="score" id="score" placeholder="请输入1-10"/><br/>
    	评论：<textarea rows="5" cols="50" name="comment" id="comment"></textarea><br/>
    	<input type="submit" value="提交"/>
    	<input type="button" value="返回" onclick="history.go(-1)"/>
    </form>
    </div>
    </div>
</body>
</html>

