package com.gqz.shop.service;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.OrderitemPojo;

public interface OrderitemService {
	
	public PageInfo<OrderitemPojo> getOrderitemByPage(Integer oid,int page,int pageSize);
	
	//Pre 评价订单项
	public OrderitemPojo getOrderitemPojobyOidPid(Integer oid,Integer pid);
	
}
