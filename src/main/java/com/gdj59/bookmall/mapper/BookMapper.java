package com.gdj59.bookmall.mapper;

import java.util.List;
import java.util.Vector;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj59.bookmall.beans.BookVO;
import com.gdj59.bookmall.beans.Criteria;

public interface BookMapper {
	
	
// 책 리스트
@Select("select * from book_table")
public List<BookVO> bookList(Criteria cri);
	
// 책 리스트 (카테고리 선택)
@Select("select * from book_table where b_category = #{b_category} ORDER BY b_num DESC LIMIT #{skip}, #{amount};")
public List<BookVO> bookListCategory(@Param("b_category") String b_category,@Param("skip") int skip , @Param("amount")int amount);

//책 검색
@Select("select * from book_table where b_name Like CONCAT('%',#{keyword},'%') ORDER BY b_num DESC LIMIT #{skip}, #{amount};")
public List<BookVO> searchName(@Param("keyword")String keyword,@Param("skip") int skip , @Param("amount")int amount);

// 선택(책) 읽기
@Select("select * from book_table where b_num = #{b_num}")
public BookVO bookListOne(int b_num);

//전체 데이터 개수 처리
@Select("select count(*) from book_table where b_num > 0")
public int getTotalCount(Criteria cri);
	
// 책 등록 
@Insert("insert into book_table (b_name, b_price, "
		+ "b_stock, b_category, b_purchase) "
		+ "values (#{b_name}, #{b_price},"
		+ "#{b_stock}, #{b_category},"
		+ "#{b_purchase})")
public void bookIns(BookVO bookVo);

// 책 수정
@Update("update book_table set "
		+ "b_name = #{b_name}, "
		+ "b_price = #{b_price}, "
		+ "b_stock = #{b_stock}, "
		+ "b_category = #{b_category}, "
		+ "b_purchase = #{b_purchase} "
		+ "where b_num = #{b_num}"
		)
public void bookUpdate(BookVO bookVo);

// 책 삭제
@Delete("delete from book_table where b_num = #{b_num}")
public void bookDel(int b_num);
	
// 책 이름 중복검사
@Select("select count(*) from book_table where b_name = #{b_name}")
public int bookNameCheck(BookVO bookVo);


// 페이징
@Select("SELECT * FROM book_table ORDER BY b_num DESC LIMIT #{skip}, #{amount};")
public List<BookVO> bookListWithPaging(Criteria cri);

//베스트셀러
@Select("select * from book_table ORDER BY b_purchase desc LIMIT 0, 3;")
public List<BookVO>bestSeller();

                              








	
}
