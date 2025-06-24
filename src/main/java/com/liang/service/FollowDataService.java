package com.liang.service;

import com.liang.pojo.FollowData;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FollowDataService {
    List<FollowData> getdata();

    List<String> myfollow();

    Integer gettodaycount();
}
