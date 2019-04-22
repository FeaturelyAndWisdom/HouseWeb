package com.tj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.mapper.PersonMapper;
import com.tj.po.Person;
import com.tj.service.IPersonService;

@Service("PerService")
@Transactional
public class PersonServiceImpl implements IPersonService {

	@Resource(name="PerMapper")
	private PersonMapper pm;
	
	@Override
	public Person findByPid(int pid) throws Exception {
		return pm.findByPid(pid);
	}

	@Override
	public boolean addPerson(Person p) throws Exception {
		int count = pm.addPerson(p);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean deleteByPid(int pid) throws Exception {
		int count = pm.deleteByPid(pid);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean updatePer(Person p) throws Exception {
		int count = pm.updatePer(p);
		if(count>0) return true;
		return false;
	}

}
