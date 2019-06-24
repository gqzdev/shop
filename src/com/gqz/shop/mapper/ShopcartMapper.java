package com.gqz.shop.mapper;

import com.gqz.shop.pojo.Shopcart;
import com.gqz.shop.pojo.ShopcartExample;
import com.gqz.shop.pojo.ShopcartPojo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ShopcartMapper {
    int countByExample(ShopcartExample example);

    int deleteByExample(ShopcartExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(Shopcart record);

    int insertSelective(Shopcart record);

    List<Shopcart> selectByExample(ShopcartExample example);

    Shopcart selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") Shopcart record, @Param("example") ShopcartExample example);

    int updateByExample(@Param("record") Shopcart record, @Param("example") ShopcartExample example);

    int updateByPrimaryKeySelective(Shopcart record);

    int updateByPrimaryKey(Shopcart record);
    
    
    //selectShopcartPojo
    List<ShopcartPojo> selectShopcartPojoByUid(Integer uid);
}