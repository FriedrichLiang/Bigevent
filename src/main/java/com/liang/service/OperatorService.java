package com.liang.service;

import com.liang.pojo.Category;
import com.liang.pojo.Operator;
import com.liang.pojo.Result;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OperatorService {
    void add(Operator operator);

    List<Operator> show();

    Operator detail(Integer id);

    void update(Operator operator);

    void delete(Integer id);

    List<Operator> all();
}
