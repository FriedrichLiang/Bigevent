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
        // 检查是否已存在该运营商的充电策略
        boolean exists = countpriceService.existsByOperatorId(countprice.getOperatorId());
        if (exists) {
            return Result.error("该运营商已有充电策略，添加失败");
        }
        countpriceService.add(countprice);
        return Result.success();
    }
    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        countpriceService.remove(id);
        return Result.success();
    }

    // 修改
//    @PostMapping("/update")
//    public Result update(@RequestBody Countprice countprice) {
//        countpriceService.modify(countprice);
//        return Result.success();
//    }
    @PostMapping("/update")
    public Result update(@RequestBody Countprice countprice) {
        // 检查除当前记录外是否存在相同的operatorId
        boolean exists = countpriceService.existsByOperatorIdExcludeSelf(countprice.getId(), countprice.getOperatorId());
        if (exists) {
            return Result.error("该运营商ID已被其他记录使用");
        }

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
