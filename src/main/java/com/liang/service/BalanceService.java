// 文件: BalanceService.java
package com.liang.service;

import org.springframework.stereotype.Service;

public interface BalanceService {
    // 查询余额
    Float getBalanceByUserId(Integer userId);

    // 充值
    void recharge(Integer userId, Float amount);

    void deductBalance(Integer userId, Float amount);

}
