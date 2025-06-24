package com.liang.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Announcements {
    private Integer id;            // 公告ID
    private String title;      // 公告标题
    private String content;    // 公告内容
    private LocalDateTime time;    // 公告发布时间
    private String isexit;     // 是否发布（1为已发布，0为未发布）
    private Integer createuser;    // 创建公告的用户
    private String scope;
}

