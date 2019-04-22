package com.tj.po;

import java.util.List;

public class Province {
	
	private int pid;
	
	private String pname;
	
	private List<City> citylst;
	
	public Province() {
		// TODO Auto-generated constructor stub
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public List<City> getCitylst() {
		return citylst;
	}

	public void setCitylst(List<City> citylst) {
		this.citylst = citylst;
	}
	
	
}
