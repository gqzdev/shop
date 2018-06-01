package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gqz.shop.mapper.CategoryMapper;
import com.gqz.shop.pojo.Category;
import com.gqz.shop.pojo.CategoryExample;
import com.gqz.shop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper categoryMapper;
	
	public List<Category> getCategory() {
		CategoryExample categoryExample=new CategoryExample();
		categoryExample.createCriteria().andStateEqualTo(0);
		List<Category> categoryList = categoryMapper.selectByExample(categoryExample);
		return categoryList;
	}

	public int addCategory(Category category) {
		category.setState(0);
		int result = categoryMapper.insertSelective(category);
		return result;
	}

	
	public int delCategory(Integer cid) {
		Category category = categoryMapper.selectByPrimaryKey(cid);
		category.setState(1);
		int result = categoryMapper.updateByPrimaryKeySelective(category);
		return result;
	}

}
