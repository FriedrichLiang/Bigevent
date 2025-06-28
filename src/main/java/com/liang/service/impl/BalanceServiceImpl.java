// 文件: BalanceServiceImpl.java
package com.liang.service.impl;

import com.liang.mapper.BalanceMapper;
import com.liang.pojo.Balance;
import com.liang.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BalanceServiceImpl implements BalanceService {

    @Autowired
    private BalanceMapper balanceMapper;

    @Override
    public Float getBalanceByUserId(Integer userId) {
        Balance balance = balanceMapper.selectByUserId(userId);
        return (balance != null) ? balance.getBalance() : 0.0f;
    }

    @Override
    public void recharge(Integer userId, Float amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("充值金额必须大于0");
        }

        Balance balance = balanceMapper.selectByUserId(userId);
        float currentBalance = (balance != null) ? balance.getBalance() : 0.0f;
        float newBalance = currentBalance + amount;

//        if (balance == null) {
//            // 如果没有记录则创建新记录
//            balance = new Balance();
//            balance.setUserId(userId);
//            balance.setBalance(newBalance);
//            balanceMapper.insert(balance);
//        } else {
            balance.setBalance(newBalance);
            balanceMapper.update(balance);
//        }
    }
    @Override
    public void deductBalance(Integer userId, Float amount) {
        if (amount <= 0) {
            throw new IllegalArgumentException("扣除金额必须大于0");
        }

        Balance balance = balanceMapper.selectByUserId(userId);
        if (balance == null || balance.getBalance() < amount) {
            throw new RuntimeException("余额不足");
        }

        float newBalance = balance.getBalance() - amount;
        balance.setBalance(newBalance);
        balanceMapper.update(balance);
    }

}
