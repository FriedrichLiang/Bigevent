package com.liang.mapper;

import com.liang.pojo.Announcements;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AnnouncementsMapper {

    @Insert("INSERT INTO `announcements` (`title`, `content`, `time`, `isexit`, `createuser`,`scope`) VALUES (#{title}, #{content}, NOW(), 'true', #{createuser},#{scope});")
    void add(Announcements announcements);

    @Update("update announcements set isexit='false' where id=#{id}")
    void delete(Integer id);

    @Update("update announcements set title=#{title},content=#{content} where id=#{id}")
    void update(Announcements announcements);

    @Select("select * from announcements where scope=#{userstatus} and isexit='true'order by time ASC")
    List<Announcements> getall(String userstatus);

    @Select("select * from announcements where scope=#{id} and isexit='true';")
    List<Announcements> justgetall(String id);
}
