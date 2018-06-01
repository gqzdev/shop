package com.gqz.shop.service;

import java.util.List;

import com.gqz.shop.pojo.User;



public interface UserService {
	public List<User> getUserList();
	
	public List<User> query(User user);
	
	public int save(User user);
	public void delete(User user);
	
	public int update(User user);
	
	public User findByUid(Integer uid);
	
	public User checkLogin(User user);
}
