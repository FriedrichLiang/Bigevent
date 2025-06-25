package com.liang.mapper;


import com.liang.pojo.Article;
import com.liang.pojo.ArticleInfo;
import com.liang.pojo.Charge;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface  ChargeMapper {
    //新增
    @Insert("insert into charge(operator_id,model,location,status) " +
            "values(#{operatorId},#{model},#{location},'空闲')")
    void add(Charge charge);


    List<Charge> list(Integer operatorId, String status);

    @Update("update charge set model=#{model},location=#{location} where id=#{id}")
    void update(Charge charge);

    @Update("delete from charge where id=#{id}")
    void delete(Integer id);

//    @Select("select * from article where create_user=#{userId} and isexit='true' and state = '已发布'")
//    List<Charge> justGetAll(Integer userId);
//
    List<Charge> all(Integer operatorId, String status);

    @Update("update charge set status=#{newstatus}where id=#{id}")
    void changestatus(Integer id, String newstatus);

//    @Select("SELECT a.id AS article_id, a.title AS title, a.content AS content, c.category_name AS category, u.username AS username, u.nickname AS nickname, u.user_pic AS user_pic, a.create_time AS time FROM article a JOIN category c ON a.category_id = c.id JOIN user u ON a.create_user = u.id WHERE a.isexit = 'true' AND a.state = '已发布' ORDER BY a.create_time DESC;")
//    List<ArticleInfo> browse();

//    @Update("update article set cover_img = #{url} where id=#{id}")
//    void updateimg(Integer id,String url);
}
