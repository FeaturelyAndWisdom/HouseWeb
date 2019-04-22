package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.ServiceType;

@Service("ServiceTpMapper")
public interface ServiceTypeMapper {
	
	public List<ServiceType> findServiceAll() throws Exception;
	
}
