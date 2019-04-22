package com.tj.po;

import java.util.List;

public class ServiceType {
	
	private int stid;
	
	private String typename;
	
	private List<ServiceItem> itemlst;
	
	public ServiceType() {
		// TODO Auto-generated constructor stub
	}

	public int getStid() {
		return stid;
	}

	public void setStid(int stid) {
		this.stid = stid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public List<ServiceItem> getItemlst() {
		return itemlst;
	}

	public void setItemlst(List<ServiceItem> itemlst) {
		this.itemlst = itemlst;
	}
	
	
}
