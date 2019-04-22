package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Person;

@Service("PerMapper")
public interface PersonMapper {
	
	public List<Person> findByUid(int uid) throws Exception;
	
	public Person findByPid(int pid) throws Exception;
	
	public int addPerson(Person p) throws Exception;
	
	public int deleteByPid(int pid) throws Exception;
	
	public int updatePer(Person p) throws Exception;
	
}
