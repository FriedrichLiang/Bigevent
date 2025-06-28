package com.liang.service.impl;

import com.liang.mapper.CountpriceMapper;
import com.liang.pojo.Countprice;
import com.liang.service.CountpriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountpriceServiceImpl implements CountpriceService {
    @Autowired
    private CountpriceMapper countpriceMapper;

    @Override
    public void add(Countprice countprice) {
        countpriceMapper.insert(countprice);
    }

    @Override
    public void remove(Integer id) {
        countpriceMapper.deleteById(id);
    }

    @Override
    public void modify(Countprice countprice) {
        countpriceMapper.update(countprice);
    }

    @Override
    public List<Countprice> getAll() {
        return countpriceMapper.selectAll();
    }

    @Override
    public Countprice getById(Integer id) {
        return countpriceMapper.selectById(id);
    }

    @Override
    public Countprice selectByOperatorId(Integer operatorId) {
        return countpriceMapper.selectByOperatorId(operatorId);
    }
}
