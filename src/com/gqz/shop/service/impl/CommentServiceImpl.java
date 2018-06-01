package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gqz.shop.mapper.CommentMapper;
import com.gqz.shop.pojo.Comment;
import com.gqz.shop.pojo.CommentPojo;
import com.gqz.shop.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	public List<CommentPojo> getCommentPojosByPid(int pid) {
		return commentMapper.selectCommentPojoByPid(pid);
	}

	//添加商品评论
	public int add(Comment comment) {
		int result = commentMapper.insert(comment);
		return result;
	}

}
