package com.jag212.guestbook.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return guestbookDao.modify(guestbookDto);
	}

	@Override
	public int delete(int seq) {
		return guestbookDao.delete(seq);
	}

	@Override
	public List<GuestbookDto> getList() {
		return guestbookDao.getList();
	}

	@Override
	public GuestbookDto mvmodify(int seq, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq+"");
		map.put("password", password);
		return guestbookDao.mvmodify(map);
	}
	
}
