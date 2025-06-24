package com.liang.controller;

import com.liang.pojo.FollowData;
import com.liang.pojo.Result;
import com.liang.service.FollowDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/followdata")
public class FollowDataController {

    @Autowired
    private FollowDataService followDataService;

    @GetMapping("/getdata")
    public Result<List<FollowData>> getdata(){
        return Result.success(followDataService.getdata());
    }

    @GetMapping("/myfollow")
    public Result<List<String>> myfollow(){
        return Result.success(followDataService.myfollow());
    }

    @GetMapping("/gettodaycount")
    public Result<Integer> gettodaycount(){
        return Result.success(followDataService.gettodaycount());
    }
}
