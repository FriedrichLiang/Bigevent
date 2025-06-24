package com.liang.service.impl;

import com.liang.mapper.FollowMapper;
import com.liang.pojo.FollowData;
import com.liang.service.FollowDataService;
import com.liang.utils.ThreadLocalUtil;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FollowDataServiceImpl implements FollowDataService {

    @Autowired
    private FollowMapper followMapper;
    @Override
    public List<FollowData> getdata() {
        Map<String,Object> map= ThreadLocalUtil.get();
        Integer userid=(Integer) map.get("id");
        return followMapper.getdata(userid);
    }

    @Override
    public List<String> myfollow() {
        Map<String,Object> map= ThreadLocalUtil.get();
        Integer userid=(Integer) map.get("id");
        return followMapper.myfollow(userid);
    }

    @Override
    public Integer gettodaycount() {
        Map<String,Object> map= ThreadLocalUtil.get();
        Integer userid=(Integer) map.get("id");
        return followMapper.gettodaycount(userid);
    }
}
