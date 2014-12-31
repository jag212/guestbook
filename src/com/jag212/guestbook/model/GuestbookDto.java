package com.jag212.guestbook.model;

public class GuestbookDto {
	private int seq;
	private String email;
	private String password;
	private String content;
	private String logtime;
	private String modilog;
	
	public String getEmail() {
		return email;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public String getModilog() {
		return modilog;
	}
	public void setModilog(String modilog) {
		this.modilog = modilog;
	}
}
