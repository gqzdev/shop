package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.shop.mapper.ProductMapper;
import com.gqz.shop.pojo.Product;
import com.gqz.shop.pojo.ProductExample;
import com.gqz.shop.pojo.ProductPojo;
import com.gqz.shop.pojo.ProductExample.Criteria;
import com.gqz.shop.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper; 
	
	//insertProduct
	public int insertProduct(Product product) {
		int result = productMapper.insertSelective(product);
		return result;
	}

	//查询所有product 列表 byPage
	public PageInfo<Product> ListProductsByPage(int page,int pageSize) {
		PageHelper.startPage(page, pageSize);
		
		ProductExample productExample = new ProductExample();
		productExample.createCriteria().andStateEqualTo(0);//查询未删除的
		productExample.setOrderByClause("pid desc");//通过pid desc降序查询
		List<Product> list = productMapper.selectByExample(productExample);
		
		//保存分页对象
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		return pageInfo;
	}

	
	public PageInfo<Product> getProductPic() {
		PageHelper.startPage(1, 4);
		ProductExample productExample = new ProductExample();
		Criteria criteria = productExample.createCriteria();
		criteria.andIsPicEqualTo(1);//查询是轮播图片的商品
		criteria.andStateEqualTo(0);//未删除的
		productExample.setOrderByClause("pid desc");//通过pid desc降序查询
		List<Product> list = productMapper.selectByExample(productExample);
		//处理图片路径的问题 
		changeProductList(list);
		//保存分页对象
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		return pageInfo;
	}

	public PageInfo<Product> getHotProduct() {
		PageHelper.startPage(1, 11);
		ProductExample productExample = new ProductExample();
		Criteria criteria = productExample.createCriteria();
		criteria.andIsHotEqualTo(1);//查询是热门商品的商品
		criteria.andStateEqualTo(0);//未删除的
		productExample.setOrderByClause("pid desc");//通过pid desc降序查询
		List<Product> list = productMapper.selectByExample(productExample);
		//处理图片路径的问题 
		changeProductList(list);
		//保存分页对象
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		return pageInfo;
	}

	public PageInfo<Product> getNewProduct() {
		PageHelper.startPage(1, 11);
		ProductExample productExample = new ProductExample();
		Criteria criteria = productExample.createCriteria();
		criteria.andStateEqualTo(0);//未删除的
		productExample.setOrderByClause("pid desc");//通过pid desc降序查询
		List<Product> list = productMapper.selectByExample(productExample);
		//处理图片路径的问题 
		changeProductList(list);
		//保存分页对象
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		return pageInfo;
	}

	//获取商品分类的list
	public PageInfo<Product> getProductByCid(int cid, int page, int pageSize) {
		PageHelper.startPage(page, pageSize);
		ProductExample productExample = new ProductExample();
		Criteria criteria = productExample.createCriteria();
		criteria.andCidEqualTo(cid);  //根据category分类查询
		criteria.andStateEqualTo(0);//未删除的
		productExample.setOrderByClause("pid desc");//通过pid desc降序查询
		List<Product> list = productMapper.selectByExample(productExample);
		//处理图片路径的问题 
		changeProductList(list);
		//保存分页对象
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		return pageInfo;
	}

	//获取商品名查询
	public PageInfo<Product> getProductByame(String name, int page, int pageSize) {
		PageHelper.startPage(page, pageSize);
		
		ProductExample productExample = new ProductExample();
		Criteria criteria = productExample.createCriteria();
		criteria.andPnameLike("%"+name+"%");//根据pname进行模糊查询
		criteria.andStateEqualTo(0);//未删除的
		productExample.setOrderByClause("pid desc");//通过pid desc降序查询
		List<Product> list = productMapper.selectByExample(productExample);
		//处理图片路径的问题 
		changeProductList(list);
		//保存分页对象
		PageInfo<Product> pageInfo = new PageInfo<Product>(list);
		return pageInfo;
	}
	
	//通过商品的pid查询商品的详细信息，包括商品图片、名称、评论等
	public ProductPojo getProductPojoByPid(Integer pid) {
		return productMapper.selectProductPojoByPid(pid);
	}
	
	//封装 处理图片路径的问题 和商品名称的截取
	private  void changeProductList(List<Product> list){
		//处理图片路径的问题 
		for (Product product : list) {
			String image = product.getImage();
			String[] split = image.split(",");//通过","将多张图片分隔开，保存到数组中
			product.setImage("/pic/"+split[0]);
			//当商品名称过长时，进行截取
			if (product.getPname().length()>8) {
				product.setPname(product.getPname().substring(0, 8)+"...");
			}
		}
	}

	public int deleteProduct(Integer pid) {
		Product product = productMapper.selectByPrimaryKey(pid);
		product.setState(1);
		return productMapper.updateByPrimaryKey(product);
	}

	public Product getProductByPid(Integer pid) {
		return productMapper.selectByPrimaryKey(pid);
	}
}
