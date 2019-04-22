package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Favorite;
import com.tj.po.House;

@Service("FavoriteMapper")
public interface FavoriteMapper {
	
	public List<Integer> findFavsByUid(int uid) throws Exception;
	
	public int add(Favorite fav) throws Exception;
	
	public int delete(Favorite fav) throws Exception;
	
	public List<House> findFavsHouselist(int uid) throws Exception;
}
