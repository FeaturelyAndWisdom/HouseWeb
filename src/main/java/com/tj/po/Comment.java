package com.tj.po;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonManagedReference;

public class Comment {
	
	private int commid;
	
	private int oid;
	
	private int hid;
	
	private int uid;
	
	private String content;
	
	private int sellid;
	
	private User cust;
	
	private User seller;
	
	private Orders order;
	
	private House house;
	
	private Date commdate;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public int getCommid() {
		return commid;
	}

	public void setCommid(int commid) {
		this.commid = commid;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSellid() {
		return sellid;
	}

	public void setSellid(int sellid) {
		this.sellid = sellid;
	}

	public User getCust() {
		return cust;
	}

	public void setCust(User cust) {
		this.cust = cust;
	}

	public User getSeller() {
		return seller;
	}

	public void setSeller(User seller) {
		this.seller = seller;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}
	
	public House getHouse() {
		return house;
	}
	
	public void setHouse(House house) {
		this.house = house;
	}

	public Date getCommdate() {
		return commdate;
	}

	public void setCommdate(Date commdate) {
		this.commdate = commdate;
	}
	
	
}
