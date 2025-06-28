package com.liang.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Charge {
    private Integer id;          // id 字段
    private Integer operatorId;   // articleid 字段
    private String model;
    private String location;        // time 字段
    private String status;
}
