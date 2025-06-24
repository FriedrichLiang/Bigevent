package com.liang.service.impl;

import com.liang.mapper.AnnouncementsMapper;
import com.liang.pojo.Announcements;
import com.liang.service.AnnouncementsService;
import com.liang.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AnnouncementsServiceImpl implements AnnouncementsService {

    @Autowired
    private AnnouncementsMapper announcementsMapper;

    @Override
    public void add(Announcements announcements) {
        Map<String,Object> map = ThreadLocalUtil.get();
        Integer userId = (Integer) map.get("id");
        announcements.setCreateuser(userId);
        announcementsMapper.add(announcements);
    }

    @Override
    public void delete(Integer id) {
        announcementsMapper.delete(id);
    }

    @Override
    public void update(Announcements announcements) {
        announcementsMapper.update(announcements);
    }

    @Override
    public List<Announcements> getall() {
        Map<String,Object> map = ThreadLocalUtil.get();
        String userstatus = (String) map.get("status");
        return announcementsMapper.getall(userstatus);
    }

    @Override
    public List<Announcements> justgetall(String id) {
        return announcementsMapper.justgetall(id);
    }
}
