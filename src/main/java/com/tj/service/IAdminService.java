package com.tj.service;

import com.tj.po.Admin;
import com.tj.po.Message;

public interface IAdminService {
	
	public boolean add(Admin admin) throws Exception;
	
	public Admin login(Admin admin) throws Exception;
	
	public boolean changePwd(Admin admin) throws Exception;
	
	public boolean sendMes(Message mes) throws Exception;
	
	public Admin findByAid(int aid) throws Exception;
}
