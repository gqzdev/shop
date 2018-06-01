package com.gqz.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PageController {
	
	//设置JSP页面的访问，可以不要.jsp后缀
	@RequestMapping("/admin/{page}")
	public String showAdminPage(@PathVariable String page){
		return "/admin/"+page;
	}

	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page){
		return page;
	}
}