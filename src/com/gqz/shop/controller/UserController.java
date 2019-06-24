package com.gqz.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.User;
import com.gqz.shop.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/admin/userlist")
	public ModelAndView userlist() {
		//List<User> userList = userService.getUserList();
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("userList", userList);
		// modelAndView.setViewName("/admin/admin_list.jsp");
		modelAndView.setViewName("user_list");
		return modelAndView;
	}
	
	@RequestMapping("/admin/getUserlist")
	@ResponseBody
	public PageInfo<User> getUserlist(int page, int pageSize) {
		return userService.getUserListByPage(page, pageSize);
	}
	

	// 有条件的查询user
	@RequestMapping("/admin/selectUserByTerm")
	public ModelAndView selectUserByTerm(User user) {
		List<User> userList = userService.selectUserByTerm(user);
		ModelAndView modelAndView = new ModelAndView();
		if (userList == null || userList.size() == 0) {
			modelAndView.addObject("msg", "没有查询结果,请更换查询条件!");
		} else {
			modelAndView.addObject("userList", userList);
		}
		modelAndView.setViewName("user_list");
		return modelAndView;
	}

}
