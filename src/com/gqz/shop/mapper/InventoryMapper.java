package com.gqz.shop.mapper;

import com.gqz.shop.pojo.Inventory;
import com.gqz.shop.pojo.InventoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InventoryMapper {
    int countByExample(InventoryExample example);

    int deleteByExample(InventoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Inventory record);

    int insertSelective(Inventory record);

    List<Inventory> selectByExample(InventoryExample example);

    Inventory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Inventory record, @Param("example") InventoryExample example);

    int updateByExample(@Param("record") Inventory record, @Param("example") InventoryExample example);

    int updateByPrimaryKeySelective(Inventory record);

    int updateByPrimaryKey(Inventory record);
    
    //添加
    //分组查询商品pid的size
    public List<Inventory> selectInventoryBySize(Integer pid);
    
    //分组查询商品pid的color
    public List<Inventory> selectInventoryByColor(Integer pid);
}