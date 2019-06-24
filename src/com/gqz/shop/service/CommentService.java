package com.gqz.shop.service;

import java.util.List;

import com.gqz.shop.pojo.Comment;
import com.gqz.shop.pojo.CommentPojo;

public interface CommentService {
	List<CommentPojo> getCommentPojosByPid(int pid);
	
	
	//添加商品评论
	public int add(Comment comment);
	
	public CommentPojo getCount(Integer pid);
}
