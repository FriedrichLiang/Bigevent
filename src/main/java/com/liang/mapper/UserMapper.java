package com.liang.mapper;

import com.liang.pojo.User;
import com.liang.pojo.UserBrowse;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user where username=#{username}")
    public User findByUsername(String username);

    @Insert("insert into user(username,password,create_time,update_time,status)"+
            "values(#{username},#{password},now(),now(),#{status})")
    public void add(String username,String password,String status);
    @Select("SELECT LAST_INSERT_ID()")
    Integer getLastInsertId();

    @Update("update user set nickname=#{nickname},email=#{email},update_time=#{updateTime} where id=#{id}")
    void update(User user);

    @Update("update user set user_pic=#{avatarUrl},update_time=now() where id=#{id}")
    void updateAvatar(String avatarUrl,Integer id);

    @Update("update user set password=#{newPwd},update_time=now() where id=#{id}")
    void updatePwd(String newPwd, Integer id);


    List<User> all(String status);

    @Update("update user set isclose='true',update_time=now() where id=#{id}")
    void close(Integer id);

    @Update("update user set isclose=null,update_time=now() where id=#{id}")
    void unclose(Integer id);

    @Select("select * from user")
    List<User> justall();

    @Select("SELECT u.id AS userId, u.username, COALESCE(SUM(ad.browse), 0) AS totalBrowse FROM user u LEFT JOIN article a ON u.id = a.create_user LEFT JOIN articledata ad ON a.id = ad.articleid WHERE u.status = '创作者' GROUP BY u.id ORDER BY totalBrowse DESC LIMIT 5;")
    List<UserBrowse> getuserbrowse();

    @Select("SELECT u.id AS userId, u.username, COUNT(a.id) AS totalBrowse FROM user u LEFT JOIN article a ON u.id = a.create_user WHERE u.status = '创作者' GROUP BY u.id ORDER BY totalBrowse DESC LIMIT 5;")
    List<UserBrowse> getusercount();

    @Select("SELECT u.id AS userId, u.username, COALESCE(SUM(fs.count), 0) AS totalBrowse FROM user u JOIN followstatus fs ON u.id = fs.userid WHERE u.status = '创作者' GROUP BY u.id, u.username ORDER BY totalBrowse DESC LIMIT 5;")
    List<UserBrowse> getuserfollow();

    @Select("select * from user where status = '创作者'")
    List<User> getalladmin();

    @Insert("insert into user(username,password,create_time,update_time,status)"+
            "values(#{username},#{password},now(),now(),'创作者')")
    void createadmin(String username, String password);
}
