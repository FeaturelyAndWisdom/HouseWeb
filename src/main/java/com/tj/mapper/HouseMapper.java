package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.House;
import com.tj.po.HouseVo;

@Service("HouseMapper")
public interface HouseMapper {
	
	public int add(House house) throws Exception;
	
	public List<House> getHouseByUid(int uid) throws Exception;
	
	public House findNewHouse() throws Exception;
	
	public List<House> getHouseByCity(int cityid) throws Exception;
	
	public House findHouseById(int hid) throws Exception;
	
	public List<House> findAllHouse() throws Exception;
	
	public int passHouse(int hid) throws Exception;
	
	public int nopassHouse(int hid) throws Exception;
	
	public int downHouse(int hid) throws Exception;
	
	public int upHouse(int hid) throws Exception;
	
	public List<House> findArround(HouseVo hv) throws Exception;
}
