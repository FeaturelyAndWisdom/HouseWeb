package com.tj.mapper;

import org.springframework.stereotype.Service;

import com.tj.po.Admin;

@Service("AdminMapper")
public interface AdminMapper {

	public int add(Admin admin) throws Exception;
	
	public Admin login(Admin admin) throws Exception;
	 
	public int changePwd(Admin admin) throws Exception;
	
	public Admin findByAid(int aid) throws Exception;
}
