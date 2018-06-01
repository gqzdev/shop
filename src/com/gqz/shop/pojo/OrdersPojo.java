package com.gqz.shop.pojo;

/**
 * 
 * @ClassName: OrdersPojo
 * @Description: 订单详细
 * @author ganquanzhong
 * @date 2018年5月24日 下午5:15:49
 */
public class OrdersPojo extends Orders {
	private Integer count; // 订单项中商品的数量

	private Double subtotal; // 订单项中的总价

	private Integer pid;

	private String pname; // 商品名

	private Double newPrice; // 商品价格

	private Double oldPrice;

	private String image; // 商品图片

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

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

	public Double getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(Double oldPrice) {
		this.oldPrice = oldPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
