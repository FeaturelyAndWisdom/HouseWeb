package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.City;

@Service("CityMapper")
public interface CityMapper {
	
	public List<City> getByProvId(int id) throws Exception;
	
	public City findByCid(int cid) throws Exception;
}
