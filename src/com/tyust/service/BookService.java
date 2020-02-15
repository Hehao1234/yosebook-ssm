package com.tyust.service;

import java.util.List;

import com.tyust.entity.Book;
import com.tyust.entity.Comment;
import com.tyust.entity.Reply;
import com.tyust.pager.PageBean;

public interface BookService {
	
	public int findBookCountByCategory(String cid);
	
	public void insertComment(Comment comment);
	
	public void insertReply(Reply reply);
	
	public List<Comment> findComments();
	
	public List<Reply> findReplys();
	
	public Book load(String bid);
	
	public PageBean<Book> orderBy(String bid, int pc);
	
	public PageBean<Book> findByCategory(String cid, int pc);
	
	public PageBean<Book> findByBname(String bname, int pc);
	
	public PageBean<Book> findByAuthor(String author, int pc);
	
	public PageBean<Book> findByPress(String press, int pc);
	
	public PageBean<Book> findByConbination(Book criteria, int pc);
	
	public void addBook(Book book);
	
	public void edit(Book book);
	
	public void delete(String bid);
	
}
