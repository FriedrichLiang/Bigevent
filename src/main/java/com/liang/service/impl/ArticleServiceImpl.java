package com.liang.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


import com.liang.mapper.ArticleMapper;
import com.liang.pojo.Article;
import com.liang.pojo.ArticleInfo;
import com.liang.pojo.PageBean;
import com.liang.service.ArticleService;
import com.liang.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public void add(Article article) {
        //补充属性值
        article.setCreateTime(LocalDateTime.now());
        article.setUpdateTime(LocalDateTime.now());

        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userId = (Integer) map.get("id");
        article.setCreateUser(userId);

        articleMapper.add(article);
    }

    @Override
    public PageBean<Article> list(Integer pageNum, Integer pageSize, Integer categoryId, String state) {
        //1.创建PageBean对象
        PageBean<Article> pb = new PageBean<>();
        //2.开启分页查询 PageHelper
        PageHelper.startPage(pageNum,pageSize);
        //3.调用mapper
        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userId = (Integer) map.get("id");
        List<Article> as = articleMapper.list(userId,categoryId,state);
        //Page中提供了方法,可以获取PageHelper分页查询后 得到的总记录条数和当前页数据
        Page<Article> p = (Page<Article>) as;
        //把数据填充到PageBean对象中
        pb.setTotal(p.getTotal());
        pb.setItems(p.getResult());
        return pb;
    }

    @Override
    public PageBean<Article> all(Integer pageNum, Integer pageSize, Integer categoryId, String state) {
        //1.创建PageBean对象
        PageBean<Article> pb = new PageBean<>();
        //2.开启分页查询 PageHelper
        PageHelper.startPage(pageNum,pageSize);
        //3.调用mapper
        List<Article> as = articleMapper.all(categoryId,state);
        //Page中提供了方法,可以获取PageHelper分页查询后 得到的总记录条数和当前页数据
        Page<Article> p = (Page<Article>) as;
        //把数据填充到PageBean对象中
        pb.setTotal(p.getTotal());
        pb.setItems(p.getResult());
        return pb;
    }

    @Override
    public List<ArticleInfo> browse() {
        return articleMapper.browse();
    }

    @Override
    public void updateimg(Integer id,String url) {
        articleMapper.updateimg(id,url);
    }

    @Override
    public void update(Article article) {
        Map<String,Object> map=ThreadLocalUtil.get();
        Integer userid=(Integer) map.get("id");
        String userstaus=(String) map.get("status");
        article.setUpdateTime(LocalDateTime.now());
        article.setCreateUser(userid);
        articleMapper.update(article);
    }

    @Override
    public void delete(Integer id) {
        articleMapper.delete(id);
    }

    @Override
    public List<Article> justGetAll() {
        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userId = (Integer) map.get("id");
        return articleMapper.justGetAll(userId);
    }
}
