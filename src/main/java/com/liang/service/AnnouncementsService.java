package com.liang.service;

import com.liang.pojo.Announcements;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnnouncementsService {
    void add(Announcements announcements);

    void delete(Integer id);

    void update(Announcements announcements);

    List<Announcements> getall();

    List<Announcements> justgetall(String id);
}
