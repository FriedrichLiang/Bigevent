package com.liang.mapper;


import com.liang.pojo.Article;
import com.liang.pojo.ArticleInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ArticleMapper {
    //新增
    @Insert("insert into article(title,content,cover_img,state,category_id,create_user,create_time,update_time,browse,isexit) " +
            "values(#{title},#{content},#{coverImg},#{state},#{categoryId},#{createUser},#{createTime},#{updateTime},0,'true')")
    void add(Article article);


    List<Article> list(Integer userId, Integer categoryId, String state);

    @Update("update article set title=#{title},content=#{content},cover_img=#{coverImg},state=#{state},category_id=#{categoryId},update_time=#{updateTime} where id=#{id}")
    void update(Article article);

    @Update("update article set isexit='false' where id=#{id}")
    void delete(Integer id);

    @Select("select * from article where create_user=#{userId} and isexit='true' and state = '已发布'")
    List<Article> justGetAll(Integer userId);

    List<Article> all(Integer categoryId, String state);

    @Select("SELECT a.id AS article_id, a.title AS title, a.content AS content, c.category_name AS category, u.username AS username, u.nickname AS nickname, u.user_pic AS user_pic, a.create_time AS time FROM article a JOIN category c ON a.category_id = c.id JOIN user u ON a.create_user = u.id WHERE a.isexit = 'true' AND a.state = '已发布' ORDER BY a.create_time DESC;")
    List<ArticleInfo> browse();

    @Update("update article set cover_img = #{url} where id=#{id}")
    void updateimg(Integer id,String url);
}
