package com.tyust.service;

import com.tyust.entity.User;
import com.tyust.pager.PageBean;

public interface UserService {
	
	public User info(String loginname);
	
	public void updatePassword(String uid, String oldPass,String newPass) throws Exception;
	
	public void updateInfo(String uid,String email,String gender,String nickname) throws Exception;
	
	public User login(User user);
	
	public PageBean<User> findAll(int pc);
	
	public void activation(String code)throws Exception;
	
	public boolean ajaxValidateLoginname(String loginname);
	
	public boolean ajaxValidateEmail(String email);
	
	public void regist(User user) throws Exception;
		
}
