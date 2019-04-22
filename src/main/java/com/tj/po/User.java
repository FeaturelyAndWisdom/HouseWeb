package com.tj.po;

import java.util.Date;
import java.util.List;

public class User {
	
	private int uid;
	
	private String uname;
	
	private String pwd;
	
	private String tel;
	
	private String email;
	
	private Date regdate;
	
	private int isdel;
	
	//Ñ¡ÌîÏî
	private String sex;
	
	private String realname;
	
	private String edu;
	
	private String job;
	
	private String uimg;
	
	private int home_prov;
	private Province hprov;
	
	private int home_city;
	private City hcity;
	
	private int live_prov;
	private Province lprov;
	
	private int live_city;
	private City lcity;
	
	private Date birthday;
	
	private List<Person> plst;
	
	private List<Message> custmess;
	
	private List<Message> sellmess;
	
	private List<House> myhouses;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getEdu() {
		return edu;
	}

	public void setEdu(String edu) {
		this.edu = edu;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getHome_prov() {
		return home_prov;
	}

	public void setHome_prov(int home_prov) {
		this.home_prov = home_prov;
	}

	public int getHome_city() {
		return home_city;
	}

	public void setHome_city(int home_city) {
		this.home_city = home_city;
	}

	public int getLive_prov() {
		return live_prov;
	}

	public void setLive_prov(int live_prov) {
		this.live_prov = live_prov;
	}

	public int getLive_city() {
		return live_city;
	}

	public void setLive_city(int live_city) {
		this.live_city = live_city;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Province getHprov() {
		return hprov;
	}

	public void setHprov(Province hprov) {
		this.hprov = hprov;
	}

	public City getHcity() {
		return hcity;
	}

	public void setHcity(City hcity) {
		this.hcity = hcity;
	}

	public Province getLprov() {
		return lprov;
	}

	public void setLprov(Province lprov) {
		this.lprov = lprov;
	}

	public City getLcity() {
		return lcity;
	}

	public void setLcity(City lcity) {
		this.lcity = lcity;
	}

	public List<Person> getPlst() {
		return plst;
	}

	public void setPlst(List<Person> plst) {
		this.plst = plst;
	}

	public List<Message> getCustmess() {
		return custmess;
	}

	public void setCustmess(List<Message> custmess) {
		this.custmess = custmess;
	}

	public List<Message> getSellmess() {
		return sellmess;
	}

	public void setSellmess(List<Message> sellmess) {
		this.sellmess = sellmess;
	}

	public List<House> getMyhouses() {
		return myhouses;
	}

	public void setMyhouses(List<House> myhouses) {
		this.myhouses = myhouses;
	}

	public String getUimg() {
		return uimg;
	}

	public void setUimg(String uimg) {
		this.uimg = uimg;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
	
	
	
}
