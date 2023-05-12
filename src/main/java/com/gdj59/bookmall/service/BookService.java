package com.gdj59.bookmall.service;


import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.gdj59.bookmall.beans.BookVO;
import com.gdj59.bookmall.beans.Criteria;

public interface BookService {

	// 책 리스트 페이징

	public List<BookVO> bookList(Criteria cri) throws Exception;
	
	// 책 리스트
	//public Vector<BookVO> bookList() throws Exception;

	// 책 리스트(선택)
	public List<BookVO> bookListCategory(@RequestParam (name = "b_category", required = true)String b_category, Criteria cri) throws Exception;

	// 선택(책) 읽기
	public BookVO bookListOne(int b_num) throws Exception;

	// 책 등록
	public void bookIns(BookVO bookVo) throws Exception;

	// 책 수정
	public void bookUpdate(BookVO bookVo) throws Exception;

	// 책 삭제
	public void bookDel(int b_num) throws Exception;
	

	//책 이름 중복검사
	public int bookNameCheck(BookVO bookVo) throws Exception;

	public List<BookVO> searchName(Criteria cri)throws Exception;

	public int getTotal(Criteria cri);
	
	public List<BookVO>bestSeller();

//	// 책 리스트
//	public List<Map<String, Object>> selectBoardList(Criteria criteria) throws Exception;
//	
//	// 책 카운트
//	public int totalCount() throws Exception;
//	
//	//카운트 카테고리
//	public int getTotalCategory(String b_category) throws Exception;
	
	
	
}
