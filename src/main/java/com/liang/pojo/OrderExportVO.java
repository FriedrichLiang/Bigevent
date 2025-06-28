package com.liang.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OrderExportVO {
    private String userName;
    private LocalDateTime createTime;
    private LocalDateTime finalTime;
    private Integer orderStatus;
    private Integer chargeId;
    private Integer duration;
    private Integer totalPrice;
    private String operatorName;
    private Integer operatorId;
}
