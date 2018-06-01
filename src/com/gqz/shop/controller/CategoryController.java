package com.gqz.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gqz.shop.pojo.Category;
import com.gqz.shop.service.CategoryService;
import com.gqz.shop.util.MyException;


@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	
	//Ajax请求是.htm请求.SpringMVC不会将数据转换为JSON数据
	@RequestMapping("/admin/getCategories")
	@ResponseBody()
	public List<Category> getCategories(){
		return categoryService.getCategory();
	}
	
	@RequestMapping("/admin/categoryList")
	public ModelAndView categoryList() throws MyException{
		List<Category> list = categoryService.getCategory();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("categoryList", list);
		modelAndView.setViewName("category_list");
		return modelAndView;
	}
	
	//添加商品分类
	@RequestMapping("/admin/addCategory")
	@ResponseBody
	public String add(Category category){
		int result = categoryService.addCategory(category);
		if (result!=0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	//添加商品分类
	@RequestMapping("/admin/delCategory")
	@ResponseBody
	public String delete(Integer cid){
		int result = categoryService.delCategory(cid);
		if (result!=0) {
			return "1";
		}else {
			return "0";
		}
	}
	
}
