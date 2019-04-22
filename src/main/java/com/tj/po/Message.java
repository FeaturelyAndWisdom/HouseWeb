package com.tj.po;

import java.util.Date;

public class Message {
	
	private int mid;
	
	private String title;
	
	private String content;
	
	private Date senddate;
	
	private int type;
	
	private int uid;
	
	private int state;
	
	private int sender;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}
	
	
}
