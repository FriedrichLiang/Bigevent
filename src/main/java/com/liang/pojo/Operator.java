package com.liang.pojo;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@Data
public class Operator {

    private Integer id;//主键ID

    @NotEmpty
    private String operatorName;//分类名称
    private Integer createUser;//创建人ID
    private String isexit;
}
