package com.tj.po;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HouseVo {

	
	private House house;
	
	private List<Integer> notices;
	
	private List<Integer> extracosts;
	
	private List<Integer> sitems;
	
	private String[] photos;
	
	private int tempnotice;
	
	private int tempcost;
	
	private int tempitem;
	
	private String filename;
	
	private String maxlng;
	private String maxlat;
	private String minlng;
	private String minlat;
	
	public HouseVo() {
		// TODO Auto-generated constructor stub
	}


	public House getHouse() {
		return house;
	}


	public void setHouse(House house) {
		this.house = house;
	}


	public List<Integer> getNotices() {
		return notices;
	}


	public void setNotices(List<Integer> notices) {
		this.notices = notices;
	}

	public String[] getPhotos() {
		return photos;
	}


	public void setPhotos(String[] photos) {
		this.photos = photos;
	}


	public List<Integer> getExtracosts() {
		return extracosts;
	}


	public void setExtracosts(List<Integer> extracosts) {
		this.extracosts = extracosts;
	}


	public List<Integer> getSitems() {
		return sitems;
	}


	public void setSitems(List<Integer> sitems) {
		this.sitems = sitems;
	}


	public int getTempnotice() {
		return tempnotice;
	}


	public void setTempnotice(int tempnotice) {
		this.tempnotice = tempnotice;
	}


	public int getTempcost() {
		return tempcost;
	}


	public void setTempcost(int tempcost) {
		this.tempcost = tempcost;
	}


	public int getTempitem() {
		return tempitem;
	}


	public void setTempitem(int tempitem) {
		this.tempitem = tempitem;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getMaxlng() {
		return maxlng;
	}


	public void setMaxlng(String maxlng) {
		this.maxlng = maxlng;
	}


	public String getMaxlat() {
		return maxlat;
	}


	public void setMaxlat(String maxlat) {
		this.maxlat = maxlat;
	}


	public String getMinlng() {
		return minlng;
	}


	public void setMinlng(String minlng) {
		this.minlng = minlng;
	}


	public String getMinlat() {
		return minlat;
	}


	public void setMinlat(String minlat) {
		this.minlat = minlat;
	}
	
	
}
