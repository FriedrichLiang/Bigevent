package com.liang.service.impl;

import com.liang.mapper.ChargeMapper;
import com.liang.mapper.OrderMapper;
import com.liang.pojo.Countprice;
import com.liang.pojo.Orders;
import com.liang.pojo.PageBean;
import com.liang.service.BalanceService;
import com.liang.service.CountpriceService;
import com.liang.service.OrderService;
import com.liang.utils.ThreadLocalUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private CountpriceService countpriceService;
    @Autowired
    private BalanceService balanceService;


    @Override
    public void add(Orders orders) {
        orders.setCreateTime(LocalDateTime.now());
        orders.setFinalTime(null);
        Map<String, Object> map = ThreadLocalUtil.get();
        orders.setCreateUser((Integer) map.get("id"));
        orders.setTotalPrice(0);
        orderMapper.add(orders);
    }


    @Override
    public void updateOrderStatus(Integer orderId, Integer status) {
        orderMapper.updateOrderStatus(orderId, status);
    }

    @Override
    public void delete(Integer id) {
        orderMapper.delete(id);
    }

    public Orders getOrderById(Integer id) {
        return orderMapper.selectById(id);
    }
    @Override
    public PageBean<Orders> getOrdersByUser(Integer userId, Integer pageNum, Integer pageSize) {
        int start = (pageNum - 1) * pageSize;
        List<Orders> ordersList = orderMapper.selectByUserId(userId, start, pageSize);
        Long total = orderMapper.countByUserId(userId);
        return new PageBean<>(total, ordersList);
    }
    @Override
    public void updateOrderStatusByTime() {
        List<Orders> chargingOrders = orderMapper.findChargingOrders();

        for (Orders order : chargingOrders) {
            LocalDateTime start = order.getCreateTime();
            int durationMinutes = order.getDuration();
            LocalDateTime expectedEndTime = start.plusMinutes(durationMinutes);

            if (LocalDateTime.now().isAfter(expectedEndTime)) {
                int duration = (int) java.time.Duration.between(start, expectedEndTime).toMinutes();
                if (duration == 0) duration = 1;

                // ✅ 状态设置为“待支付”（1），而不是已支付（2）
                orderMapper.updateStatus(order.getOrderId(), 1);



                String countIdStr = order.getCountId(); // 获取计费方式ID（String类型）
                Integer countId = null; // 初始化为null以避免编译错误
                try {
                    if (countIdStr != null && !countIdStr.isEmpty()) {
                        countId = Integer.valueOf(countIdStr); // 转换为Integer
                    } else {
                        // 处理countIdStr为空的情况，例如抛出异常或设置默认值
                    }
                } catch (NumberFormatException e) {
                    // 处理转换失败的情况
                }

                Countprice countprice = null;
                if (countId != null) {
                    countprice = countpriceService.getById(countId);
                }
                if (countprice == null) {
                    // 处理找不到对应计价策略的情况
                }
                float totalPrice1 = 0.0f;
                switch (countprice.getType()) {
                    case "计时":
                        totalPrice1 = duration * countprice.getPrice1();
                        break;

                    case "计费":
                        float hours = duration / 60.0f;
                        totalPrice1 = (float) (hours * 30 * countprice.getPrice2());
                        break;

                    case "阶梯":
                        int threshold = countprice.getPrice3().intValue();
                        if (duration <= threshold) {
                            totalPrice1 = duration * countprice.getPrice1();
                        } else {
                            totalPrice1 = threshold * countprice.getPrice1() +
                                    (duration - threshold) * countprice.getPrice2();
                        }
                        break;
                    default:
                }
                Integer totalPrice= (int) totalPrice1;
                // 设置 finalTime 和 duration
                orderMapper.completeOrder1(order.getOrderId(), expectedEndTime, duration, totalPrice);




                // ✅ 更新 final_time 和 duration 字段
//                orderMapper.completeOrder(order.getOrderId(), expectedEndTime, duration);

                // ✅ 设置充电桩为空闲
                chargeMapper.changestatus(order.getChargeId(), "空闲");
            }
        }
    }



    @Override
    public int cancelOrder(Integer orderId) {
        Orders order = orderMapper.findById(orderId);
        if (order == null) {
            throw new RuntimeException("订单不存在");
        }

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime createTime = order.getCreateTime();
        long minutes = java.time.Duration.between(createTime, now).toMinutes();

        int duration = (int) (minutes == 0 ? 1 : minutes); // 不足1分钟按1分钟

        orderMapper.cancelOrder(orderId, now, duration);
        return duration;
    }
    @Override
    public List<Orders> getAllOrders() {
        return orderMapper.selectAllOrders();
    }

    // service/impl/OrderServiceImpl.java
    @Override
    public void updateStatus(Integer orderId, Integer status) {
        orderMapper.updateStatus(orderId, status);
    }
    @Autowired
    private ChargeMapper chargeMapper;

    @Override
    public void nextStatus(Integer orderId) {
        Orders order = orderMapper.findById(orderId);
        if (order == null) {
            throw new RuntimeException("订单不存在");
        }

        int status = order.getOrderStatus() == null ? 0 : order.getOrderStatus();

        if (status == 0) {
            // 未开始 → 充电中
            orderMapper.updateStatus(orderId, 3);
        } else if (status == 3) {
            // 充电中 → 待支付88888
            orderMapper.updateStatus(orderId, 1);
        } else if (status == 1) {

            Integer userId = order.getCreateUser();

            Float totalPrice = order.getTotalPrice().floatValue();
            // 待支付 → 已支付
            balanceService.deductBalance(userId, totalPrice);
            orderMapper.updateStatus(orderId, 2);

        }
    }

    @Override
    public void cancelToPay(Integer orderId) {
        Orders order = orderMapper.findById(orderId);
        if (order == null) {
            throw new RuntimeException("订单不存在");
        }

        LocalDateTime now = LocalDateTime.now();
        long minutes = java.time.Duration.between(order.getCreateTime(), now).toMinutes();
        int duration = (int) (minutes == 0 ? 1 : minutes);

        // 设置订单为“待支付”状态6666
        orderMapper.updateStatus(orderId, 1);

        String countIdStr = order.getCountId(); // 获取计费方式ID（String类型）
        Integer countId = null; // 初始化为null以避免编译错误
        try {
            if (countIdStr != null && !countIdStr.isEmpty()) {
                countId = Integer.valueOf(countIdStr); // 转换为Integer
            } else {
                // 处理countIdStr为空的情况，例如抛出异常或设置默认值
            }
        } catch (NumberFormatException e) {
            // 处理转换失败的情况
        }

        Countprice countprice = null;
        if (countId != null) {
            countprice = countpriceService.getById(countId);
        }
        if (countprice == null) {
            // 处理找不到对应计价策略的情况
        }
        float totalPrice1 = 0.0f;
        switch (countprice.getType()) {
            case "计时":
                totalPrice1 = duration * countprice.getPrice1();
                break;

            case "计费":
                float hours = duration / 60.0f;
                totalPrice1 = (float) (hours * 30 * countprice.getPrice2());
                break;

            case "阶梯":
                int threshold = countprice.getPrice3().intValue();
                if (duration <= threshold) {
                    totalPrice1 = duration * countprice.getPrice1();
                } else {
                    totalPrice1 = threshold * countprice.getPrice1() +
                            (duration - threshold) * countprice.getPrice2();
                }
                break;
            default:
        }
        Integer totalPrice= (int) totalPrice1;
        // 设置 finalTime 和 duration
        orderMapper.completeOrder1(orderId, now, duration, totalPrice);

        // 设置充电桩状态为空闲
        chargeMapper.changestatus(order.getChargeId(), "空闲");

    }


//查充电桩次数
@Override
public List<Map<String, Object>> countAllChargeUsage() {
    return orderMapper.countAllChargeUsage();
}
//查充电桩时长
@Override
public List<Map<String, Object>> getChargeDurationStats() {
    return orderMapper.getChargeDurationStats();
}


//    @Override
//    public void deleteTimeoutOrders() {
//        List<Orders> unstarted = orderMapper.findUnstartedOrders();
//        LocalDateTime now = LocalDateTime.now();
//        for (Orders order : unstarted) {
//            if (java.time.Duration.between(order.getCreateTime(), now).toMinutes() >= 1) {
//                orderMapper.deleteById(order.getOrderId());
//            }
//        }
//    }


    @Override
    public int deleteTimeoutOrders() {
        List<Orders> unstartedOrders = orderMapper.findUnstartedOrders();
        int count = 0;
        for (Orders order : unstartedOrders) {
            // 添加时间判断：未开始超过 1 分钟
            if (Duration.between(order.getCreateTime(), LocalDateTime.now()).getSeconds() >= 60) {
                orderMapper.deleteById(order.getOrderId());
                chargeMapper.changestatus(order.getChargeId(), "空闲");
                count++;
            }
        }
        return count;
    }









}


