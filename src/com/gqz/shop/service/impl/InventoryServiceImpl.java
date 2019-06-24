package com.gqz.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gqz.shop.mapper.InventoryMapper;
import com.gqz.shop.pojo.Inventory;
import com.gqz.shop.pojo.InventoryExample;
import com.gqz.shop.pojo.InventoryExample.Criteria;
import com.gqz.shop.service.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {
	@Autowired
	private InventoryMapper inventoryMapper;
	
	
	public int insert(Inventory inventory) {
		return inventoryMapper.insertSelective(inventory);
	}


	
	public List<Inventory> getInventoryList(Integer pid) {
		InventoryExample inventoryExample = new InventoryExample();
		inventoryExample.createCriteria().andPidEqualTo(pid);//查询pid的规格信息
		List<Inventory> inventoryList = inventoryMapper.selectByExample(inventoryExample);
		return inventoryList;
	}

	
	public Inventory selectByTerm(Integer pid, String size, String color) {
		InventoryExample inventoryExample = new InventoryExample();
		Criteria createCriteria = inventoryExample.createCriteria();
		createCriteria.andPidEqualTo(pid);
		createCriteria.andPsizeEqualTo(size);
		createCriteria.andPcolorEqualTo(color);
		List<Inventory> inventoryList = inventoryMapper.selectByExample(inventoryExample);
		if (inventoryList.size()!=0) {
			return inventoryList.get(0);
		}else {
			return null;
		}
		
	}

	public List<Inventory> selectSize(Integer pid) {
		return inventoryMapper.selectInventoryBySize(pid);
	}

	public List<Inventory> selectColor(Integer pid) {
		return inventoryMapper.selectInventoryByColor(pid);
	}



	//分页
	public PageInfo<Inventory> getInventoryByPage(Integer pid,int page,int pageSize) {
		PageHelper.startPage(page, pageSize);
		
		InventoryExample inventoryExample = new InventoryExample();
		inventoryExample.createCriteria().andPidEqualTo(pid);//查询pid的规格信息
		List<Inventory> list = inventoryMapper.selectByExample(inventoryExample);
		
		//保存分页对象
		PageInfo<Inventory> pageInfo = new PageInfo<Inventory>(list);
		return pageInfo;
	}

	public Inventory getInventoryById(Integer id) {
		return inventoryMapper.selectByPrimaryKey(id);
	}

	public int updateInventoryById(Integer id, Integer amount) {
		Inventory inventory = inventoryMapper.selectByPrimaryKey(id);
		inventory.setAmount(amount);
		int result = inventoryMapper.updateByPrimaryKey(inventory);
		return result;
	}

}
