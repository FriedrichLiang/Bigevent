package com.liang.mapper;

import com.liang.pojo.Category;
import com.liang.pojo.OrderExportVO;
import com.liang.pojo.Orders;
import org.apache.ibatis.annotations.*;

import java.time.LocalDateTime;
import java.util.List;

@Mapper
public interface OrderMapper {

    @Insert("INSERT INTO orders(create_user, create_time, final_time, order_status, charge_id, duration, count_id, total_price) " +
            "VALUES(#{createUser}, #{createTime}, #{finalTime}, 0, #{chargeId}, #{duration}, #{countId}, #{totalPrice})")
    void add(Orders orders);

    @Update("UPDATE orders SET order_status = #{status} WHERE order_id = #{orderId}")
    void updateOrderStatus(@Param("orderId") Integer orderId, @Param("status") Integer status);

    @Update("UPDATE orders SET order_status = #{status} WHERE order_id = #{orderId}")
    void updateStatus(@Param("orderId") Integer orderId, @Param("status") Integer status);

    @Delete("DELETE FROM orders WHERE order_id = #{id}")
    void delete(Integer id);

    @Select("SELECT * FROM orders WHERE order_id = #{id}")
    Orders selectById(Integer id);

    @Select("select * from category where isexit = 'true'")
    List<Category> all();
    @Select("SELECT * FROM orders WHERE create_user = #{userId} LIMIT #{start}, #{pageSize}")
    List<Orders> selectByUserId(@Param("userId") Integer userId,
                                @Param("start") Integer start,
                                @Param("pageSize") Integer pageSize);

    @Select("SELECT COUNT(*) FROM orders WHERE create_user = #{userId}")
    Long countByUserId(@Param("userId") Integer userId);

    @Select("SELECT * FROM orders WHERE order_status = 3")
    List<Orders> findChargingOrders();


//    @Update("UPDATE orders SET order_status = 3, final_time = #{finalTime} WHERE order_id = #{orderId}")
//    void completeOrder(@Param("orderId") Integer orderId, @Param("finalTime") LocalDateTime finalTime);
//SET order_status = 2,
    @Update("UPDATE orders  SET final_time = #{finalTime}, duration = #{duration} WHERE order_id = #{orderId}")
    void completeOrder(@Param("orderId") Integer orderId,
                       @Param("finalTime") LocalDateTime finalTime,
                       @Param("duration") Integer duration
                       );

    @Update("UPDATE orders  SET final_time = #{finalTime}, duration = #{duration},total_price= #{totalPrice} WHERE order_id = #{orderId}")
    void completeOrder1(@Param("orderId") Integer orderId,
                       @Param("finalTime") LocalDateTime finalTime,
                       @Param("duration") Integer duration,
                       @Param("totalPrice") Integer totalPrice);

    @Select("SELECT * FROM orders WHERE order_id = #{orderId}")
    Orders findById(@Param("orderId") Integer orderId);

    @Update("UPDATE orders SET order_status = 4, final_time = #{finalTime}, duration = #{duration} WHERE order_id = #{orderId}")
    void cancelOrder(@Param("orderId") Integer orderId,
                     @Param("finalTime") LocalDateTime finalTime,
                     @Param("duration") Integer duration);
    @Select("SELECT * FROM orders")
    List<Orders> selectAllOrders();

    @Update("UPDATE orders SET final_time = #{finalTime}, duration = #{duration}, order_status = 2 WHERE order_id = #{orderId}")
    void finishOrder(@Param("orderId") Integer orderId,
                     @Param("finalTime") LocalDateTime finalTime,
                     @Param("duration") Integer duration);



    @Select("""
    SELECT u.username AS userName, o.create_time, o.final_time,
           o.order_status, o.charge_id, o.duration, o.total_price,
           op.operator_name AS operatorName, op.id AS operatorId
    FROM orders o
    JOIN user u ON o.create_user = u.id
    JOIN charge c ON o.charge_id = c.id
    JOIN operator op ON c.operator_id = op.id
    WHERE o.order_id = #{orderId}
""")
    OrderExportVO getOrderExportInfo(@Param("orderId") Integer orderId);








}
