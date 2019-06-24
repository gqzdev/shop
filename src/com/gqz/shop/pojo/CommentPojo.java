package com.gqz.shop.pojo;

/**
 * 
* @ClassName: CommentPojo
* @Description: 商品评论
* @author ganquanzhong
* @date 2018-5-17 上午11:00:10
 */
public class CommentPojo extends Comment{
	private String username;
	
	
	private Integer count;//评论数目

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
}
