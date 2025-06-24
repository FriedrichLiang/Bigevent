package com.liang.controller;

import com.liang.mapper.AnnouncementsMapper;
import com.liang.pojo.Announcements;
import com.liang.pojo.Result;
import com.liang.service.AnnouncementsService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/announcements")
public class AnnouncementsController {

    @Autowired
    private AnnouncementsService announcementsService;

    @PostMapping("/add")
    public Result add(@RequestBody Announcements announcements){
        announcementsService.add(announcements);
        System.out.println(announcements);
        return Result.success();
    }

    @DeleteMapping("/delete")
    public Result delete(@RequestParam Integer id){
        announcementsService.delete(id);
        return Result.success();
    }

    @PatchMapping("/update")
    public Result update(@RequestBody Announcements announcements){
        announcementsService.update(announcements);
        return Result.success();
    }

    @GetMapping("/getall")
    public Result<List<Announcements>> getall(){
        return Result.success(announcementsService.getall());
    }

    @GetMapping("/justgetall")
    public Result<List<Announcements>> justgetall(@RequestParam String id){
        return Result.success(announcementsService.justgetall(id));
    }
}
