package com.gdj59.bookmall.beans;

import java.nio.channels.InterruptedByTimeoutException;

public class Criteria {

	private int pageNum;
	private int amount;
	private int skip;
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1 ) * amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	// 새로 페이지 수를 설정했을 때 skip도 계산
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip = (pageNum - 1 ) * amount;
	}

	public int getAmount() {
		return amount;
	}

	// 페이지당 데이터 갯수를 바꿀 경우에도 skip을 다시 계산
	public void setAmount(int amount) {
		this.amount = amount;
		this.skip = (pageNum - 1 ) * amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword + "]";
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	


}