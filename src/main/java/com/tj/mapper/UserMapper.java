package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.*;

@Service("UserMapper")
public interface UserMapper {
	
	public User login(User u) throws Exception;
	
	public int add(User u) throws Exception;
	
	public int vildEmail(String email) throws Exception;
	
	public int changeUname(User u) throws Exception;
	
	public User findById(int id) throws Exception;
	
	public int changeEmail(User u) throws Exception;
	
	public int updateInfo(User u) throws Exception;
	
	public int changePwd(User u) throws Exception;
	
	public int changeIcon(User u) throws Exception;
	
	public List<User> findAllUsers() throws Exception;
	
	public int banuser(int uid) throws Exception;
	
	public int reopenuser(int uid) throws Exception;
}
