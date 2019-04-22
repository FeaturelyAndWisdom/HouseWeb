package com.tj.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;

public class House implements Serializable{
	
	private int hid;
	
	private String housename;
	
	private int provid;
	
	private int cityid;
	
	private String location;
	
	private String locatremark;
	
	private String doorid;
	
	private String lng;
	
	private String lat;
	
	private String renttype;
	
	private String housetype;
	
	private int housearea;
	
	private String housesight;
	
	private int bedr_num;
	
	private int wcr_num;
	
	private int livr_num;
	
	private int kit_num;
	
	private int bkr_num;
	
	private int bal_num;
	
	private int live_peo_num;
	
	private String house_feature;
	
	private String house_traffic;
	
	private String house_arround;
	
	private String enterlive_time;
	
	private String leavelive_time;
	
	private String otherdesc;
	
	private double house_price;
	
	private int least_day;
	
	private Date senddate;
	
	private Date publishdate;
	
	private int uid;
	
	private int state;
	
	private int isdel;
	
	//实例属性
	private Province province;
	
	private City city;
	
	private List<Livenotice> noticelst;
	
	private List<Extracost> costlst;
	
	private List<ServiceItem> servicelst;
	
	private User user;
	
	private List<HouseImg> imglst;
	
	//设施服务
	private List<ServiceItem> ty1lst;
	
	private List<ServiceItem> ty2lst;
	
	private List<ServiceItem> ty3lst;
	
	private List<ServiceItem> ty4lst;
	
	private List<ServiceItem> ty5lst;
	
	private List<ServiceItem> ty6lst;
	
	private List<ServiceItem> ty7lst;
	
	private List<ServiceItem> ty8lst;
	
	private List<Comment> commlst;
	
	
	
	public House() {
		// TODO Auto-generated constructor stub
	}

	public List<HouseImg> getImglst() {
		return imglst;
	}

	public void setImglst(List<HouseImg> imglst) {
		this.imglst = imglst;
	}

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getHousename() {
		return housename;
	}

	public void setHousename(String housename) {
		this.housename = housename;
	}

	public int getProvid() {
		return provid;
	}

	public void setProvid(int provid) {
		this.provid = provid;
	}

	public int getCityid() {
		return cityid;
	}

	public void setCityid(int cityid) {
		this.cityid = cityid;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocatremark() {
		return locatremark;
	}

	public void setLocatremark(String locatremark) {
		this.locatremark = locatremark;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getRenttype() {
		return renttype;
	}

	public void setRenttype(String renttype) {
		this.renttype = renttype;
	}

	public String getHousetype() {
		return housetype;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}

	public int getHousearea() {
		return housearea;
	}

	public void setHousearea(int housearea) {
		this.housearea = housearea;
	}

	public String getHousesight() {
		return housesight;
	}

	public void setHousesight(String housesight) {
		this.housesight = housesight;
	}

	public int getBedr_num() {
		return bedr_num;
	}

	public void setBedr_num(int bedr_num) {
		this.bedr_num = bedr_num;
	}

	public int getWcr_num() {
		return wcr_num;
	}

	public void setWcr_num(int wcr_num) {
		this.wcr_num = wcr_num;
	}

	public int getLivr_num() {
		return livr_num;
	}

	public void setLivr_num(int livr_num) {
		this.livr_num = livr_num;
	}

	public int getKit_num() {
		return kit_num;
	}

	public void setKit_num(int kit_num) {
		this.kit_num = kit_num;
	}

	public int getBkr_num() {
		return bkr_num;
	}

	public void setBkr_num(int bkr_num) {
		this.bkr_num = bkr_num;
	}

	public int getBal_num() {
		return bal_num;
	}

	public void setBal_num(int bal_num) {
		this.bal_num = bal_num;
	}

	public int getLive_peo_num() {
		return live_peo_num;
	}

	public void setLive_peo_num(int live_peo_num) {
		this.live_peo_num = live_peo_num;
	}

	public String getHouse_feature() {
		return house_feature;
	}

	public void setHouse_feature(String house_feature) {
		this.house_feature = house_feature;
	}

	public String getHouse_traffic() {
		return house_traffic;
	}

	public void setHouse_traffic(String house_traffic) {
		this.house_traffic = house_traffic;
	}

	public String getHouse_arround() {
		return house_arround;
	}

	public void setHouse_arround(String house_arround) {
		this.house_arround = house_arround;
	}

	public String getEnterlive_time() {
		return enterlive_time;
	}

	public void setEnterlive_time(String enterlive_time) {
		this.enterlive_time = enterlive_time;
	}

	public String getLeavelive_time() {
		return leavelive_time;
	}

	public void setLeavelive_time(String leavelive_time) {
		this.leavelive_time = leavelive_time;
	}

	public String getOtherdesc() {
		return otherdesc;
	}

	public void setOtherdesc(String otherdesc) {
		this.otherdesc = otherdesc;
	}

	public double getHouse_price() {
		return house_price;
	}

	public void setHouse_price(double house_price) {
		this.house_price = house_price;
	}

	public int getLeast_day() {
		return least_day;
	}

	public void setLeast_day(int least_day) {
		this.least_day = least_day;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public List<Livenotice> getNoticelst() {
		return noticelst;
	}

	public void setNoticelst(List<Livenotice> noticelst) {
		this.noticelst = noticelst;
	}

	public List<Extracost> getCostlst() {
		return costlst;
	}

	public void setCostlst(List<Extracost> costlst) {
		this.costlst = costlst;
	}

	public List<ServiceItem> getServicelst() {
		return servicelst;
	}

	public void setServicelst(List<ServiceItem> servicelst) {
		this.servicelst = servicelst;
	}

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public String getDoorid() {
		return doorid;
	}

	public void setDoorid(String doorid) {
		this.doorid = doorid;
	}

	public List<ServiceItem> getTy1lst() {
		return ty1lst;
	}

	public void setTy1lst(List<ServiceItem> ty1lst) {
		this.ty1lst = ty1lst;
	}

	public List<ServiceItem> getTy2lst() {
		return ty2lst;
	}

	public void setTy2lst(List<ServiceItem> ty2lst) {
		this.ty2lst = ty2lst;
	}

	public List<ServiceItem> getTy3lst() {
		return ty3lst;
	}

	public void setTy3lst(List<ServiceItem> ty3lst) {
		this.ty3lst = ty3lst;
	}

	public List<ServiceItem> getTy4lst() {
		return ty4lst;
	}

	public void setTy4lst(List<ServiceItem> ty4lst) {
		this.ty4lst = ty4lst;
	}

	public List<ServiceItem> getTy5lst() {
		return ty5lst;
	}

	public void setTy5lst(List<ServiceItem> ty5lst) {
		this.ty5lst = ty5lst;
	}

	public List<ServiceItem> getTy6lst() {
		return ty6lst;
	}

	public void setTy6lst(List<ServiceItem> ty6lst) {
		this.ty6lst = ty6lst;
	}

	public List<ServiceItem> getTy7lst() {
		return ty7lst;
	}

	public void setTy7lst(List<ServiceItem> ty7lst) {
		this.ty7lst = ty7lst;
	}

	public List<ServiceItem> getTy8lst() {
		return ty8lst;
	}

	public void setTy8lst(List<ServiceItem> ty8lst) {
		this.ty8lst = ty8lst;
	}

	public List<Comment> getCommlst() {
		return commlst;
	}

	public void setCommlst(List<Comment> commlst) {
		this.commlst = commlst;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
	
	
}
