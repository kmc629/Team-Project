package com.gdj59.bookmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gdj59.bookmall.beans.BookVO;
import com.gdj59.bookmall.beans.Criteria;
import com.gdj59.bookmall.beans.ReplyVO;

public interface ReplyMapper {

	@Select("SELECT * FROM reply_table ORDER BY bno DESC LIMIT 9")
	public List<ReplyVO> ReplyList(Criteria cri);
	
	//등록
	@Insert("INSERT INTO reply_table (rno, bno, reply, replyer) VALUES (NULL, #{bno}, #{reply}, #{replyer})")
	public int insert(ReplyVO vo);
	
	//조회
	@Select("select*from reply_table where rno = #{rno}")
	public ReplyVO read(Long bno);
	
	//삭제
	@Delete("delete from reply_table where rno = #{rno}")
	public int delete (Long rno);
	
	//수정
	@Update("update reply_table set reply = #{reply}, updatedate = NOW() where rno = #{rno}")
	public int update(ReplyVO reply);
	
	//특정 게시물 목록
	/*
	 * @Select("select rno,bno,reply,replyer,replyDate,updateDate from reply_table where bno=#{bno} order by rno asc"
	 * )
	 */
	@Select("SELECT rno, bno, reply, replyer, replydate, updatedate\r\n"
			+ "FROM reply_table\r\n"
			+ "WHERE bno = #{bno} AND rno > 0\r\n"
			+ "ORDER BY bno DESC, rno ASC\r\n"
			+ "LIMIT #{cri.pageNum}, #{cri.amount}")
	public List<ReplyVO> getListWithPaging( @Param("bno")Long bno,@Param("cri") Criteria cri);
	
	@Select("SELECT COUNT(rno) FROM reply_table WHERE bno = #{bno}")
	public int getCountByBno(Long bno);
}
