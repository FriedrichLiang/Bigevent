package com.liang.mapper;

import com.liang.pojo.Operator;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface OperatorMapper {

    @Insert("INSERT INTO operator(operator_name, create_user, isexit) " +
            "VALUES (#{operatorName}, #{createUser}, 'true')")
    void add(Operator operator);

    @Select("SELECT * FROM operator WHERE isexit = 'true'")
    List<Operator> findall(Integer id);

    @Select("SELECT * FROM operator WHERE id = #{id} AND isexit = 'true'")
    Operator findById(Integer id);

    @Update("UPDATE operator SET operator_name = #{operatorName} WHERE id = #{id}")
    void update(Operator operator);

    @Update("UPDATE operator SET isexit = 'false' WHERE id = #{id}")
    void delete(Integer id);

    @Select("SELECT * FROM operator WHERE isexit = 'true'")
    List<Operator> all();
}

