package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.shop.mapper.AdminuserMapper;
import com.gqz.shop.pojo.Adminuser;
import com.gqz.shop.pojo.AdminuserExample;
import com.gqz.shop.pojo.AdminuserExample.Criteria;
import com.gqz.shop.service.AdminuserService;

@Service
public class AdminuserServiceImpl implements AdminuserService {

	@Autowired
	private AdminuserMapper adminuserMapper;

	// 登录后台
	/*
	 * public Adminuser login(String username,String password) { Adminuser
	 * adminuser=null; adminuser = adminuserMapper.selectByUsername(username,
	 * password); return adminuser; }
	 */
	public Adminuser login(String username, String password) {
		AdminuserExample adminuserExample = new AdminuserExample();
		Criteria criteria = adminuserExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<Adminuser> adminusers = adminuserMapper.selectByExample(adminuserExample);
		if (adminusers.size() == 0) {
			return null;
		}
		return adminusers.get(0);
	}

	// 管理员列表
	public List<Adminuser> getAdminUserList() {
		AdminuserExample example = new AdminuserExample();
		List<Adminuser> list = adminuserMapper.selectByExample(example);
		return list;
	}

	// 条件查询
	public List<Adminuser> selectAdminuserByTerm(Adminuser adminuser) {
		AdminuserExample example = new AdminuserExample();
		Criteria adminuserCriteria = example.createCriteria();
		if (adminuser.getUsername() != null
				&& !"".equals(adminuser.getUsername())) {
			adminuserCriteria.andUsernameLike("%" + adminuser.getUsername()
					+ "%");
		}
		if ("1".equals(adminuser.getType()) || "2".equals(adminuser.getType())) {
			adminuserCriteria.andTypeLike(adminuser.getType());
		}
		List<Adminuser> list = adminuserMapper.selectByExample(example);
		return list;
	}

	// 根据id查询adminuser
	public Adminuser getAdminuserById(Integer uid) {
		return adminuserMapper.selectByPrimaryKey(uid);
	}

	// 修改adminuser的信息
	public int adminModify(Adminuser adminuser) {
		int updateByPrimaryKey = adminuserMapper
				.updateByPrimaryKeySelective(adminuser);
		return updateByPrimaryKey;
	}

	// 添加 adminuser
	public int addAdmin(Adminuser adminuser) {
		adminuser.setState(0);
		int insertSelective = adminuserMapper.insertSelective(adminuser);
		return insertSelective;
	}

	public int deleteAdmin(Integer uid) {
		int deleteByPrimaryKey = adminuserMapper.deleteByPrimaryKey(uid);
		return deleteByPrimaryKey;
	}

	public PageInfo<Adminuser> getAdminListByPage(int page, int pageSize) {
		// 获取第1页，10条内容，默认查询总数count
		PageHelper.startPage(page, pageSize);
		AdminuserExample adminuserExample = new AdminuserExample();
		List<Adminuser> list = adminuserMapper
				.selectByExample(adminuserExample);

		// 分页时，实际返回的结果list类型是Page<E>，如果想取出分页信息，需要强制转换为Page<E>
		PageInfo<Adminuser> pageInfo = new PageInfo<Adminuser>(list);
		return pageInfo;
	}

}
