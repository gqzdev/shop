package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.shop.mapper.OrderitemMapper;
import com.gqz.shop.pojo.OrderitemPojo;
import com.gqz.shop.service.OrderitemService;

@Service
public class OrderitemServiceImpl implements OrderitemService {

	@Autowired
	private OrderitemMapper orderitemMapper;
	
	public PageInfo<OrderitemPojo> getOrderitemByPage(Integer oid, int page,int pageSize) {
		PageHelper.startPage(page,pageSize);
		List<OrderitemPojo> list = orderitemMapper.selectOrderitemPojoByOid(oid);
		changeProductList(list);
		return new PageInfo<OrderitemPojo>(list);
	}

	
	//封装 处理图片路径的问题 和商品名称的截取
	private  void changeProductList(List<OrderitemPojo> list){
		//处理图片路径的问题 
		for (OrderitemPojo orderitemPojo : list) {
			String image = orderitemPojo.getImage();
			String[] split = image.split(",");//通过","将多张图片分隔开，保存到数组中
			orderitemPojo.setImage("/pic/"+split[0]);
			//当商品名称过长时，进行截取
//			if (shopcartPojo.getPname().length()>8) {
//				shopcartPojo.setPname(shopcartPojo.getPname().substring(0, 8)+"...");
//			}
		}
	}


	//评价订单项
	public OrderitemPojo getOrderitemPojobyOidPid(Integer oid,Integer pid) {
		List<OrderitemPojo> orderitemPojoList = orderitemMapper.selectOrderitemPojoByOidPid(oid, pid);
		OrderitemPojo orderitemPojo = orderitemPojoList.get(0);
		String image = orderitemPojo.getImage();
		String[] split = image.split(",");//通过","将多张图片分隔开，保存到数组中
		orderitemPojo.setImage("/pic/"+split[0]);
		return orderitemPojo;
	}
}
