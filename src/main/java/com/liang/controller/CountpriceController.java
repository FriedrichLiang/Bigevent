package com.liang.controller;

import com.liang.pojo.Countprice;
import com.liang.pojo.Result;
import com.liang.service.CountpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/countprice")
public class CountpriceController {
    @Autowired
    private CountpriceService countpriceService;

    @PostMapping("/add")
    public Result add(@RequestBody @Validated Countprice countprice) {
        countpriceService.add(countprice);
        return Result.success();
    }
    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        countpriceService.remove(id);
        return Result.success();
    }

    // 修改
    @PostMapping("/update")
    public Result update(@RequestBody Countprice countprice) {
        countpriceService.modify(countprice);
        return Result.success();
    }

    // 查询全部
    @GetMapping("/list")
    public Result<List<Countprice>> list() {
        return Result.success(countpriceService.getAll());
    }

    // 根据ID查询
    @GetMapping("/detail")
    public Result<Countprice> detail(@RequestParam Integer id) {
        return Result.success(countpriceService.getById(id));
    }
    @GetMapping("/listByOperatorId")
    public Result<Countprice> listByOperatorId(@RequestParam Integer operatorId) {
        return Result.success(countpriceService.selectByOperatorId(operatorId));
    }

}
