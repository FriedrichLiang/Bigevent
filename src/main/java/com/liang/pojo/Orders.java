package com.liang.pojo;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

//接地...
@Component
@Data
public class Orders {

    private Integer orderId;//主键ID

    private Integer createUser;
    private LocalDateTime createTime;
    private LocalDateTime finalTime;
    private String countId;
    private  Integer totalPrice;
    private Integer orderStatus;
    private Integer chargeId;
    private Integer duration;
}
