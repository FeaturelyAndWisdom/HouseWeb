package com.tj.po;

public class Favorite {
	
	private int fid;
	
	private int uid;
	
	private int hid;
	
	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Favorite(int uid, int hid) {
		super();
		this.uid = uid;
		this.hid = hid;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
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
	
	
}
