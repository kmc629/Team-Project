package com.gdj59.bookmall.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gdj59.bookmall.beans.PaymentVO;

public interface PaymentMapper {
	// 결제 테이블 조회
	@Select("select * from payment_table where pm_num = #{pm_num}")
	PaymentVO selectPayment(Integer pm_num) throws Exception;

	// 결제 성공시 결제 테이블에 insert
	@Insert("insert into payment_table" + " (pm_date, pm_id, pm_b_price, pm_b_name)"
			+ " values(now(), #{pm_id}, #{pm_b_price}, #{pm_b_name})")
	int insertPayment(PaymentVO paymentVO) throws Exception;

	// 결제 시 회원 테이블에 누적금액 상승 update
	@Update("update user_table set user_maxPrice = user_maxPrice + #{user_maxPrice} where user_id = #{user_id}")
	int maxPrice(@Param("user_maxPrice") int user_maxPrice, @Param("user_id") String user_id) throws Exception;

	// 결제 시 누적구매횟수를 증가시키는 메서드 update
	@Update("update book_table set b_purchase = b_purchase + #{b_purchase} where b_name = #{b_name}")
		int purchaseCnt(@Param("b_name")String b_name ,@Param("b_purchase")int b_purchase) throws Exception;
		
		// 결제 성공시 도서 테이블에서 재고 차감 update
	@Update("update book_table set b_stock = b_stock - #{b_stock} where b_name = #{b_name}")
	int minusStock(@Param("b_stock") int b_stock, @Param("b_name") String b_name) throws Exception;

}
