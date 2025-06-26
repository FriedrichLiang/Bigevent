package com.liang.controller;




import com.liang.pojo.*;
import com.liang.service.ArticleService;
import com.liang.service.ChargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/charge")
public class ChargeController {

    @Autowired
    private ChargeService chargeService;

    @PostMapping("/add")
    public Result add(@RequestBody @Validated Charge charge) {
        chargeService.add(charge);
        return Result.success();
    }

    @GetMapping()
    public Result<PageBean<Charge>> list(
            Integer pageNum,
            Integer pageSize,
            @RequestParam(required = false) Integer categoryId,
            @RequestParam(required = false) String state
    ) {
        PageBean<Charge> pb =  chargeService.list(pageNum,pageSize,categoryId,state);
        return Result.success(pb);
    }

    @GetMapping("/all")
    public Result<PageBean<Charge>> all(
            Integer pageNum,
            Integer pageSize,
            @RequestParam(required = false) Integer operatorId,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String location
    ) {
        PageBean<Charge> pb =  chargeService.all(pageNum,pageSize,operatorId,status,location);
        return Result.success(pb);
    }

    @PostMapping("/update")
    public Result update(@RequestBody @Validated Charge charge){
        System.out.println(charge);
        chargeService.update(charge);
        return Result.success();
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam Integer id){
        chargeService.delete(id);
        return Result.success();
    }

//    @GetMapping("/getall")
//    public Result<List<Charge>> justGetAll(){
//        return Result.success(chargeService.justGetAll());
//    }

//    @GetMapping("/browse")
//    public Result<List<ArticleInfo>> browse(){
//        return Result.success(articleService.browse());
//    }
//
//    @PatchMapping("/updateimg")
//    public Result<String> update(@RequestParam Integer id,@RequestParam String url){
//        articleService.updateimg(id,url);
//        return Result.success();
//    }

    @GetMapping("/changestatus")
    public Result<String> changestatus(@RequestParam Integer id,@RequestParam String newstatus){
        chargeService.changestaus(id,newstatus);
        return Result.success();
    }

    @GetMapping("/getall")
    public Result<List<Chargeitem>> getall(){

        return Result.success(chargeService.getall());
    }
}
