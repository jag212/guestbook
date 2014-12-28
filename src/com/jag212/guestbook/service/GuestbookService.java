package com.jag212.guestbook.service;

import java.util.List;

import com.jag212.guestbook.model.GuestbookDto;

public interface GuestbookService {
	
	public int write(GuestbookDto guestbookDto);
	
	public int modify(GuestbookDto guestbookDto);

	public int delete(int seq);
	
	public List<GuestbookDto> getList();
	
	public GuestbookDto mvmodify(int seq, String password);
}
