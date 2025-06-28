package com.liang.pojo;

import lombok.Data;
import lombok.NonNull;

@Data
public class Countprice {

    private Integer id;

    private Integer operatorId;

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    private String type;//string jishi,jifei,jieti
    private Float price1;
    private Float price2;
    private Float price3;          //时间和电量//订单上是   实时计算还是怎么说   用户自己选择时间和充电度数吗，还是看拔了充电桩算总度数和时间，是订单出来计算吗
}

