package com.jag212.guestbook.service;

import com.jag212.guestbook.model.GuestbookDto;

public interface GuestbookService {
	
	public int write(GuestbookDto guestbookDto);
	
	public int modify(GuestbookDto guestbookDto);

	public int delete(GuestbookDto guestbookDto);
	
}
