package test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jag212.guestbook.model.GuestbookDto;
import com.jag212.guestbook.service.GuestbookService;

public class GuestbookTest {

	int seq = 2;
	
	@Autowired
	private GuestbookService guestbookService;
	
	private GuestbookDto guestbookDto = new GuestbookDto();
	
	@Test
	public void testWrite() {
		guestbookDto.setEmail("jag212@naver.com");
		guestbookDto.setPassword("123");
		guestbookDto.setContent("æ»≥Á«œººø‰");
		assertEquals(1, guestbookService.write(guestbookDto));
		
		guestbookDto.setEmail("jag212@om");
		guestbookDto.setPassword("123");
		guestbookDto.setContent("æ»≥Á«œººø‰2");
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
		guestbookDto.setContent("æ»≥Á«œººø‰33333");
		assertEquals(1, guestbookService.modify(guestbookDto));
	}
		
	@Test
	public void testDelete() {
		assertEquals(1, guestbookService.delete(seq));
	}

}
