package com.gqz.shop.pojo;

import java.util.Date;

/**
 * 
* @ClassName: OrderitemPojo
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2018-5-24 上午10:05:42
 */
public class OrderitemPojo extends Orderitem{
	
	//商品信息
	 private String pname;
	 private Double newPrice;
	 private String image;
	 
	 //订单信息
	 private Double total;
	 private Date ordertime;
	 private String state;
	 private String number;
	 
	 //商品规格
	 private String psize;//商品尺寸
	    
	 private String pcolor;//商品颜色
	 
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Double getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(Double newPrice) {
		this.newPrice = newPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	 public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	
	public String getPsize() {
		return psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
}
