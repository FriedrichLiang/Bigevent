package com.liang.mapper;

import com.liang.pojo.FollowData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FollowMapper {

    @Select("select * from followstatus where userid=#{userid} ORDER BY time ASC;")
    List<FollowData> getdata(Integer userid);

//    @Select("SELECT u.username FROM `follow` f JOIN `user` u ON f.writer = u.id WHERE f.follower = #{userid};")
    @Select("SELECT u.username  FROM `user` u WHERE u.id IN (SELECT f.writer FROM `follow` f WHERE f.follower = #{userid});")
    List<String> myfollow(Integer userid);

    @Select("SELECT COUNT(*) FROM `follow` WHERE `writer` = #{userid} AND `time` = CURDATE();")
    Integer gettodaycount(Integer userid);
}
