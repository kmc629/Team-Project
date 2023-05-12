package com.gdj59.bookmall.service;

import java.nio.channels.NonReadableChannelException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj59.bookmall.beans.Criteria;
import com.gdj59.bookmall.beans.ReplyVO;
import com.gdj59.bookmall.dto.ReplyPageDto;
import com.gdj59.bookmall.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register........."+ vo);// TODO Auto-generated method stub
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get........."+rno);// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove..............."+rno);// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify...................."+vo);// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board "+bno);// TODO Auto-generated method stub
		return mapper.getListWithPaging(bno, cri);
	}

	@Override
	public ReplyPageDto getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDto(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(bno, cri));
	}

}
