package com.liang.service;
import com.liang.pojo.Countprice;

import java.util.List;

public interface CountpriceService {
    void add(Countprice countprice);         // 新增
    void remove(Integer id);                // 删除
    void modify(Countprice countprice);     // 修改
    List<Countprice> getAll();              // 查询全部
    Countprice getById(Integer id);
    Countprice selectByOperatorId(Integer operatorId);
    boolean existsByOperatorId(Integer operatorId);
    boolean existsByOperatorIdExcludeSelf(Integer id, Integer operatorId);
}
