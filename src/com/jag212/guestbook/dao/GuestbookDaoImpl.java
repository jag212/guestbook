package com.jag212.guestbook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.jag212.guestbook.model.GuestbookDto;

@Component
public class GuestbookDaoImpl implements GuestbookDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int write(GuestbookDto guestbookDto) {
		int cnt = sqlSession.insert("com.jag212.guestbook.dao.GuestbookDao.write", guestbookDto);
		return cnt;
	}

	@Override
	public int modify(GuestbookDto guestbookDto) {
		int cnt = 0;
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("modify-transaction");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		try{
			sqlSession.update("com.jag212.guestbook.dao.GuestbookDao.modify", guestbookDto);
			sqlSession.update("com.jag212.guestbook.dao.GuestbookDao.modifytime", guestbookDto.getSeq());
			cnt=1;
		} catch(Exception e){
			transactionManager.rollback(status);
		}
		transactionManager.commit(status);
		return cnt;
	}

	@Override
	public int delete(int seq) {
		return sqlSession.delete("com.jag212.guestbook.dao.GuestbookDao.delete", seq);
	}

	@Override
	public List<GuestbookDto> getList() {
		return sqlSession.selectList("com.jag212.guestbook.dao.GuestbookDao.getList");
	}

	@Override
	public GuestbookDto mvmodify(Map<String, String> map) {
		return sqlSession.selectOne("com.jag212.guestbook.dao.GuestbookDao.passchk", map);
	}
}
