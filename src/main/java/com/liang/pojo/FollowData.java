package com.liang.pojo;


import lombok.Data;

import java.util.Date;

@Data
public class FollowData {
    private Integer id;
    private Integer userid;
    private Integer count;
    private Date time;
}
