package com.gqz.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.OrdersPojo;
import com.gqz.shop.service.OrdersService;

/**
 * 
 * @ClassName: OrdersController
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author ganquanzhong
 * @date 2018年5月6日 下午11:00:24
 */
@Controller
public class OrdersController {
	@Autowired
	private OrdersService ordersService;

	// 后台管理订单
	@RequestMapping("/admin/getOrdersList")
	@ResponseBody
	public PageInfo<OrdersPojo> getOrdersList(int page, int pageSize) {
		return ordersService.getOrdersByPage(page, pageSize);
	}

	// 后台删除订单
	@RequestMapping("/admin/delectOrder")
	@ResponseBody
	public void delectOrder(int oid) {
		 ordersService.delete(oid);
	}
}
