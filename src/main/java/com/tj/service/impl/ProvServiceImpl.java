package com.tj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.mapper.ProvinceMapper;
import com.tj.po.Province;
import com.tj.service.IProvService;

@Service("ProvImpl")
@Transactional
public class ProvServiceImpl implements IProvService {
	
	@Resource(name="ProvMapper")
	private ProvinceMapper pm;
	
	@Override
	public List<Province> getProvAll() throws Exception {
		// TODO Auto-generated method stub
		return pm.getProvAll();
	}

	@Override
	public Province findByPid(int id) throws Exception {
		// TODO Auto-generated method stub
		return pm.findByPid(id);
	}

}
