package com.liang.mapper;

import com.liang.pojo.Countprice;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CountpriceMapper {

    @Insert("INSERT INTO countprice (operator_id, type, price1, price2, price3) " +
            "VALUES (#{operatorId}, #{type}, #{price1}, #{price2}, #{price3})")
    void insert(Countprice countprice);

    @Select("SELECT COUNT(1) FROM countprice WHERE operator_id = #{operatorId}")
    boolean existsByOperatorId(Integer operatorId);

    @Select("SELECT COUNT(1) FROM countprice WHERE operator_id = #{operatorId} AND id != #{id}")
    boolean existsByOperatorIdExcludeSelf(@Param("id") Integer id, @Param("operatorId") Integer operatorId);
    // 根据ID删除计费方式
    @Delete("DELETE FROM countprice WHERE id = #{id}")
    void deleteById(Integer id);

    // 更新计费方式
    @Update("UPDATE countprice SET operator_id = #{operatorId}, type = #{type}, " +
            "price1 = #{price1}, price2 = #{price2}, price3 = #{price3} WHERE id = #{id}")
    void update(Countprice countprice);

    // 查询所有计费方式
    @Select("SELECT * FROM countprice")
    List<Countprice> selectAll();

    // 根据ID查询计费方式
    @Select("SELECT * FROM countprice WHERE id = #{id}")
    Countprice selectById(Integer id);
    @Select("SELECT * FROM countprice WHERE operator_id = #{operatorId}")
    Countprice selectByOperatorId(Integer operatorId);
}
