package com.liang.mapper;

import com.liang.pojo.Category;
import com.liang.pojo.Result;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
public interface CategoryMapper {

    @Insert("insert into category(category_name,category_alias,create_user,create_time,update_time,isexit)"+
            "values(#{categoryName},#{categoryAlias},#{createUser},#{createTime},#{updateTime},'true')")
    void add(Category category);

    @Select("select * from category where create_user = #{id} and isexit = 'true'")
    List<Category> findall(Integer id);

    @Select("select * from category where id=#{id} and isexit='true'")
    Category findById(Integer id);

    @Update("update category set category_name=#{categoryName},category_alias=#{categoryAlias},update_time=#{updateTime} where id=#{id}")
    void update(Category category);

    @Update("update category set isexit='false' where id=#{id}")
    void delete(Integer id);

    @Select("select * from category where isexit = 'true'")
    List<Category> all();
}
