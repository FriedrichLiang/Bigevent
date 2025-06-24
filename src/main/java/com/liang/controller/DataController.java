package com.liang.controller;

import com.liang.pojo.Articledata;
import com.liang.pojo.Result;
import com.liang.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/articledata")
public class DataController {

    @Autowired
    private DataService dataService;

    @GetMapping("/getbyaid")
    public Result<Articledata> getbyaid(@RequestParam Integer articleid){
        return Result.success(dataService.get(articleid));
    }

    @GetMapping("/gettoday")
    public Result<List<Articledata>> gettoday(){
        return Result.success(dataService.gettoday());
    }

    @GetMapping("/getalldatabyaid")
    public Result<List<Articledata>> getalldatabyaid(@RequestParam Integer articleid){
        return Result.success(dataService.getalldatabyaid(articleid));
    }

    @GetMapping("/browsedata")
    public Result browsedata(@RequestParam Integer articleid){
        dataService.browsedata(articleid);
        return  Result.success();
    }

    @GetMapping("/followdata")
    public Result followdata(@RequestParam Integer articleid){
        dataService.followdata(articleid);
        return Result.success();
    }
}
