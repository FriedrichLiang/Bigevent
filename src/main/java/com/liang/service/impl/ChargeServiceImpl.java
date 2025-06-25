package com.liang.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;





import com.liang.mapper.ArticleMapper;
import com.liang.mapper.ChargeMapper;
import com.liang.pojo.Article;
import com.liang.pojo.ArticleInfo;
import com.liang.pojo.Charge;
import com.liang.pojo.PageBean;
import com.liang.service.ArticleService;
import com.liang.service.ChargeService;
import com.liang.utils.ThreadLocalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class ChargeServiceImpl implements ChargeService {

    @Autowired
    private ChargeMapper chargeMapper;

    @Override
    public void add(Charge charge) {
        //补充属性值
        chargeMapper.add(charge);
    }

    @Override
    public PageBean<Charge> list(Integer pageNum, Integer pageSize, Integer operatorId, String status) {
        //1.创建PageBean对象
        PageBean<Charge> pb = new PageBean<>();
        //2.开启分页查询 PageHelper
        PageHelper.startPage(pageNum,pageSize);
        //3.调用mapper
        Map<String,Object> map = ThreadLocalUtil.get();
//        Integer userId = (Integer) map.get("id");
        List<Charge> as = chargeMapper.list(operatorId,status);
        //Page中提供了方法,可以获取PageHelper分页查询后 得到的总记录条数和当前页数据
        Page<Charge> p = (Page<Charge>) as;
        //把数据填充到PageBean对象中
        pb.setTotal(p.getTotal());
        pb.setItems(p.getResult());
        return pb;
    }

    @Override
    public PageBean<Charge> all(Integer pageNum, Integer pageSize, Integer operatorId, String status) {
        //1.创建PageBean对象
        PageBean<Charge> pb = new PageBean<>();
        //2.开启分页查询 PageHelper
        PageHelper.startPage(pageNum,pageSize);
        //3.调用mapper
        List<Charge> as = chargeMapper.all(operatorId,status);
        //Page中提供了方法,可以获取PageHelper分页查询后 得到的总记录条数和当前页数据
        Page<Charge> p = (Page<Charge>) as;
        //把数据填充到PageBean对象中
        pb.setTotal(p.getTotal());
        pb.setItems(p.getResult());
        return pb;
    }

    @Override
    public void changestaus(Integer id, String newstatus) {
        chargeMapper.changestatus(id,newstatus);
    }

//    @Override
//    public List<ArticleInfo> browse() {
//        return articleMapper.browse();
//    }
//
//    @Override
//    public void updateimg(Integer id,String url) {
//        articleMapper.updateimg(id,url);
//    }

    @Override
    public void update(Charge charge) {
        Map<String,Object> map=ThreadLocalUtil.get();
        Integer userid=(Integer) map.get("id");
        String userstaus=(String) map.get("status");
//        article.setUpdateTime(LocalDateTime.now());
//        article.setCreateUser(userid);
        chargeMapper.update(charge);
    }

    @Override
    public void delete(Integer id) {
        chargeMapper.delete(id);
    }

//    @Override
//    public List<Charge> justGetAll() {
//        Map<String,Object> map = ThreadLocalUtil.get();
//        Integer userId = (Integer) map.get("id");
//        return chargeMapper.justGetAll(userId);
//    }
}
