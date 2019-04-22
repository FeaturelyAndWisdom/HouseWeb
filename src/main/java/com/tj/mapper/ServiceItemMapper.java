package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.*;
import com.tj.po.ServiceItem;

@Service("ServiceItemMapper")
public interface ServiceItemMapper {
	
	public int addHouseItemInfo(HouseVo hv) throws Exception;;

	public List<ServiceItem> getItemsByHid(int hid) throws Exception;
	
	public List<ServiceItem> getItemsByTpid(int stid) throws Exception;
	
	public List<ServiceItem> getType1(int hid) throws Exception;
	
	public List<ServiceItem> getType2(int hid) throws Exception;
	
	public List<ServiceItem> getType3(int hid) throws Exception;
	
	public List<ServiceItem> getType4(int hid) throws Exception;
	
	public List<ServiceItem> getType5(int hid) throws Exception;
	
	public List<ServiceItem> getType6(int hid) throws Exception;
	
	public List<ServiceItem> getType7(int hid) throws Exception;
	
	public List<ServiceItem> getType8(int hid) throws Exception;
}
