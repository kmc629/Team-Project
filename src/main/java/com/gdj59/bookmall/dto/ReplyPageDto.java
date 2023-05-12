package com.gdj59.bookmall.dto;

import java.util.List;

import com.gdj59.bookmall.beans.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDto {

	private int replyCnt;
	private List<ReplyVO> list;
}
