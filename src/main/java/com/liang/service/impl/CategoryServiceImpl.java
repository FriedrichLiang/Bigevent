package com.liang.service.impl;

import com.liang.mapper.CategoryMapper;
import com.liang.pojo.Category;
import com.liang.service.CategoryService;
import com.liang.utils.ThreadLocalUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public void add(Category category) {
        category.setCreateTime(LocalDateTime.now());
        category.setUpdateTime(LocalDateTime.now());
        Map<String,Object> map= ThreadLocalUtil.get();
        category.setCreateUser((Integer) map.get("id"));
        categoryMapper.add(category);
    }

    @Override
    public List<Category> show() {
        Map<String,Object> map=ThreadLocalUtil.get();
        Integer id=(Integer) map.get("id");
        return categoryMapper.findall(id);
    }

    @Override
    public Category detail(Integer id) {
        return categoryMapper.findById(id);
    }

    @Override
    public void update(Category category) {
        category.setUpdateTime(LocalDateTime.now());
        categoryMapper.update(category);
    }

    @Override
    public void delete(Integer id) {
        categoryMapper.delete(id);
    }

    @Override
    public List<Category> all() {
        return categoryMapper.all();
    }


}
