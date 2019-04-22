package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.HouseVo;
import com.tj.po.Livenotice;

@Service("LivenoticeMapper")
public interface LivenoticeMapper {
	
	public int addHouseNotInfo(HouseVo hv) throws Exception;
	
	public List<Livenotice> findByHid(int hid) throws Exception;
}
