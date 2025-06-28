package com.liang.controller;

import com.liang.pojo.Countprice;
import com.liang.pojo.Orders;
import com.liang.pojo.Result;
import com.liang.service.CountpriceService;
import com.liang.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@RestController
@RequestMapping("/count")
public class CountController {
    //点击提交订单，获取订单信息，zcy添加，   计算价格，更新数据库
    @Autowired
    private OrderService orderService;
    @Autowired
    private CountpriceService countpriceService;
    // 文件: CountController.java
    @PostMapping("/countp")
    public Result<Float> countp(@RequestParam Integer orderId) {
        // 1. 根据 order_id 查询订单信息
        Orders order = orderService.getOrderById(orderId);
        if (order == null) {
            return Result.error("未找到该订单");
        }

        String countIdStr = order.getCountId(); // 获取计费方式ID（String类型）
        Integer countId;
        try {
            countId = Integer.valueOf(countIdStr); // 转换为Integer
        } catch (NumberFormatException e) {
            return Result.error("计费方式ID格式错误：" + countIdStr);
        }

        Integer duration = order.getDuration(); // 获取时间差（分钟）

        // 2. 根据 countId 查询计费方式
        Countprice countprice = countpriceService.getById(countId);
        if (countprice == null) {
            return Result.error("未找到对应的计费方式");
        }

        float totalPrice = 0.0f;

        // 3. 根据计费类型进行价格计算
        switch (countprice.getType()) {
            case "计时":
                totalPrice = duration * countprice.getPrice1();
                break;

            case "计费":
                float hours = duration / 60.0f;
                totalPrice = (float) (hours * 30 * countprice.getPrice2());
                break;

            case "阶梯":
                int threshold = countprice.getPrice3().intValue();
                if (duration <= threshold) {
                    totalPrice = duration * countprice.getPrice1();
                } else {
                    totalPrice = threshold * countprice.getPrice1() +
                            (duration - threshold) * countprice.getPrice2();
                }
                break;

            default:
                return Result.error("未知的计费类型：" + countprice.getType());
        }

        return Result.success(totalPrice);
    }
}
