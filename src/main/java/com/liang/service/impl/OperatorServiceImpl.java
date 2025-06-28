package com.liang.service.impl;

import com.liang.mapper.OperatorMapper;
import com.liang.pojo.Operator;
import com.liang.service.OperatorService;
import com.liang.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OperatorServiceImpl implements OperatorService {

    @Autowired
    private OperatorMapper operatorMapper;

    @Override
    public void add(Operator operator) {
        Map<String,Object> map= ThreadLocalUtil.get();
        operator.setCreateUser((Integer) map.get("id"));
        operatorMapper.add(operator);
    }

    @Override
    public List<Operator> show() {
        Map<String,Object> map=ThreadLocalUtil.get();
        Integer id=(Integer) map.get("id");
        return operatorMapper.all();
    }

    @Override
    public Operator detail(Integer id) {
        return operatorMapper.findById(id);
    }

    @Override
    public void update(Operator operator) {
        operatorMapper.update(operator);
    }

    @Override
    public void delete(Integer id) {
        operatorMapper.delete(id);
    }

    @Override
    public List<Operator> all() {
        return operatorMapper.all();
    }
}
