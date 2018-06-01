package com.gqz.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqz.shop.pojo.Orders;
import com.gqz.shop.pojo.OrdersExample;
import com.gqz.shop.pojo.OrdersPojo;

public interface OrdersMapper {
    int countByExample(OrdersExample example);

    int deleteByExample(OrdersExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrdersExample example);

    Orders selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
      
    
    //查询订单列表
    public List<OrdersPojo> selectOrdersPojoByUid(Integer uid);
    
    
}