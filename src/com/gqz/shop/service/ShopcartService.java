package com.gqz.shop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.Shopcart;
import com.gqz.shop.pojo.ShopcartPojo;

public interface ShopcartService {
	public void insert(Shopcart shopcart);
	
	public List<ShopcartPojo> getCart(Integer uid);
	
	//分页显示购物车
	public PageInfo<ShopcartPojo> getCartByPage(Integer uid,int page,int pageSize);
	
	public void Modify(Shopcart shopcart);
	
	public void delete(Integer sid);
}
