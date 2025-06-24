package com.liang.mapper;

import com.liang.pojo.Articledata;
import com.liang.pojo.Result;
import lombok.Data;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

@Mapper
public interface DataMapper {

    @Select("SELECT * FROM articledata WHERE articleid = #{articleid} AND time = CURDATE()")
    Articledata get(Integer articleid);

    @Select("SELECT ad.* FROM articledata ad WHERE ad.articleid IN (  SELECT a.id FROM article a  WHERE a.create_user = #{userId} ) and ad.time =CURDATE();")
    List<Articledata> gettoday(Integer userId);


    @Select("SELECT * FROM (   SELECT *    FROM articledata    WHERE articleid = #{articleid}    ORDER BY time ) AS recent_articles ORDER BY time ASC;")
    List<Articledata> getalldatabyaid(Integer articleid);

    @Insert("INSERT INTO `history` (`articleid`, `userid`, `time`) VALUES (#{articleid}, #{userid}, now());")
    void browsedata(Integer articleid,Integer userid);

    @Insert("INSERT INTO `follow` (`follower`, `writer`, `time`) VALUES (#{userid}, (SELECT `create_user` FROM `article` WHERE `id` = #{articleid}), now());")
    void followdata(Integer articleid, Integer userid);
}
