package com.tj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.po.*;

public interface IUserService {
	public User login(User u) throws Exception;
	
	public boolean register(User u) throws Exception;
	
	public boolean vildEmail(String email) throws Exception;
	
	public boolean changeUname(User u) throws Exception;
	
	public User findById(int id) throws Exception;
	
	public boolean changeEmail(User u) throws Exception;
	
	public boolean updateInfo(User u) throws Exception;
	
	public boolean changePwd(User u) throws Exception;
	
	public boolean readMes(int uid,int type) throws Exception;
	
	public boolean changeIcon(User u)throws Exception;
	
	public List<User> findAllUsers() throws Exception;
	
	public boolean banuser(int uid) throws Exception;
	
	public boolean reopenuser(int uid) throws Exception;
	
	public List<Integer> findFavsByUid(int uid) throws Exception;
	
	public boolean addFavorite(Favorite fav) throws Exception;
	
	public boolean delFavorite(Favorite fav) throws Exception;
	
	public List<House> findFavsHouselist(int uid) throws Exception;
}
