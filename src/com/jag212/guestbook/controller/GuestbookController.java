package com.jag212.guestbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jag212.guestbook.model.GuestbookDto;
import com.jag212.guestbook.service.GuestbookService;

@Controller
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	@RequestMapping("/mvwrite.html")
	public String mvwrite(){
		return "redirect:/guestbook/write.jsp";
	}
	
	@RequestMapping("/write.html")
	public String write(GuestbookDto guestbookDto){
		int cnt = guestbookService.write(guestbookDto);
		if(cnt==-1) return "redirect:/error/emailErr.jsp";
		else if(cnt == 0) return "redirect:/error/writeErr.jsp";
		else return "redirect:/list.html";
	}
	
	@RequestMapping("/list.html")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		List<GuestbookDto> gbList = guestbookService.getList();
		mav.addObject("gbList", gbList);
		mav.setViewName("/guestbook/list");
		return mav;
	}
	
	@RequestMapping("/mvmodify.html")
	public ModelAndView mvmodify(@RequestParam("seq")int seq, @RequestParam("password")String password){
		ModelAndView mav = new ModelAndView();
		GuestbookDto guestbookDto = guestbookService.mvmodify(seq, password);
		if(guestbookDto!=null){
			mav.addObject("gbDto", guestbookDto);
			mav.setViewName("/guestbook/modify");
		} else{
			mav.setViewName("redirect:/error/pwErr.jsp");
		}
		return mav;
	}
	
	@RequestMapping("/delete.html")
	public String delete(@RequestParam("seq")int seq){
		int cnt = guestbookService.delete(seq);
		if(cnt!=0) return "redirect:/list.html";
		else return "redirect:/error/deleteErr.jsp";
	}
	
	@RequestMapping("/modify.html")
	public String modify(GuestbookDto guestbookDto){
		int cnt = guestbookService.modify(guestbookDto);
		if(cnt!=0) return "redirect:/list.html";
		else return "redirect:/error/modifyErr.jsp";
	}
}
