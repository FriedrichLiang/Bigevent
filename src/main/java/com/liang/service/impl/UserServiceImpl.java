package com.liang.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liang.mapper.UserMapper;
import com.liang.pojo.*;
import com.liang.service.UserService;
import com.liang.utils.Md5Util;
import com.liang.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByUsername(String username) {
        User user=userMapper.findByUsername(username);
        return user;
    }

    @Override
    public void register(String username, String password,String status) {
        System.out.println(username+" "+password);
        String md5string = Md5Util.getMD5String(password);
        userMapper.add(username,md5string,status);
    }

    @Override
    public void update(User user) {
        user.setUpdateTime(LocalDateTime.now());
        userMapper.update(user);
    }

    @Override
    public void updateAvatar(String avatorUrl) {
        Map <String,Object> map= ThreadLocalUtil.get();
        Integer id=(Integer) map.get("id");
        userMapper.updateAvatar(avatorUrl,id);
    }

    @Override
    public void updatePwd(String newPwd) {
        Map <String,Object> map= ThreadLocalUtil.get();
        Integer id=(Integer) map.get("id");
        userMapper.updatePwd(Md5Util.getMD5String(newPwd),id);
    }

    @Override
    public PageBean<User> all(Integer pageNum, Integer pageSize, String status) {
        PageBean<User> pb = new PageBean<>();

        //2.开启分页查询 PageHelper
        PageHelper.startPage(pageNum,pageSize);

        //3.调用mapper
        List<User> as = userMapper.all(status);
        //Page中提供了方法,可以获取PageHelper分页查询后 得到的总记录条数和当前页数据
        Page<User> p = (Page<User>) as;

        //把数据填充到PageBean对象中
        pb.setTotal(p.getTotal());
        pb.setItems(p.getResult());
        return pb;
    }

    @Override
    public void close(Integer id) {
        userMapper.close(id);
    }

    @Override
    public void unclose(Integer id) {
        userMapper.unclose(id);
    }

    @Override
    public List<User> justall() {
        return userMapper.justall();
    }

    @Override
    public List<UserBrowse> getuserbrowse() {
        return userMapper.getuserbrowse();
    }

    @Override
    public List<UserBrowse> getusercount() {
        return userMapper.getusercount();
    }

    @Override
    public List<UserBrowse> getuserfollow() {
        return userMapper.getuserfollow();
    }

    @Override
    public List<User> getalladmin() {
        return userMapper.getalladmin();
    }

    @Override
    public void createadmin(String username, String password) {
        userMapper.createadmin(username,password);
    }
}
