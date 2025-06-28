// 文件: BalanceController.java
package com.liang.controller;

import com.liang.pojo.Orders;
import com.liang.service.BalanceService;
import com.liang.pojo.Result;
import com.liang.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/balance")
public class BalanceController {
    @Autowired
    private BalanceService balanceService;
    @Autowired
    private OrderService orderService;
    // 查询余额
    @GetMapping("/getBalance")
    public Result<Float> getBalance(@RequestParam Integer userId) {
        Float balance = balanceService.getBalanceByUserId(userId);
        return Result.success(balance);
    }
    // 充值接口
    @PostMapping("/recharge")
    public Result<String> recharge(@RequestParam Integer userId, @RequestParam Float amount) {
        balanceService.recharge(userId, amount);
        return Result.success("充值成功");
    }
    @PostMapping("/sub")
    public Result<String> sub(@RequestParam Integer orderId) {
        Orders order = orderService.getOrderById(orderId);
        if (order == null) {
            return Result.error("未找到该订单");
        }

        Integer userId = order.getCreateUser();
        Float totalPrice = order.getTotalPrice().floatValue();

         balanceService.deductBalance(userId, totalPrice);

        return Result.success("扣费成功，扣除：" + totalPrice);
    }

}
