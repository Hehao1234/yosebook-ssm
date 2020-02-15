package com.tyust.service;

import java.util.List;

import com.tyust.entity.Order;
import com.tyust.pager.PageBean;

public interface OrderService {
	
	public void updateStatus(String oid,int status);
	
	public int findStatus(String oid);
	
	public Order load(String oid);
	
	public List showComment(String bname);
	
	public void createOrder(Order order);
	
	public PageBean<Order> myOrders(String uid,int pc);
	/**
	 * 查询所有订单
	 * @param pc
	 * @return
	 */
	public PageBean<Order> findAll(int pc);
	
	public PageBean<Order> findByStatus (int stauts ,int pc);

	public void addComment(Order order);
}
