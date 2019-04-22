package com.tj.service;

import com.tj.po.Person;

public interface IPersonService {
	
	public Person findByPid(int pid) throws Exception;
	
	public boolean addPerson(Person p) throws Exception;
	
	public boolean deleteByPid(int pid) throws Exception;
	
	public boolean updatePer(Person p) throws Exception;
}
