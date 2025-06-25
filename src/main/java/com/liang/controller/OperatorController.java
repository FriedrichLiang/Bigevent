package com.liang.controller;

import com.liang.pojo.Category;
import com.liang.pojo.Operator;
import com.liang.pojo.Result;
import com.liang.service.OperatorService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/operator")
public class OperatorController {

    @Autowired
    private OperatorService operatorService;

    @PostMapping("/add")
    public Result add(@RequestBody @Validated Operator operator){
        operatorService.add(operator);
        return Result.success();
    }

    @GetMapping("/show")
    public Result<List<Operator>> show(){
        return Result.success(operatorService.show());
    }

    @GetMapping("/detail")
    public Result<Operator> detail(@RequestParam Integer id){
        return Result.success(operatorService.detail(id));
    }

    @PutMapping("/update")
    public Result update(@RequestBody @Validated Operator operator){
        System.out.println(operator);
        operatorService.update(operator);
        return Result.success();
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam Integer id){
        operatorService.delete(id);
        return Result.success();
    }

    @GetMapping("/all")
    public Result<List<Operator>> all(){
        return Result.success(operatorService.all());
    }
}
