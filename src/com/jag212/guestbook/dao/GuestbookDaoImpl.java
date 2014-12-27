package com.jag212.guestbook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.jag212.guestbook.model.GuestbookDto;

@Component
public class GuestbookDaoImpl implements GuestbookDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int write(GuestbookDto guestbookDto) {
		int cnt = sqlSession.insert("com.jag212.guestbook.dao.GuestbookDao.write", guestbookDto);
		sqlSession.commit();
		return cnt;
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

}
