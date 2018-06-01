package com.gqz.shop.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.OrderitemPojo;
import com.gqz.shop.pojo.OrdersPojo;

public interface OrdersService {
	
	
	/**
	 * 
	* @Title: insertOrders
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @author ganquanzhong
	* @date  2018-5-24 上午08:11:07
	* @param uid  用户的id
	* @param total  所选商品的总价
	* @param cartIds 所选商品的id
	* @return  返回订单oid
	 */
	public Integer insertOrders(Integer uid,Double total,Integer cartIds[]);
	
	
	public PageInfo<OrdersPojo> getOrdersByPage(Integer uid,int page,int pageSize);
	
	//分页获取订单
	public PageInfo<List<OrderitemPojo>> getOrdersByUid(Integer uid,int page,int pageSize);
	
	//付款
	void update(Integer oid);
	//催单
	public void remind(Integer oid);
	//收货
	public void receive(Integer oid);
	//交易完成
	public void complete(Integer oid);
	//更新相应商品的销量
	public void updateVolume(Integer oid);
	
	//删除订单
	public void delete(Integer oid);
	
	
}
