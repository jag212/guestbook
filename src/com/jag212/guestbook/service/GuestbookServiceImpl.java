package com.jag212.guestbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jag212.guestbook.dao.GuestbookDao;
import com.jag212.guestbook.model.GuestbookDto;
import com.jag212.guestbook.util.GuestbookUtil;

@Component
public class GuestbookServiceImpl implements GuestbookService{

	@Autowired
	private GuestbookDao guestbookDao;
	
	@Override
	public int write(GuestbookDto guestbookDto) {
		if(!GuestbookUtil.isValidEmail(guestbookDto.getEmail())){	//비정상적인 이메일일 경우
			return -1;
		}
		return guestbookDao.write(guestbookDto);
	}

	@Override
	public int modify(GuestbookDto guestbookDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(GuestbookDto guestbookDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GuestbookDto> getList() {
		return guestbookDao.getList();
	}
	
}
