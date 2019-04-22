package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Extracost;
import com.tj.po.HouseVo;

@Service("ExtracostMapper")
public interface ExtracostMapper {
	
	public int addHouseExtInfo(HouseVo hv) throws Exception;
	
	public List<Extracost> findByHid(int hid) throws Exception;
}
