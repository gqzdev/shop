package com.gqz.shop.service;

import java.util.List;

import com.gqz.shop.pojo.Category;

public interface CategoryService {
		
	public List<Category> getCategory();
	
	public int addCategory(Category category);
	
	
	public int delCategory(Integer cid);
}
