package com.liang.service;

import com.liang.pojo.Articledata;
import com.liang.pojo.Result;
import lombok.Data;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface DataService {
    Articledata get(Integer articleid);

    List<Articledata> gettoday();

    List<Articledata> getalldatabyaid(Integer articleid);

    void browsedata(Integer articleid);

    void followdata(Integer articleid);
}
