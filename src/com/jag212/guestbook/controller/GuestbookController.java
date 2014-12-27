package com.jag212.guestbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jag212.guestbook.model.GuestbookDto;
import com.jag212.guestbook.service.GuestbookService;

@Controller
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	@RequestMapping("/write.html")
	public ModelAndView wirte(GuestbookDto guestbookDto){
		ModelAndView mav = new ModelAndView();
		int cnt = guestbookService.write(guestbookDto);
		if(cnt==-1) mav.setViewName("redirect:/emailErr.jsp");
		else if(cnt == 0) mav.setViewName("redirect:/writeErr.jsp");
		else {System.out.println("글쓰기 성공");}
		return mav;
	}
}
