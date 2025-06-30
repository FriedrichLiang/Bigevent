package com.liang.service;

import com.liang.pojo.Orders;
import com.liang.pojo.PageBean;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface OrderService {
    void add(Orders orders);

    void updateOrderStatus(Integer orderId, Integer status);

    void delete(Integer id);
    Orders getOrderById(Integer id);
    PageBean<Orders> getOrdersByUser(Integer userId, Integer pageNum, Integer pageSize);
    void updateOrderStatusByTime();
    int cancelOrder(Integer orderId);
    List<Orders> getAllOrders();
    // service/OrderService.java
    void updateStatus(Integer orderId, Integer status);
    void nextStatus(Integer orderId);
    void cancelToPay(Integer orderId);
    //查充电桩次数
    List<Map<String, Object>> countAllChargeUsage();
    //查充电时长
    List<Map<String, Object>> getChargeDurationStats();

    int deleteTimeoutOrders(); // 返回删除数量










}
