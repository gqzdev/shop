package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gqz.shop.mapper.UserMapper;
import com.gqz.shop.pojo.User;
import com.gqz.shop.pojo.UserExample;
import com.gqz.shop.pojo.UserExample.Criteria;
import com.gqz.shop.service.UserService;

/**
 * 
* @ClassName: UserServiceImpl
* @Description: User的DAO
* @author ganquanzhong
* @date 2018-4-26 上午08:18:34
 */

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	//获取用户列表
	public List<User> getUserList() {
		UserExample userExample=new UserExample();
		List<User> userList = userMapper.selectByExample(userExample);
		return userList;
	}
	
	public int save(User user) {
		user.setState(0);
		int restult = userMapper.insert(user);
		return restult;
	}
	
	public void delete(User user) {
		userMapper.deleteByPrimaryKey(user.getUid());
	}
	
	public int update(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	public List<User> findAll() {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameLike("a");
		List<User> list = userMapper.selectByExample(example);
		return list;
	}
	
	public User findByUid(Integer uid){
		return userMapper.selectByPrimaryKey(uid);
	}

	
	//查询 模糊匹配like 
	public List<User> query(User user) {

//		userMapper.selectByExample();
		return null;
	}

	//用户登录
	public User checkLogin(User user) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		
		List<User> userList = userMapper.selectByExample(example);
		if (userList!=null && userList.size()!=0) {
			return userList.get(0);
		}else {
			return null;
		}
	}
	
	
}
