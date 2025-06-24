package com.liang.service;



import com.liang.pojo.Article;
import com.liang.pojo.ArticleInfo;
import com.liang.pojo.PageBean;

import java.util.List;

public interface ArticleService {
    //新增文章
    void add(Article article);

    //条件分页列表查询
    PageBean<Article> list(Integer pageNum, Integer pageSize, Integer categoryId, String state);

    void update(Article article);

    void delete(Integer id);

    List<Article> justGetAll();

    PageBean<Article> all(Integer pageNum, Integer pageSize, Integer categoryId, String state);

    List<ArticleInfo> browse();

    void updateimg(Integer id,String url);
}
