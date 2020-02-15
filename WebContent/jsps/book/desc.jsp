<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书详细</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/desc.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/comment.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/layui.css'/>">
<script src="<c:url value='/jsps/js/book/desc.js'/>"></script>
<script src="<c:url value='/jsps/css/book/layui.js'/>"></script>
</head>

<body>
	<div class="divBookName" style="margin-left: 35px;">${book.bname }</div>
	<div>
		<img align="top" style="margin-left:35px; margin-top:15px;"
			src="<c:url value='/${book.image_w }'/>" class="img_image_w" />
		<div class="divBookDesc">
			<ul>
				<li>商品编号：${book.bid }</li>
				<li>优思价：<span class="price_n">&yen;${book.currPrice }</span></li>
				<li>定价：<span class="spanPrice">&yen;${book.price }</span> 折扣： <span
					style="color: #c30;">${book.discount }</span>折
				</li>
			</ul>
			<hr class="hr1" />
			<table>
				<%-- <tr>
					<td colspan="3">评价：<a
						href="<c:url value='/order/showComment?bname=${book.bname }'/>">查看评价</a>
						</td>
						</tr> --%>
				<tr>
					<td colspan="3">作者：${book.author } 著</td>
				</tr>
				<tr>
					<td colspan="3">出版社：${book.press }</td>
				</tr>
				<tr>
					<td colspan="3">出版时间：${book.publishtime }</td>
				</tr>
				<tr>
					<td>版次：${book.edition }</td>
					<td>页数：${book.pageNum }</td>
					<td>字数：${book.wordNum }</td>
				</tr>
				<tr>
					<td width="180">印刷时间：${book.printtime }</td>
					<td>开本：${book.booksize } 开</td>
					<td>纸张：${book.paper }</td>
				</tr>
			</table>
			<div class="divForm">
				<form id="form1" action="<c:url value='/cartItem/add.do'/>"
					method="post">
					<input type="hidden" name="bid" value="${book.bid }" /> 我要买：<input
						id="cnt" style="width: 40px; text-align: center;" type="text"
						name="quantity" value="1" />件
				</form>
				<a id="btn" href="javascript:$('#form1').submit();"></a>
			</div>
		</div>
	</div>
	<div class="container" style="width: 883px">
		<div class="commentbox">
			<form action="<c:url value='/book/addComment.do'/>" method="get">
				<textarea id="content" name="content" class="mytextarea"
					style="width: 760px;height: 45px;resize: none;"
					placeholder="发表商品评论..." onkeyup="keyUP(this)"></textarea>
				<input type="hidden" name="commentor" value="${sessionUser.loginname}">
				<input type="hidden" name="bid" value="${book.bid }">
				<button id="comment" type="submit" style="border: 0">评论</button>
			</form>
		</div>
		<!--回复区域 begin-->
		<div>
			<!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
			<c:forEach items="${comments }" var="comment">
				<!-- 如果留言信息是在本chan下的才显示 -->
				<c:if test="${comment.bid eq book.bid }">
					<div class="comment-show-con clearfix">
						
						<div class="comment-show-con-list pull-left clearfix">
							<div class="pl-text clearfix">
								<a href="#" class="comment-size-name">${comment.commentor }
								</a>: &nbsp;${comment.content }
							</div>
							<%-- <div class="date-dz">
								<!--  -->
								<span class="date-dz-left pull-left comment-time">
								<fmt:formatDate value="${comment.date }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
								<!-- <p class="date-dz-right pull-right comment-pl-block">
									<a href="javascript:;" class="removeBlock">删除</a>
									<a href="javascript:;"
										class="date-dz-pl pl-hf hf-con-block pull-left"
										onclick="btnReplyClick(this)">回复</a>
								</p> -->
							</div> --%>
							<!-- 回复表单默认隐藏 -->
							<%--  <div class="replybox hide" style="margin-top: 40px;">
								<form action="<c:url value='/book/addReply.do'/>" method="get">
									<textarea id="content" name="content" class="mytextarea"
										style="width: 640px;height: 45px;resize: none;"
										placeholder="发表商品评论..." onkeyup="keyUP(this)"></textarea>
									<input type="hidden" name="replyer"
										value="${user.loginname}"> <input type="hidden"
										name="bid" value="${book.bid }"> <input
										type="hidden" name="replyfor" value="${comment.commentor }">
									<input type="hidden" name="commentId" value="${comment.commentId }">
									<input type="hidden" name="replyId" value="${reply.id }">
									<button id="reply" type="submit" class="plBtn"
										style="border: 0">回复</button>
								</form>
							</div>  --%>
							<!-- <div class="hf-list-con"></div> -->
						</div>
						<!-- 以下是回复信息 -->
						<%-- <c:forEach items="${replies}" var="reply">
							<!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
							<c:if
								test="${reply.bid eq book.bid && reply.commentId eq comment.commentId }">
								<div style="width: 773px;margin-left: 70px;">
									<div class="comment-show-con-list pull-left clearfix">
										<div class="pl-text clearfix">
											<a href="#" class="comment-size-name">${reply.replyer } </a>:
											<span class="my-pl-con">&nbsp;${reply.content }</span>
										</div>
										<div class="hf-list-con"></div>
									</div>
								</div>
							</c:if>
						</c:forEach> --%>
					</div>
				</c:if>
			</c:forEach>
		</div>

	</div>
	<!-- </td>
	</tr>
	</tbody>
	</table>
	</div> -->
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
