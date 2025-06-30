// 文件: BalanceMapper.java
package com.liang.mapper;

import com.liang.pojo.Balance;
import org.apache.ibatis.annotations.*;

@Mapper
public interface BalanceMapper {

    // 根据用户ID查询余额
    @Select("SELECT * FROM balance WHERE user_id = #{userId}")
    Balance selectByUserId(Integer userId);

    // 更新余额
    @Update("UPDATE balance SET balance = #{balance} WHERE user_id = #{userId}")
    void update(Balance balance);
//
//    // 可选：插入新用户余额记录
@Insert("INSERT INTO balance (user_id, balance) VALUES (#{userId}, 0)")
void insert(Integer userId);
}
