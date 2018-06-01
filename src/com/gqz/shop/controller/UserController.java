package com.gqz.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gqz.shop.pojo.User;
import com.gqz.shop.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/admin/userlist")
	public ModelAndView adminlist(){
		
		List<User> userList = userService.getUserList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userList", userList);
//		modelAndView.setViewName("/admin/admin_list.jsp");
		modelAndView.setViewName("user_list");
		return modelAndView;
	}
	
	//有条件的查询user
	@RequestMapping("/admin/selectUserByTerm")
	public ModelAndView selectUserByTerm(User user){
		
		
		
		List<User> userList = userService.getUserList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userList", userList);
		modelAndView.setViewName("user_list");
		return modelAndView;
	}
	
	
	
}
