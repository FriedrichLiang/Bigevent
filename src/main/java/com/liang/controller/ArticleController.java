package com.liang.controller;




import com.liang.pojo.Article;
import com.liang.pojo.ArticleInfo;
import com.liang.pojo.PageBean;
import com.liang.pojo.Result;
import com.liang.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @PostMapping
    public Result add(@RequestBody @Validated Article article) {
        articleService.add(article);
        return Result.success();
    }

    @GetMapping
    public Result<PageBean<Article>> list(
            Integer pageNum,
            Integer pageSize,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String state
    ) {
       PageBean<Article> pb =  articleService.list(pageNum,pageSize,categoryId,state);
       return Result.success(pb);
    }

    @GetMapping("/all")
    public Result<PageBean<Article>> all(
            Integer pageNum,
            Integer pageSize,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String state
    ) {
        PageBean<Article> pb =  articleService.all(pageNum,pageSize,categoryId,state);
        return Result.success(pb);
    }

    @PostMapping("/update")
    public Result update(@RequestBody @Validated Article article){
        System.out.println(article);
        articleService.update(article);
        return Result.success();
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam Integer id){
        articleService.delete(id);
        return Result.success();
    }

    @GetMapping("/getall")
    public Result<List<Article>> justGetAll(){
        return Result.success(articleService.justGetAll());
    }

    @GetMapping("/browse")
    public Result<List<ArticleInfo>> browse(){
        return Result.success(articleService.browse());
    }

    @PatchMapping("/updateimg")
    public Result<String> update(@RequestParam Integer id,@RequestParam String url){
        articleService.updateimg(id,url);
        return Result.success();
    }
}
