package com.tj.service;

import java.util.List;

import com.tj.po.Province;

public interface IProvService {
	
	public List<Province> getProvAll() throws Exception;
	
	public Province findByPid(int id) throws Exception;
}
