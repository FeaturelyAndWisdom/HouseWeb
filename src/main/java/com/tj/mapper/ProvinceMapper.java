package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Province;

@Service("ProvMapper")
public interface ProvinceMapper {
	
	public List<Province> getProvAll() throws Exception;
	
	public Province findByPid(int id) throws Exception;
	
}
