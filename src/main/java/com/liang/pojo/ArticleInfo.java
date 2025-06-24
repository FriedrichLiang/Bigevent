package com.liang.pojo;

import lombok.Data;

@Data
public class ArticleInfo {
    private Long articleId;       // 文章ID
    private String title;         // 文章标题
    private String content;       // 文章内容
    private String category;      // 文章分类名称
    private String username;      // 用户名
    private String nickname;      // 昵称
    private java.util.Date time;  // 发布时间
    private String userPic;  // 发布时间
}

