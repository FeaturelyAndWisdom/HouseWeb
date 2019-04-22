package com.tj.service;

import java.util.List;

import com.tj.po.*;

public interface IHouseService {

	public House save(House house) throws Exception;
	
	public List<House> getHouseByUid(int uid) throws Exception;
	
	public boolean saveLivenoticeInfo(HouseVo hv) throws Exception;
	
	public boolean saveServItemInfo(HouseVo hv) throws Exception;
	
	public boolean saveExtcostInfo(HouseVo hv) throws Exception;
	
	public boolean saveFileInfo(HouseVo hv) throws Exception;
	
	public House findNewHouse() throws Exception;
	
	public List<House> getHouseByCity(int nowpage, int pagesize, int city) throws Exception;
	
	public House findHouseById(int hid) throws Exception;
	
	public City findCityById(int cid) throws Exception;
	
	public List<House> findAllHouse() throws Exception;
	
	public boolean passHouse(int hid) throws Exception;
	
	public boolean nopassHouse(int hid) throws Exception;
	
	public boolean downHouse(int hid) throws Exception;
	
	public boolean upHouse(int hid) throws Exception;
	
	public List<House> findArround(double lng,double lat, double size) throws Exception; 
	
}
