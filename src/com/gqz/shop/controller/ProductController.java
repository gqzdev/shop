package com.gqz.shop.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.Product;
import com.gqz.shop.service.ProductService;
import com.gqz.shop.util.CommonUtils;


@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("/admin/listProduct")
	@ResponseBody
	public PageInfo<Product> listProduct(int page,int pageSize){		
		PageInfo<Product> listProductsByPage = productService.ListProductsByPage(page, pageSize);
		return listProductsByPage;
	}
	
	//有条件的查询user
	
	@RequestMapping("/admin/addProduct")
	@ResponseBody
	public String addProduct(Product product,@RequestParam("imageFile")MultipartFile[] files){
		//从客户端接收文件的时候，文件单独处理
		
		CommonUtils.uploadFiles(product, files);
		//设置商品的其他属性
//		product.setNewPrice(product.getOldPrice());
		product.setPdate(new Date());
		product.setVolume(0);
		product.setState(0);//初始为未删除的
		
//		System.out.println("正在添加商品"+product);
		//访问service
		int result = productService.insertProduct(product);
		if (result!=0) {
			return "1";
		}else {
			return "0";
		}
	}
		
	@RequestMapping("/admin/delProduct")
	@ResponseBody
	public String delProduct(int pid){
		int result = productService.deleteProduct(pid);
		if (result!=0) {
			return "ok";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/admin/getProductByPid")
	@ResponseBody
	public Product getProductByPid(int pid){
		return  productService.getProductByPid(pid);
	}
	
}
