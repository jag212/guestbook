package com.jag212.guestbook.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jag212.guestbook.model.GuestbookDto;
import com.jag212.guestbook.service.GuestbookService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
public class GuestbookTest {

	int seq = 2;	//요건 글 번호 존재하는 걸로 선택해서 바꿔가면서 테스트하자
	
	@Autowired
	private GuestbookService guestbookService;
	
	private GuestbookDto guestbookDto = new GuestbookDto();
	
	@Test
	public void testWrite() {
		guestbookDto.setEmail("jag212@naver.com");
		guestbookDto.setPassword("123");
		guestbookDto.setContent("안녕하세요");
		assertEquals(1, guestbookService.write(guestbookDto));
		
		guestbookDto.setEmail("jag212@om");
		guestbookDto.setPassword("123");
		guestbookDto.setContent("안녕하세요2");
		assertEquals(-1, guestbookService.write(guestbookDto));
	}

	@Test
	public void testList() {
		assertNotNull(guestbookService.getList());
	}

	@Test
	public void testMvmodify() {
		assertNotNull(guestbookService.mvmodify(seq, "123"));
	}

	@Test
	public void testModify() {
		guestbookDto.setSeq(seq);
		guestbookDto.setPassword("123");
		guestbookDto.setContent("안녕하세요33333");
		assertEquals(1, guestbookService.modify(guestbookDto));
	}
		
	@Test
	public void testDelete() {
		assertEquals(1, guestbookService.delete(seq));
	}

}
