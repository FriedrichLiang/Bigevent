package com.liang.controller;

import com.liang.pojo.Category;
import com.liang.pojo.Result;
import com.liang.service.CategoryService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/add")
    public Result add(@RequestBody @Validated Category category){
        categoryService.add(category);
        return Result.success();
    }
    
    @GetMapping("/show")
    public Result<List<Category>> show(){
        return Result.success(categoryService.show());
    }

    @GetMapping("/detail")
    public Result<Category> detail(@RequestParam Integer id){
        return Result.success(categoryService.detail(id));
    }

    @PutMapping("/update")
    public Result update(@RequestBody @Validated Category category){
        System.out.println(category);
        categoryService.update(category);
        return Result.success();
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam Integer id){
        categoryService.delete(id);
        return Result.success();
    }

    @GetMapping("/all")
    public Result<List<Category>> all(){
        return Result.success(categoryService.all());
    }
}
