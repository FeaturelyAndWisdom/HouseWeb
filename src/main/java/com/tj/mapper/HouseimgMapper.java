package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.*;

@Service("HouseimgMapper")
public interface HouseimgMapper {
	
	public int add(HouseVo hi) throws Exception;
	
	public List<HouseImg> findByHid(int hid) throws Exception;
}
