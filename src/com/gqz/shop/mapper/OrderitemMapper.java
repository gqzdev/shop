package com.gqz.shop.mapper;

import com.gqz.shop.pojo.Orderitem;
import com.gqz.shop.pojo.OrderitemExample;
import com.gqz.shop.pojo.OrderitemPojo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderitemMapper {
    int countByExample(OrderitemExample example);

    int deleteByExample(OrderitemExample example);

    int deleteByPrimaryKey(Integer itemid);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    List<Orderitem> selectByExample(OrderitemExample example);

    Orderitem selectByPrimaryKey(Integer itemid);

    int updateByExampleSelective(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByExample(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKey(Orderitem record);
    //自定义 添加
    
    //查询订单项
    public List<OrderitemPojo> selectOrderitemPojoByOid(Integer oid);
    
    //评价制订的订单项
    public List<OrderitemPojo> selectOrderitemPojoByOidPid(Integer oid,Integer pid);
}