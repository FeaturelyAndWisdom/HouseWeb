package com.tj.po;

import java.util.Date;

public class Orders {
	
	private int oid;
	
	private String ordernum;
	
	private Date madedate;
	
	private int uid;
	
	private int hid;
	
	private Date livetime;
	
	private Date leavetime;
	
	private int housenum;
	
	private int pernum;
	
	private String pername;
	
	private String pertel;
	
	private String percardid;
	
	private int sellid;
	
	private User seller;
	
	private User user;
	
	private House house;
	
	private double totalprice;
	
	private int state;
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}


	public Date getMadedate() {
		return madedate;
	}

	public void setMadedate(Date madedate) {
		this.madedate = madedate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public Date getLivetime() {
		return livetime;
	}

	public void setLivetime(Date livetime) {
		this.livetime = livetime;
	}

	public Date getLeavetime() {
		return leavetime;
	}

	public void setLeavetime(Date leavetime) {
		this.leavetime = leavetime;
	}

	public int getHousenum() {
		return housenum;
	}

	public void setHousenum(int housenum) {
		this.housenum = housenum;
	}

	public int getPernum() {
		return pernum;
	}

	public void setPernum(int pernum) {
		this.pernum = pernum;
	}

	public String getPername() {
		return pername;
	}

	public void setPername(String pername) {
		this.pername = pername;
	}

	public String getPertel() {
		return pertel;
	}

	public void setPertel(String pertel) {
		this.pertel = pertel;
	}

	public String getPercardid() {
		return percardid;
	}

	public void setPercardid(String percardid) {
		this.percardid = percardid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public int getSellid() {
		return sellid;
	}

	public void setSellid(int sellid) {
		this.sellid = sellid;
	}

	public User getSeller() {
		return seller;
	}

	public void setSeller(User seller) {
		this.seller = seller;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
}
