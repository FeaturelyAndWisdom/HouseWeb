package com.tj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.mapper.AdminMapper;
import com.tj.mapper.MessageMapper;
import com.tj.po.Admin;
import com.tj.po.Message;
import com.tj.service.IAdminService;

@Service("AdminServiceImpl")
@Transactional
public class AdminServiceImpl implements IAdminService {
	
	@Resource(name="AdminMapper")
	private AdminMapper am;
	
	@Resource(name="MesMapper")
	private MessageMapper mm;

	@Override
	public boolean add(Admin admin) throws Exception {
		// TODO Auto-generated method stub
		int count = am.add(admin);
		if(count>0) return true;
		return false;
	}

	@Override
	public Admin login(Admin admin) throws Exception {
		return am.login(admin);
	}

	@Override
	public boolean changePwd(Admin admin) throws Exception {
		int count = am.changePwd(admin);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean sendMes(Message mes) throws Exception {
		// TODO Auto-generated method stub
		int count = mm.sendMess(mes);
		if(count>0) return true;
		return false;
	}

	@Override
	public Admin findByAid(int aid) throws Exception {
		// TODO Auto-generated method stub
		return am.findByAid(aid);
	}
	
	
}
