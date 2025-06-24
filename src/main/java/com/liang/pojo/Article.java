package com.liang.pojo;


import com.liang.anno.State;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.URL;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Article {
    private Integer id;//主键ID

    @NotEmpty
    private String title;//文章标题

    @NotEmpty
    private String content;//文章内容

//    @NotEmpty
//    @URL
    private String coverImg;//封面图像

    @NotEmpty
    @State
    private String state;//发布状态 已发布|草稿

    @NotNull
    private Integer categoryId;//文章分类id
    private Integer createUser;//创建人ID
    private LocalDateTime createTime;//创建时间
    private LocalDateTime updateTime;//更新时间
    private Integer browse;
    private String isexit;
}
