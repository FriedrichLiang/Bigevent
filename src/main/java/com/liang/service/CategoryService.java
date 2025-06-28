package com.liang.service;

import com.liang.pojo.Category;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CategoryService {
    void add(Category category);

    List<Category> show();

    Category detail(Integer id);


    void update(Category category);

    void delete(Integer id);

    List<Category> all();
}
