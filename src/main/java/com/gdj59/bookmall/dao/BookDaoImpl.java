package com.gdj59.bookmall.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj59.bookmall.beans.BookVO;
import com.gdj59.bookmall.beans.Criteria;
import com.gdj59.bookmall.mapper.BookMapper;

@Repository
public class BookDaoImpl implements BookDao{

	@Autowired
	private BookMapper bookMapper;


	// 책 리스트
	public List<BookVO> bookList(Criteria cri){
		return bookMapper.bookList(cri);
	}
	
	// 책 리스트
	public List<BookVO> bookListCategory(Criteria cri,@RequestParam (name = "b_category", required = true)String b_category){
		int skip = cri.getSkip();
		int amount = cri.getAmount();
		return bookMapper.bookListCategory(b_category, skip, amount);
	}
	
	// 선택(책) 읽기
	public BookVO bookListOne(int b_num){
		return bookMapper.bookListOne(b_num);
	}
	
	// 책 등록
	public void bookIns(BookVO bookVo){
		bookMapper.bookIns(bookVo);
	}
	
	// 책 수정
	public void bookUpdate(BookVO bookVo){
		bookMapper.bookUpdate(bookVo);
	}
	
	// 책 삭제
	public void bookDel(int b_num){
		bookMapper.bookDel(b_num);
	}


	//책 이름 중복검사
	public int bookNameCheck(BookVO bookVo) {
		return bookMapper.bookNameCheck(bookVo);
	}

	@Override
	public List<BookVO> searchName(Criteria cri) throws Exception {
		int skip = cri.getSkip();
		int amount = cri.getAmount();
		return bookMapper.searchName(cri.getKeyword(), skip, amount);
	}

	@Override
	public List<BookVO> bestSeller() {
		// TODO Auto-generated method stub
		return bookMapper.bestSeller();
	}



	

//	// 책 리스트
//	public List<Map<String, Object>> selectBoardList(Criteria criteria){
//		return bookMapper.selectBoardList(criteria);
//	}
//
//	// 책 카운트
//	public int totalCount() {
//		return bookMapper.totalCount();
//	}
//
//	//카운트 카테고리
//	public int getTotalCategory(String b_category) {
//		return bookMapper.getTotalCategory(b_category);
//	}
	
}
