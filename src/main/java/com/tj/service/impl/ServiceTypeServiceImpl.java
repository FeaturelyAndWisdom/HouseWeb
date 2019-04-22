package com.tj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.mapper.ServiceTypeMapper;
import com.tj.po.ServiceType;
import com.tj.service.IServiceTypeServiceImpl;

@Service("ServiceTypeService")
@Transactional
public class ServiceTypeServiceImpl implements IServiceTypeServiceImpl{

	@Resource(name="ServiceTpMapper")
	private ServiceTypeMapper stm;
	
	@Override
	public List<ServiceType> getServiceTypeAll() throws Exception {
		// TODO Auto-generated method stub
		return stm.findServiceAll();
	}
	
	
}
