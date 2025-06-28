package com.liang.service;

import com.liang.pojo.PageBean;
import com.liang.pojo.User;
import com.liang.pojo.UserBrowse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    User findByUsername(String username);
    void register(String username,String password,String status);

    void update(User user);

    void updateAvatar(String avatorUrl);

    void updatePwd(String newPwd);

    PageBean<User> all(Integer pageNum, Integer pageSize, String status);

    void close(Integer id);

    void unclose(Integer id);

    List<User> justall();

    List<UserBrowse> getuserbrowse();

    List<UserBrowse> getusercount();

    List<UserBrowse> getuserfollow();

    List<User> getalladmin();

    void createadmin(String username, String password);
}
