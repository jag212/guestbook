package com.jag212.guestbook.dao;

import java.util.List;

import com.jag212.guestbook.model.GuestbookDto;

public interface GuestbookDao {
	public int write(GuestbookDto guestbookDto);
	
	public int modify(GuestbookDto guestbookDto);

	public int delete(GuestbookDto guestbookDto);

	public List<GuestbookDto> getList();
}
