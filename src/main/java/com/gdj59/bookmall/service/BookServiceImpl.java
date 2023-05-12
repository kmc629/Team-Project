package com.gdj59.bookmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdj59.bookmall.beans.BookVO;
import com.gdj59.bookmall.beans.Criteria;
import com.gdj59.bookmall.dao.BookDao;
import com.gdj59.bookmall.mapper.BookMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;

	@Setter(onMethod_ = @Autowired)
	private BookMapper mapper;

	/*
	 * // 책 리스트 public Vector<BookVO> bookList() throws Exception{
	 * log.info("bookList 메서드 호출"); return bookDao.bookList(); }
	 */

	// 책 리스트
	public List<BookVO> bookList(Criteria cri) throws Exception {
		log.info("bookList 메서드 호출");
		return mapper.bookListWithPaging(cri);
	}

	// 책 리스트(카테고리)
	public List<BookVO> bookListCategory(@RequestParam(name = "b_category", required = true) String b_category,
			Criteria cri) throws Exception {
		log.info("listCategory 메서드 호출");
		int skip = cri.getSkip();
		int amount = cri.getAmount();
		return mapper.bookListCategory(b_category, skip , amount);
	}

	// 선택(책) 리스트
	public BookVO bookListOne(int b_num) throws Exception {
		log.info("bookListOne 메서드 호출");
		return bookDao.bookListOne(b_num);
	}

	// 책 등록
	public void bookIns(BookVO bookVo) throws Exception {
		log.info("bookIns 메서드 호출");
		bookDao.bookIns(bookVo);
	}

	// 책 수정
	public void bookUpdate(BookVO bookVo) throws Exception {
		log.info("bookUpdate 메서드 호출");
		bookDao.bookUpdate(bookVo);
	}

	// 책 삭제
	public void bookDel(int b_num) throws Exception {
		log.info("bookDel 메서드 호출");
		bookDao.bookDel(b_num);
	}

	// 책 이름 중복검사
	public int bookNameCheck(BookVO bookVo) throws Exception {
		log.info("bookNameCheck 메서드 호출");
		return bookDao.bookNameCheck(bookVo);
	}

	@Override
	public List<BookVO> searchName(Criteria cri) {
		// TODO Auto-generated method stub
		log.info("searchName 메서드 호출");
		int skip = cri.getSkip();
		int amount = cri.getAmount();
		return mapper.searchName(cri.getKeyword(), skip, amount);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BookVO> bestSeller() {
		// TODO Auto-generated method stub
		return mapper.bestSeller();
	}

//	// 책 리스트
//	public List<Map<String, Object>> selectBoardList(Criteria criteria)throws Exception{
//		log.info("selectBoardList 메서드 호출");
//		return bookDao.selectBoardList(criteria);
//	}
//	
//	// 책 카운트
//	public int totalCount()throws Exception {
//		log.info("totalCount 메서드 호출");
//		return bookDao.totalCount();
//	}
//	
//	//카운트 카테고리
//	public int getTotalCategory(String b_category) throws Exception {
//		log.info("getTotalCategory 메서드 호출");
//		return bookDao.getTotalCategory(b_category);
//	}
//	
}
