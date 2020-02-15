package com.tyust.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tyust.entity.Book;
import com.tyust.entity.Comment;
import com.tyust.entity.Reply;
import com.tyust.entity.User;
import com.tyust.pager.PageBean;
import com.tyust.service.BookService;
import com.tyust.util.commons.CommonUtil;

@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/load.do")
	public String load(String bid,ModelMap map){
		Book book = bookService.load(bid);
		List<Comment> comments=bookService.findComments();
		List<Reply> replies=bookService.findReplys();
		map.addAttribute("book", book);
		map.addAttribute("comments", comments);
		//回复列表
		map.addAttribute("replies", replies);
		return "/jsps/book/desc";
	}
	
	private int getPc(HttpServletRequest request){
		int pc = 1;
		String param = request.getParameter("pc");
		if(param!=null && !param.trim().isEmpty()){
			try{
				pc = Integer.parseInt(param);
			}catch(RuntimeException e){ }
		}
		return pc;
	}
	
	private String getUrl(HttpServletRequest request){
		String url = request.getRequestURI()+"?"+request.getQueryString();
		int index = url.lastIndexOf("&pc=");
		if(index!=-1){
			url = url.substring(0, index);
		}
		return url;
	}
	@RequestMapping("/addComment.do")
	public String addComment(Comment comment,HttpServletRequest request,HttpSession session,ModelMap map){
//		System.out.println(comment);
		String content =request.getParameter("content");
		try {
			content = new String(content.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String commentor=request.getParameter("commentor");
		comment.setCommentor(commentor);
		comment.setContent(content);
		comment.setCommentId(CommonUtil.uuid());
		System.out.println("评论id是"+comment.getCommentId()+"\n评论内容是："+comment.getContent()+"\n评论者是："+comment.getCommentor()+"\n书本id是："+comment.getBid());
		String bid=comment.getBid();
//		User user=(User) session.getAttribute("loginUser");
		bookService.insertComment(comment);
		return "redirect:/book/load.do?bid="+bid;
	}
	
	/**
	 * 增加一条回复
	 */
	@RequestMapping("/addReply.do")
	public String addReply(Reply reply,HttpSession session,HttpServletRequest request){
		String bid=reply.getBid();
		String content = request.getParameter("content");
		String reply_for = request.getParameter("replyfor");
		String replyer = request.getParameter("replyer");
		String commentId = request.getParameter("commentId");
		try{
			content = new String(content.getBytes("ISO-8859-1"),"UTF-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
//		User user=(User) session.getAttribute("loginUser");
		reply.setContent(content);
		reply.setId(CommonUtil.uuid());
		reply.setReply_for(reply_for);
		reply.setReplyer(replyer);
		reply.setCommentId(commentId);
		System.out.println("id是："+reply.getBid()+"回复人是"+reply.getReplyer()+"回复内容是"+reply.getContent()+"是对"+reply.getReply_for()+"的回复"+"评论ID是"+reply.getCommentId());
		bookService.insertReply(reply);
		return "redirect:/book/load.do?bid="+bid;
	}
	
	/*@RequestMapping("/findProById.do")
	public String findProById(@RequestParam(value="bid") String bid,Model model){
		Book book=bookService.load(bid);
		model.addAttribute("book", book);
		//评论列表
		List<Comment> comments=bookService.findComments();
		model.addAttribute("comments", comments);
		//回复列表
		List<Reply> replies=bookService.findReplys();
		model.addAttribute("replies", replies);
		return "/jsps/book/desc"; 
	}*/
	@RequestMapping("/orderBy.do")
	public String orderBy(HttpServletRequest request){
		int pc = getPc(request);
		String url = getUrl(request);
		String uid = request.getParameter("bid");
		PageBean<Book> pd = bookService.orderBy(uid,pc);
		pd.setUrl(url);
		request.setAttribute("pd", pd);
		
		return "/jsps/book/recommand";
	}
	
	@RequestMapping("/findByCategory.do")
	public String findByCategory(HttpServletRequest request){
		int pc = getPc(request);
		String url = getUrl(request);
		String cid = request.getParameter("cid");
		PageBean<Book> pb = bookService.findByCategory(cid, pc);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "/jsps/book/list";
	}
	
	@RequestMapping("/findByAuthor.do")
	public String findByAuthor(HttpServletRequest request){
		int pc = getPc(request);
		String url = getUrl(request);
		String author = request.getParameter("author");
		try{
			author = new String(author.getBytes("ISO-8859-1"),"UTF-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		PageBean<Book> pb = bookService.findByAuthor(author, pc);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "/jsps/book/list";
	}
	
	@RequestMapping("/findByPress.do")
	public String findByPress(HttpServletRequest request){
		int pc = getPc(request);
		String url = getUrl(request);
		String press = request.getParameter("press");
		try{
			press = new String(press.getBytes("ISO-8859-1"),"UTF-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		PageBean<Book> pb = bookService.findByPress(press, pc);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "/jsps/book/list";
	}
	
	@RequestMapping("/findByBname.do")
	public String findByBname(HttpServletRequest request){
		int pc = getPc(request);
		String url = getUrl(request);
		String bname = request.getParameter("bname");
		try{
			bname = new String(bname.getBytes("ISO-8859-1"),"UTF-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		PageBean<Book> pb = bookService.findByBname(bname, pc);
		pb.setUrl(url);
		bname = "";
		request.setAttribute("pb", pb);
		return "/jsps/book/list";
	}
	
	@RequestMapping("/findByConbination.do")
	public String findByConbination(HttpServletRequest request,Book criteria){
		int pc = getPc(request);
		String url = getUrl(request);
		
		PageBean<Book> pb = bookService.findByConbination(criteria, pc);
		pb.setUrl(url);
		request.setAttribute("pb", pb);
		return "/jsps/book/list";
	}
}
