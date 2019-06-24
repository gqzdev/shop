package com.gqz.shop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.shop.mapper.InventoryMapper;
import com.gqz.shop.mapper.OrderitemMapper;
import com.gqz.shop.mapper.OrdersMapper;
import com.gqz.shop.mapper.ProductMapper;
import com.gqz.shop.mapper.ShopcartMapper;
import com.gqz.shop.pojo.Inventory;
import com.gqz.shop.pojo.Orderitem;
import com.gqz.shop.pojo.OrderitemExample;
import com.gqz.shop.pojo.OrderitemPojo;
import com.gqz.shop.pojo.Orders;
import com.gqz.shop.pojo.OrdersExample;
import com.gqz.shop.pojo.OrdersPojo;
import com.gqz.shop.pojo.Product;
import com.gqz.shop.pojo.Shopcart;
import com.gqz.shop.pojo.OrdersExample.Criteria;
import com.gqz.shop.service.OrdersService;
import com.gqz.shop.util.DeliveryNum;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersMapper ordersMapper;

	@Autowired
	private ShopcartMapper shopcartMapper;

	@Autowired
	private OrderitemMapper orderitemMapper;

	@Autowired
	private ProductMapper productMapper;
	
	
	@Autowired
	private InventoryMapper inventoryMapper;
	
	

	// //订单对象
	// public static Orders orders=new Orders();

	// 通过选中的商品项 生成订单
	public Integer insertOrders(Integer uid, Double total, Integer[] cartIds) {
		// 1.生成orders订单，填充属性信息，添加到数据表中
		Orders orders = new Orders();
		orders.setUid(uid);
		orders.setTotal(total);
		orders.setOrdertime(new Date());
		orders.setState(0);
		orders.setStatus(0);
		ordersMapper.insertSelective(orders);

		// 2.获取生成订单的oid(用于保存到orderitem中的oid中)
		/**
		 * 使用useGeneratedKeys="true" keyProperty="oid"
		 */
		Integer oid = orders.getOid();

		// 3.通过cartIds[]获取所选每个商品的信息，并且将其插入到orderitem中，其中orderitem.oid值为orders中的主键orders.oid
		for (int i = 0; i < cartIds.length; i++) {
			Shopcart shopcart = shopcartMapper.selectByPrimaryKey(cartIds[i]);
			// 将订单中的每条商品保存到订单项中
			Orderitem orderitem = new Orderitem();
			orderitem.setPid(shopcart.getPid());
			orderitem.setOid(oid);
			orderitem.setCount(shopcart.getCount());
			orderitem.setSubtotal(shopcart.getSubtotal());
			orderitem.setSpecid(shopcart.getSpecid());//添加商品的规格
			orderitemMapper.insertSelective(orderitem);

			// 在生成订单后，删除购物车里相应的商品
			shopcartMapper.deleteByPrimaryKey(cartIds[i]);
		}
		return oid;
	}

	// 查询订单list[每一条记录联查获取]
	public PageInfo<OrdersPojo> getOrdersByPage(Integer uid, int page,	int pageSize) {
		PageHelper.startPage(page, pageSize);
		List<OrdersPojo> list = ordersMapper.selectOrdersPojoByUid(uid);
		changeOrdersList(list);
		return new PageInfo<OrdersPojo>(list);
	}
	
	//后台管理查询订单
	public PageInfo<OrdersPojo> getOrdersByPage(int page, int pageSize) {
		PageHelper.startPage(page, pageSize);
		List<OrdersPojo> list = ordersMapper.selectOrdersPojo();
		return new PageInfo<OrdersPojo>(list);
	}

	// 通过uid查询订单
	// [通过uid获取orders集合ordersList，然后根据ordersList中的oid在orderitem表中查询订单对应的订单项，保存到List<orderitemPojo>中]
	public PageInfo<List<OrderitemPojo>> getOrdersByUid(Integer uid, int page,
			int pageSize) {
		PageHelper.startPage(page, pageSize);
		OrdersExample ordersExample = new OrdersExample();
		Criteria createCriteria = ordersExample.createCriteria();
		createCriteria.andUidEqualTo(uid);// 根据uid查询orders
		createCriteria.andStatusEqualTo(0);// 根据为删除的
		createCriteria.andUidEqualTo(uid).andStatusEqualTo(0);
		ordersExample.setOrderByClause("oid desc");// 根据订单oid降序查询

		List<Orders> ordersList = ordersMapper.selectByExample(ordersExample);
		// 根据ordersListfenye
		PageInfo<Orders> ordersList_pageInfo = new PageInfo<Orders>(ordersList);

		// 创建List
		List<List<OrderitemPojo>> orderitemList = new ArrayList<List<OrderitemPojo>>();
		// 根据订单中的每一个订单进行遍历
		for (Orders orders : ordersList_pageInfo.getList()) {
			List<OrderitemPojo> orderitemPojoList = orderitemMapper.selectOrderitemPojoByOid(orders.getOid());

			for (OrderitemPojo orderitemPojo : orderitemPojoList) {
				// 格式化图片信息
				String image = orderitemPojo.getImage();
				String[] split = image.split(",");// 通过","将多张图片分隔开，保存到数组中
				orderitemPojo.setImage("/pic/" + split[0]);

				// 讲订单的信息填充到每个订单项中
				orderitemPojo.setOrdertime(orders.getOrdertime());
				orderitemPojo.setTotal(orders.getTotal());
				String number = orders.getNumber();
				if (number == "" || number == null) {
					number = "还未生成订单号!";
				}
				orderitemPojo.setNumber(number);
				Integer state = orders.getState();
				String strState = "";
				if (state == 0) {
					strState = "未付款";// 0
				} else if (state == 1) {
					strState = "未发货";// 1
				} else if (state == 2) {
					strState = "已发货";// 2
				} else if (state == 3) {
					strState = "已收货";// 3
				} else if (state == 4) {
					strState = "交易完成";// 4
				}
				orderitemPojo.setState(strState);
			}
			// 将写好的orderitemPojo方法orderitemList中
			orderitemList.add(orderitemPojoList);
		}
		// 重新改写PageInfo 将List<List<OrderitemPojo>>集合分页到
		// PageInfo<List<OrderitemPojo>>中
		PageInfo<List<OrderitemPojo>> pageInfo = new PageInfo<List<OrderitemPojo>>(
				orderitemList);
		// 由于是根据ordersList_pageInfo进行物理分页的，故需要重新设置pageInfo中的信息
		pageInfo.setPages(ordersList_pageInfo.getPages());
		pageInfo.setTotal(ordersList_pageInfo.getTotal());
		pageInfo.setHasNextPage(ordersList_pageInfo.isHasNextPage());
		pageInfo.setHasPreviousPage(ordersList_pageInfo.isHasPreviousPage());
		return pageInfo;
	}

	// 删除订单
	public void delete(Integer oid) {
		// OrderitemExample orderitemExample = new OrderitemExample();
		// orderitemExample.createCriteria().andOidEqualTo(oid);
		// List<Orderitem> orderitemList =
		// orderitemMapper.selectByExample(orderitemExample);
		// for (Orderitem orderitem : orderitemList) {
		// orderitemMapper.deleteByPrimaryKey(orderitem.getItemid());
		// }

		Orders orders = new Orders();
		orders.setOid(oid);
		orders.setStatus(1);
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	// 更新订单的状态 [付款]
	public void update(Integer oid) {
		Orders orders = ordersMapper.selectByPrimaryKey(oid);
		orders.setState(1);
		ordersMapper.updateByPrimaryKey(orders);
	}

	// 催单 发货时生成物流编号
	public void remind(Integer oid) {
		Orders orders = new Orders();
		orders.setOid(oid);
		orders.setState(2);
		// 创建物流编号
		new DeliveryNum();
		orders.setNumber(DeliveryNum.getDeliveryNum());
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	// 收货
	public void receive(Integer oid) {
		Orders orders = new Orders();
		orders.setOid(oid);
		orders.setState(3);
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	// 交易完成
	public void complete(Integer oid) {
		Orders orders = new Orders();
		orders.setOid(oid);
		orders.setState(4);
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	// 完成交易后，更新订单里商品的销量  加销量  减库存
	public void updateVolume(Integer oid) {
		OrderitemExample orderitemExample = new OrderitemExample();
		orderitemExample.createCriteria().andOidEqualTo(oid);
		List<Orderitem> orderitemList = orderitemMapper.selectByExample(orderitemExample);
		for (Orderitem orderitem : orderitemList) {
			//更新商品的销量
			Product product = productMapper.selectByPrimaryKey(orderitem.getPid());
			product.setVolume(product.getVolume() + orderitem.getCount());
			product.setTotal(product.getTotal()-orderitem.getCount());
			productMapper.updateByPrimaryKeySelective(product);
			//更新对应商品规格的库存
			if (orderitem.getSpecid()!=0) {
				Inventory inventory = inventoryMapper.selectByPrimaryKey(orderitem.getSpecid());
				inventory.setAmount(inventory.getAmount()-orderitem.getCount());
				inventoryMapper.updateByPrimaryKeySelective(inventory);
			}
		}

	}

	// 直接加入购物车
	/**
	 * 
	* @Title: insertOrders
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @author ganquanzhong
	* @date  2018年6月3日 下午10:42:41
	* @param uid  用户id
	* @param pid  商品id 
	* @param count  数量
	* @param total  总价
	* @return
	 */
	public Integer insertOrdersByDirect(Integer uid,Integer pid,Integer count, Double total,Integer specid ) {
		// 1.生成orders订单，填充属性信息，添加到数据表中
		Orders orders = new Orders();
		orders.setUid(uid);
		orders.setTotal(total);
		orders.setOrdertime(new Date());
		orders.setState(0);
		orders.setStatus(0);
		ordersMapper.insertSelective(orders);

		// 2.获取生成订单的oid(用于保存到orderitem中的oid中)
		/**
		 * 使用useGeneratedKeys="true" keyProperty="oid"
		 */
		Integer oid = orders.getOid();

		// 3.其中orderitem.oid值为orders中的主键orders.oid

		// 将订单中的每条商品保存到订单项中
		Orderitem orderitem = new Orderitem();
		orderitem.setPid(pid);
		orderitem.setOid(oid);
		orderitem.setCount(count);
		orderitem.setSubtotal(total);
		orderitem.setSpecid(specid);//添加商品的规格
		orderitemMapper.insertSelective(orderitem);

		return oid;
	}

	// 封装 处理图片路径的问题 和商品名称的截取
	private void changeOrdersList(List<OrdersPojo> list) {
		// 处理图片路径的问题
		for (OrdersPojo ordersPojo : list) {
			String image = ordersPojo.getImage();
			String[] split = image.split(",");// 通过","将多张图片分隔开，保存到数组中
			ordersPojo.setImage("/pic/" + split[0]);
			// 当商品名称过长时，进行截取
			// if (shopcartPojo.getPname().length()>8) {
			// shopcartPojo.setPname(shopcartPojo.getPname().substring(0,
			// 8)+"...");
			// }
		}
	}

}
