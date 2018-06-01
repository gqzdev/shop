package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.shop.mapper.ShopcartMapper;
import com.gqz.shop.pojo.Shopcart;
import com.gqz.shop.pojo.ShopcartPojo;
import com.gqz.shop.service.ShopcartService;

@Service
public class ShopcartServiceImpl implements ShopcartService {

	@Autowired
	private ShopcartMapper shopcartMapper;
	
	public void insert(Shopcart shopcart) {
		shopcartMapper.insertSelective(shopcart);
	}

	public List<ShopcartPojo> getCart(Integer uid) {
		List<ShopcartPojo> list = shopcartMapper.selectShopcartPojoByUid(uid);
		changeProductList(list);
		return list;
	}

	//分页
	public PageInfo<ShopcartPojo> getCartByPage(Integer uid,int page,int pageSize) {
		PageHelper.startPage(page,pageSize);
		List<ShopcartPojo> list = shopcartMapper.selectShopcartPojoByUid(uid);
		changeProductList(list);
		return new PageInfo<ShopcartPojo>(list);
	}
	

	//封装 处理图片路径的问题 和商品名称的截取
	private  void changeProductList(List<ShopcartPojo> list){
		//处理图片路径的问题 
		for (ShopcartPojo shopcartPojo : list) {
			String image = shopcartPojo.getImage();
			String[] split = image.split(",");//通过","将多张图片分隔开，保存到数组中
			shopcartPojo.setImage("/pic/"+split[0]);
			//当商品名称过长时，进行截取
//			if (shopcartPojo.getPname().length()>8) {
//				shopcartPojo.setPname(shopcartPojo.getPname().substring(0, 8)+"...");
//			}
		}
	}

	//update
	public void Modify(Shopcart shopcart) {
		shopcartMapper.updateByPrimaryKeySelective(shopcart);
	}

	//delete
	public void delete(Integer sid) {
		shopcartMapper.deleteByPrimaryKey(sid);
	}



}
