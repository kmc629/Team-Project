package com.gdj59.bookmall.service;

import java.util.List;

import com.gdj59.bookmall.beans.Criteria;
import com.gdj59.bookmall.beans.ReplyVO;
import com.gdj59.bookmall.dto.ReplyPageDto;

public interface ReplyService {

	
	public int register(ReplyVO vo);
	
	
	public ReplyVO get(Long rno);
	
	
	public int remove (Long rno);
	
	public int modify(ReplyVO vo);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);

	public ReplyPageDto getListPage(Criteria cri, Long bno);
	
}
