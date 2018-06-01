package com.gqz.shop.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.Category;
import com.gqz.shop.pojo.Comment;
import com.gqz.shop.pojo.CommentPojo;
import com.gqz.shop.pojo.OrderitemPojo;
import com.gqz.shop.pojo.OrdersPojo;
import com.gqz.shop.pojo.Product;
import com.gqz.shop.pojo.ProductPojo;
import com.gqz.shop.pojo.Shopcart;
import com.gqz.shop.pojo.ShopcartPojo;
import com.gqz.shop.pojo.User;
import com.gqz.shop.service.CategoryService;
import com.gqz.shop.service.CommentService;
import com.gqz.shop.service.OrderitemService;
import com.gqz.shop.service.OrdersService;
import com.gqz.shop.service.ProductService;
import com.gqz.shop.service.ShopcartService;
import com.gqz.shop.service.UserService;

/**
 * 
* @ClassName: FrontController
* @Description: shop项目前台控制器
* @author ganquanzhong
* @date 2018-5-31 上午09:02:41
 */
@Controller
public class FrontController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ShopcartService shopcartService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private OrderitemService orderitemService;
	
	//前台登录
	@RequestMapping("/checkUserLogin")
	@ResponseBody()
	public Map<String , String> checkUserLogin(User user,String checkcode,HttpSession session){
		Map<String, String> map=new HashMap<String, String>();
		
		String vCode=(String)session.getAttribute("vCode");
		
		if (checkcode.equalsIgnoreCase(vCode)) {
			//验证码正确 才验证用户名信息
			 User userResult = userService.checkLogin(user);
			if (userResult==null) {
				map.put("result", "error");
			}else {
				session.setAttribute("user", userResult);
				map.put("result", "ok");
			}
		}else {
			//验证码错误
			map.put("result", "vcodeerror");
		}
		return map;
	}
	
	//用户退出
	@RequestMapping("/exit")
	@ResponseBody()	
	public Map<String , String> exit(HttpSession session){
		Map<String, String> map=new HashMap<String, String>();
		User user = (User)session.getAttribute("user");
		if (user==null) {
			map.put("result", "error");
		}else {
			session.removeAttribute("user");
			map.put("result", "ok");
		}
		return map;
	}
	
	//用户信息
	@RequestMapping("/userInfo")
	@ResponseBody()
	public User userInfo(HttpSession session){
		User user = (User)session.getAttribute("user");
		return userService.findByUid(user.getUid());
	}
	
	//用户信息修改
	@RequestMapping("/userInfoModify")
	@ResponseBody()
	public Map<String , String> userInfoModify(User user,HttpSession session){
		User user1 = (User)session.getAttribute("user");
		Map<String, String> map=new HashMap<String, String>();
				
		if (user1!=null&&user!=null) {
			user.setUid(user1.getUid());
			//验证码正确   才进行注册
			int result = userService.update(user);
			if (result!=0) {
				session.setAttribute("user", user);
				map.put("result", "ok");
			}else {
				map.put("result", "error");
			}
		}else {
			//验证码错误
			map.put("result", "invalid");
		}
		return map;
	}
	
	
	//用户注册
	@RequestMapping("/userRegister")
	@ResponseBody()
	public Map<String , String> register(User user,String checkcode,HttpSession session){
		Map<String, String> map=new HashMap<String, String>();
		
		String vCode=(String)session.getAttribute("vCode");
		if (checkcode.equalsIgnoreCase(vCode)) {
			//验证码正确   才进行注册
			int result = userService.save(user);
			if (result!=0) {
				session.setAttribute("user", user);
				map.put("result", "ok");
			}else {
				map.put("result", "error");
			}
		}else {
			//验证码错误
			map.put("result", "vcodeerror");
		}
		return map;
	}
	
	// 获取商品分类
	@SuppressWarnings("unchecked")
	@RequestMapping("getCategories")
	@ResponseBody()
	public List<Category> getCategories(HttpSession session){
		//将商品分类保存在session		
		List<Category> categoryList = (List<Category>)session.getAttribute("categoryList");
		if (categoryList==null || categoryList.size()==0) {
			categoryList=categoryService.getCategory();
			session.setAttribute("categoryList",categoryList);
		}
		return categoryList;
	}
	
	@RequestMapping("getProductPic")
	@ResponseBody()
	public PageInfo<Product> getProductPic(){
		return productService.getProductPic();
	}
	
	@RequestMapping("getNewProduct")
	@ResponseBody()
	public PageInfo<Product> getNewProduct(){
		return productService.getNewProduct();
	}
	
	@RequestMapping("getHotProduct")
	@ResponseBody()
	public PageInfo<Product> getHotProduct(){
		return productService.getHotProduct();
	}
	
	@RequestMapping("getCateProduct")
	@ResponseBody()
	public PageInfo<Product> getCateProduct(int cid,int page,int pageSize){
		return productService.getProductByCid(cid, page, pageSize);
	}
	//test  http://localhost/shop/getCateProduct?cid=1&page=1&pageSize=10
	
	
	@RequestMapping("getProductsByName")
	@ResponseBody()
	public PageInfo<Product> getCateProduct(String name,int page,int pageSize){
		//编码的问题
		String content="";
		try {
			content= URLDecoder.decode(name, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return productService.getProductByame(content, page, pageSize);
	}
	//test  http://localhost/shop/getProductsByName?name=鞋&page=1&pageSize=10
	
	
	@RequestMapping("/getProductInfo")
	@ResponseBody()
	public ProductPojo getProductPojoByPid(int pid){
		return productService.getProductPojoByPid(pid);
	}
	// test  http://localhost/shop/getProductInfo?pid=2
	
	
	@RequestMapping("/getProductComment")
	@ResponseBody()
	public List<CommentPojo> getCommentPojoByPid(int pid){
		return commentService.getCommentPojosByPid(pid);
	}
	// test  http://localhost/shop/getProductComment?pid=72
	
	
	//加入购物车
	@RequestMapping("/addCart")
	@ResponseBody()
	public Map<String , String> addCart(Shopcart shopcart,HttpSession session){
		Map<String, String> map=new HashMap<String, String>();
		User user = (User)session.getAttribute("user");
		if (user!=null) {
			shopcart.setUid(user.getUid());//获取当前用户的UID,将其保存到购物车
			shopcartService.insert(shopcart);
			map.put("result", "ok");//成功将商品加入购物车
		}else {
			map.put("result", "error");//未登录
		}
		return map;
	}
	
	
	//查询购物车
	@RequestMapping("/getCart")
	@ResponseBody()
	public List<ShopcartPojo> getCart(HttpSession session){
		User user = (User)session.getAttribute("user");
		return shopcartService.getCart(user.getUid());
	}
	
	
	//通过分页查询购物车
	@RequestMapping("/getCartByPage")
	@ResponseBody()
	public PageInfo<ShopcartPojo> getCartByPage(HttpSession session,int page,int pageSize){
		User user = (User)session.getAttribute("user");
		if (user!=null) {
			return shopcartService.getCartByPage(user.getUid(), page, pageSize);
		}else {
			return null;
		}
	}
	
	//查询购物车
	@RequestMapping("/changeShopcart")
	@ResponseBody()
	public String changeShopcart(Shopcart shopcart,HttpSession session){
		User user = (User)session.getAttribute("user");
		shopcart.setUid(user.getUid());
		shopcartService.Modify(shopcart);
		return "ok";
	}
	
	//删除购物车
	@RequestMapping("/deleteShopcart")
	@ResponseBody()
	public String deleteShopcart(Integer sid){
		shopcartService.delete(sid);
		return "ok";
	}
	
	
	//提交订单
	@RequestMapping("/submitOrder")
	@ResponseBody()
	public Map<String , String> submitOrder(Double total,HttpServletRequest request,HttpSession session){
		Map<String, String> map=new HashMap<String, String>();
		User user = (User)session.getAttribute("user");//获取session中的用户信息
		String[] ids = request.getParameterValues("cartIds[]");
		Integer[] cartIds=new Integer[ids.length];
		for (int i = 0; i < ids.length; i++) {
			//将String类型转换为Integer类型
			cartIds[i]=Integer.parseInt(ids[i]);
		}
		//调用OrdersService方法
		Integer oid = ordersService.insertOrders(user.getUid(), total, cartIds);
		map.put("result",oid+"");//将订单的id返回
		return map;
	}
	
	
	//通过分页查询订单详情
	@RequestMapping("/getOrderInfoByPage")
	@ResponseBody()
	public PageInfo<OrderitemPojo> getOrderInfoByPage(Integer oid,int page,int pageSize,HttpSession session){
		User user = (User)session.getAttribute("user");
		if (user!=null) {
			return orderitemService.getOrderitemByPage(oid, page, pageSize);
		}else {
			return null;
		}
	}
	
	//付款
	@RequestMapping("/payOrders")
	@ResponseBody()
	public String payOrders(Integer oid,Double total){
		ordersService.update(oid);
		return "ok";
	}
	
	//通过分页查询订单详情[一条一条的]
	@RequestMapping("/getOrdersListByPage")
	@ResponseBody()
	public PageInfo<OrdersPojo> getOrdersListByPage(int page,int pageSize,HttpSession session){
		User user = (User)session.getAttribute("user");
		if (user!=null) {
			return ordersService.getOrdersByPage(user.getUid(), page, pageSize);
		}else {
			return null;
		}
	}
	
	//通过分页查询订单详情[分集合存储]
	@RequestMapping("/getOrdersListByUid")
	@ResponseBody()
	public PageInfo<List<OrderitemPojo>> getOrdersListByUid(int page,int pageSize,HttpSession session){
		User user = (User)session.getAttribute("user");
		if (user!=null) {
			return ordersService.getOrdersByUid(user.getUid(), page, pageSize);
		}else {
			return null;
		}
	}
	// test  http://localhost/shop/getOrdersListByUid?page=1&pageSize=5
	
	//删除订单
	@RequestMapping("/deleteOrders")
	@ResponseBody()
	public String deleteOrders(Integer oid){
		ordersService.delete(oid);
		return "ok";
	}
	//催单
	@RequestMapping("/remindOrders")
	@ResponseBody()
	public String remindOrders(Integer oid){
		ordersService.remind(oid);
		return "ok";
	}
	//确认收货
	@RequestMapping("/receiveOrders")
	@ResponseBody()
	public String receiveOrders(Integer oid){
		ordersService.receive(oid);
		return "ok";
	}
	//完成交易
	@RequestMapping("/completeOrders")
	@ResponseBody()
	public String completeOrders(Integer oid){
		//更新订单状态
		ordersService.complete(oid);
		//商品的销量更新
		ordersService.updateVolume(oid);
		return "ok";
	}
	
	//获取评价项
	@RequestMapping("/getEvaluateitem")
	@ResponseBody()
	public OrderitemPojo getEvaluateitem(int oid,int pid){
		return orderitemService.getOrderitemPojobyOidPid(oid, pid);
	}
	
	//评价商品
	@RequestMapping("/evaluateOrders")
	@ResponseBody()
	public String evaluateOrders(Integer pid,String content,HttpSession session){
		User user = (User)session.getAttribute("user");
		Comment comment = new Comment();
		comment.setUid(user.getUid());
		comment.setPid(pid);
		comment.setContent(content);
		comment.setCreated(new Date());
		comment.setState(0);
		commentService.add(comment);
		return "ok";
	}
}
