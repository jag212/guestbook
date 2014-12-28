package com.jag212.guestbook.dao;

import java.util.List;
import java.util.Map;

import com.jag212.guestbook.model.GuestbookDto;

public interface GuestbookDao {
	public int write(GuestbookDto guestbookDto);
	
	public int modify(GuestbookDto guestbookDto);

	public int delete(int seq);

	public List<GuestbookDto> getList();

	public GuestbookDto mvmodify(Map<String, String> map);
}
