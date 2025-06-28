package com.liang.service;



import com.liang.pojo.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ChargeService {
    //新增文章
    void add(Charge charge);

    //条件分页列表查询
    PageBean<Charge> list(Integer pageNum, Integer pageSize, Integer operatorId, String status);

    void update(Charge charge);

    void delete(Integer id);

//    List<Charge> justGetAll();

    PageBean<Charge> all(Integer pageNum, Integer pageSize, Integer operatorId, String status,String location);

//    List<ArticleInfo> browse();
//
//    void updateimg(Integer id,String url);

    void changestaus(Integer id, String newstatus);

    List<Chargeitem> getall();

    List<Charge> justgetall();
}
