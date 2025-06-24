package com.liang.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Articledata {
    private Integer id;          // id 字段
    private Integer articleId;   // articleid 字段
    private Date time;        // time 字段
    private Integer browse;
}
