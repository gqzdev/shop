package com.gqz.shop.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.gqz.shop.pojo.Inventory;
import com.gqz.shop.service.InventoryService;

@Controller
public class InventoryController {
	@Autowired
	private InventoryService inventoryService;
	
	
	@RequestMapping("/admin/addInventory")
	@ResponseBody
	public Map<String , String> addInventory(Inventory inventory){
		inventory.setState(0);
		inventory.setRemark("库存正常");
		Map<String, String> map=new HashMap<String, String>();
		int result = inventoryService.insert(inventory);
		if (result!=0) {
			map.put("result", "ok");
		}else {
			map.put("result", "error");
		}
		return map;
	}
	
	@RequestMapping("/admin/getInventoryPageByPid")
	@ResponseBody()
	public PageInfo<Inventory> getInventoryByPid(Integer pid,Integer page,Integer pageSize) {
		return inventoryService.getInventoryByPage(pid, page, pageSize);
	}
	@RequestMapping("/admin/getInventoryById")
	@ResponseBody()
	public Inventory getInventoryById(Integer id) {
		return inventoryService.getInventoryById(id);
	}
	@RequestMapping("/admin/updateInventoryById")
	@ResponseBody()
	public String updateInventoryById(Integer id,Integer amount) {
		int result = inventoryService.updateInventoryById(id, amount);
		if (result!=0) {
			return "ok";
		}else {
			return "error";
		}
	}
	
}
