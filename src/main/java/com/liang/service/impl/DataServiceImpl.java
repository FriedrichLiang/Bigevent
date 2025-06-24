package com.liang.service.impl;

import com.liang.mapper.DataMapper;
import com.liang.pojo.Articledata;
import com.liang.pojo.Result;
import com.liang.service.DataService;
import com.liang.utils.ThreadLocalUtil;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DataServiceImpl implements DataService {
    @Autowired
    private DataMapper dataMapper;

    @Override
    public Articledata get(Integer articleid) {
        return dataMapper.get(articleid);
    }

    @Override
    public List<Articledata> gettoday() {
        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userId = (Integer) map.get("id");
        return dataMapper.gettoday(userId);
    }

    @Override
    public List<Articledata> getalldatabyaid(Integer articleid) {
        return dataMapper.getalldatabyaid(articleid);
    }

    @Override
    public void browsedata( Integer articleid) {
        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userid = (Integer) map.get("id");
        dataMapper.browsedata(articleid,userid);
    }

    @Override
    public void followdata(Integer articleid) {
        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userid = (Integer) map.get("id");
        dataMapper.followdata(articleid,userid);
    }
}
