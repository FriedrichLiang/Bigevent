package com.liang.controller;

import com.liang.mapper.OrderMapper;
import com.liang.pojo.*;
import com.liang.service.OrderService;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderMapper orderMapper;

    @PostMapping("/add")
    public Result add(@RequestBody @Validated Orders orders){
        orderService.add(orders);
        return Result.success();
    }


    @PostMapping("/update")
    public Result updateOrderStatus(@RequestParam Integer orderId, @RequestParam Integer status) {
        orderService.updateOrderStatus(orderId, status);
        return Result.success();
    }

    @PutMapping("/updateStatus")
    public Result updateStatus(@RequestParam Integer orderId, @RequestParam Integer status) {
        orderService.updateStatus(orderId, status);
        return Result.success();
    }

    @GetMapping("/delete")
    public Result delete(@RequestParam Integer id){
        orderService.delete(id);
        return Result.success();
    }

    @GetMapping("/detail")
    public Result<Orders> getOrderById(@RequestParam Integer id) {
        Orders order = orderService.getOrderById(id);
        return Result.success(order);
    }
    @GetMapping("/user")
    public Result<PageBean<Orders>> getOrdersByUser(
            @RequestParam Integer userId,
            @RequestParam Integer pageNum,
            @RequestParam Integer pageSize
    ) {
        PageBean<Orders> pb = orderService.getOrdersByUser(userId, pageNum, pageSize);
        return Result.success(pb);
    }
    @Scheduled(fixedRate = 60000) // 每60秒执行一次
    public void autoUpdateOrders() {
        orderService.updateOrderStatusByTime();
    }

    @PostMapping("/cancel")
    public Result cancelOrder(@RequestParam Integer orderId) {
        orderService.cancelOrder(orderId);
        return Result.success();
    }
    @GetMapping("/all")
    public Result<List<Orders>> getAllOrders() {
        List<Orders> all = orderService.getAllOrders();
        return Result.success(all);
    }

    @PutMapping("/next")
    public Result nextStatus(@RequestParam Integer orderId) {
        orderService.nextStatus(orderId);
        return Result.success();
    }

    @PostMapping("/cancelToPay")
    public Result cancelToPay(@RequestParam Integer orderId) {
        orderService.cancelToPay(orderId);
        return Result.success();
    }





    @GetMapping("/export")
    public void exportOrder(@RequestParam Integer orderId, HttpServletResponse response) throws IOException {
        OrderExportVO vo = orderMapper.getOrderExportInfo(orderId);

        XWPFDocument doc = new XWPFDocument();
        XWPFParagraph para = doc.createParagraph();
        XWPFRun run = para.createRun();
        run.setText("订单详情");
        run.setBold(true);

        // 写入每一行信息
        XWPFParagraph p = doc.createParagraph();
        p.createRun().setText("用户名: " + vo.getUserName());
        p = doc.createParagraph();
        p.createRun().setText("创建时间: " + vo.getCreateTime());
        p = doc.createParagraph();
        p.createRun().setText("结束时间: " + vo.getFinalTime());
        p = doc.createParagraph();
        p.createRun().setText("订单状态: " + getStatusText(vo.getOrderStatus()));
        p = doc.createParagraph();
        p.createRun().setText("充电桩编号: " + vo.getChargeId());
        p = doc.createParagraph();
        p.createRun().setText("充电时长: " + vo.getDuration() + "分钟");
        p = doc.createParagraph();
        p.createRun().setText("总价: " + vo.getTotalPrice() + "元");
        p = doc.createParagraph();
        p.createRun().setText("管理员: " + vo.getOperatorName() + "（ID：" + vo.getOperatorId() + "）");

        response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
        response.setHeader("Content-Disposition", "attachment; filename=order_" + orderId + ".docx");
        doc.write(response.getOutputStream());
        doc.close();
    }

    private String getStatusText(Integer status) {
        return switch (status) {
            case 1 -> "待支付";
            case 2 -> "充电中";
            case 3 -> "已完成";
            case 4 -> "充电异常";
            default -> "未知";
        };
    }




}
