<%-- <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评价</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/desc.css'/>">
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
			<span style="font-weight: 900; font-size: 15px;">合计金额：</span>
			<span class="price_t">&yen;${order.total }</span><br/>
			</div>
	<div style="background-color:#d3d3d3;width:900px;">
					<table class="table table-bordered">
						<tbody>
							<tr class="active">
								<th><strong>商品评论</strong></th>
							</tr>
							<tr class="warning">
								<td>
								<div class="container" style="width: 883px">
									<div class="commentbox">
									   <form action="/order/addComment">
										<textarea id="content" name="content" class="mytextarea" style="width: 760px;height: 45px;resize: none;" placeholder="发表商品评论..." onkeyup="keyUP(this)"></textarea>
										<input type="hidden" name="commentor" value="${user.loginname}">
										<input type="hidden" name="pid" value="${book.bid }">
										<button id="comment" type="submit" class="plBtn" style="border: 0">评论</button>
									   </form>
									</div>
									<!--回复区域 begin-->
									<div>
										<!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
										<c:forEach items="${comments }" var="comment">
											<!-- 如果留言信息是在本chan下的才显示 -->
											<c:if test="${comment.bid eq product.bid }">
											     <div class="comment-show-con clearfix">
											         <div class="comment-show-con-img pull-left"><img src="${pageContext.request.contextPath}/${comment.commentHeader }" style="width: 45px;height: 45px;border-radius: 50%;" alt="头像"></div>
											         <div class="comment-show-con-list pull-left clearfix">
											             <div class="pl-text clearfix">
											                 <a href="#" class="comment-size-name">${ } </a>: 	
											                 <span class="my-pl-con">&nbsp;${comment.content }</span>
											             </div>
											             <div class="date-dz">      <!--  -->
											                 <span class="date-dz-left pull-left comment-time"><fmt:formatDate value="${comment.date }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
											                 <p class="date-dz-right pull-right comment-pl-block">
											                     <!-- <a href="javascript:;" class="removeBlock">删除</a> -->
											                     <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="btnReplyClick(this)">回复</a>
											                 </p>
											             </div>
											             <!-- 回复表单默认隐藏 -->
											             <div class="replybox hide" style="margin-top: 40px;">
														   <form action="${pageContext.request.contextPath}/addReply">
															<textarea id="content" name="content" class="mytextarea" style="width: 640px;height: 45px;resize: none;" placeholder="发表商品评论..." onkeyup="keyUP(this)"></textarea>
															<input type="hidden" name="replyer" value="${loginUser.username}">
															<input type="hidden" name="pid" value="${product.pid }">
															<input type="hidden" name="replyfor" value="${comment.commentor }">
															<input type="hidden" name="commentId" value="${comment.id }">
															<input type="hidden" name="replyId" value="${reply.id }">
															<button id="reply" type="submit" class="plBtn" style="border: 0">回复</button>
														   </form>
														</div>
											            <div class="hf-list-con"></div>
											         </div>
											         <!-- 以下是回复信息 -->
											         <c:forEach items="${replies}" var="reply">
											         	<!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
											         	<c:if test="${reply.pid eq product.pid && reply.commentId eq comment.id }">
												         <div style="width: 773px;margin-left: 70px;">
												         	<div class="comment-show-con-img pull-left"><img src="${pageContext.request.contextPath}/${reply.replyHeader }" style="width: 45px;height: 45px;border-radius: 50%;" alt="头像"></div>
													         <div class="comment-show-con-list pull-left clearfix">
													             <div class="pl-text clearfix">
													                 <a href="#" class="comment-size-name">${reply.replyer } </a>: 	
													                 <span class="my-pl-con">&nbsp;${reply.content }</span>
													             </div>
													             <div class="date-dz">      <!--  -->
													                 <span class="date-dz-left pull-left comment-time"><fmt:formatDate value="${reply.date }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													                 <p class="date-dz-right pull-right comment-pl-block">
													                     <!-- <a href="javascript:;" class="removeBlock">删除</a> -->
													                     <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" onclick="btnReplyClick(this)">回复</a>
													                 </p>
													             </div>
													             <!-- 回复表单默认隐藏 -->
													             <div class="replybox hide" style="margin-top: 40px;">
																   <form action="${pageContext.request.contextPath}/addReply">
																	<textarea id="content" name="content" class="mytextarea" style="width: 572px;height: 45px;resize: none;" placeholder="发表商品评论..." onkeyup="keyUP(this)"></textarea>
																	<input type="hidden" name="replyer" value="${loginUser.username}">
																	<input type="hidden" name="pid" value="${product.pid }">
																	<input type="hidden" name="replyfor" value="${comment.commentor }">
																	<input type="hidden" name="commentId" value="${comment.id }">
																	<input type="hidden" name="replyId" value="${reply.id }">
																	<button id="reply" type="submit" class="plBtn" style="border: 0">回复</button>
																   </form>
																</div>
													            <div class="hf-list-con"></div>
													         </div>
													     </div>
											         	</c:if>
											         </c:forEach> 
											     </div>
											</c:if>
										</c:forEach>
									</div>
							        
							    </div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
      /*   var content = $(t).val();
        alert(content); */
        if(len > 100){
            $(t).val($(t).val().substring(0,101));
        }
    }
</script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
	function btnReplyClick(elem) {
	    var $ = layui.jquery;
	    //console.log(!$(this))
	    if($(this)){
	    }else if(!$(this)){
	    	//没有用处
	    	$(elem).parent('p').parent('.date-dz').siblings('.replybox').toggleClass('layui-show');
	    }
	    //对添加和移除被选元素的一个或多个类进行切换
	    $(elem).parent('p').parent('.date-dz').siblings('.replybox').toggleClass('hide');
	    if ($(elem).text() == '回复') {
	        $(elem).text('收起')
	    } else {
	        $(elem).text('回复')
	    }
	}
</script>
</body>
</html>

 --%>