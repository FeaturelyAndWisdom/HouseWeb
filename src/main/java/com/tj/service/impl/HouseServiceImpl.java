package com.tj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tj.mapper.*;
import com.tj.po.City;
import com.tj.po.House;
import com.tj.po.HouseVo;
import com.tj.service.IHouseService;

@Service("HouseServiceImpl")
@Transactional
public class HouseServiceImpl implements IHouseService {

	@Resource(name="HouseMapper")
	private HouseMapper hm;
	
	@Resource(name="LivenoticeMapper")
	private LivenoticeMapper lnm;
	
	@Resource(name="ExtracostMapper")
	private ExtracostMapper ecm;
	
	@Resource(name="ServiceItemMapper")
	private ServiceItemMapper sim;
	
	@Resource(name="HouseimgMapper")
	private HouseimgMapper him;
	
	@Resource(name="CityMapper")
	private CityMapper cm;
	
	@Override
	public House save(House house) throws Exception {
		int count = hm.add(house);
		if(count>0) return hm.findNewHouse();
		return null;
	}

	@Override
	public List<House> getHouseByUid(int uid) throws Exception {
		return hm.getHouseByUid(uid);
	}
	
	public boolean saveLivenoticeInfo(HouseVo hv) throws Exception{
		int count = lnm.addHouseNotInfo(hv);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean saveServItemInfo(HouseVo hv) throws Exception {
		int count = sim.addHouseItemInfo(hv);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean saveExtcostInfo(HouseVo hv) throws Exception {
		int count = ecm.addHouseExtInfo(hv);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean saveFileInfo(HouseVo hv) throws Exception {
		int count = him.add(hv);
		if(count>0) return true;
		return false;
	}

	@Override
	public House findNewHouse() throws Exception {
		// TODO Auto-generated method stub
		return hm.findNewHouse();
	}

	@Override
	public List<House> getHouseByCity(int nowpage, int pagesize, int city) throws Exception {
		// TODO Auto-generated method stub
		PageHelper.startPage(nowpage, pagesize);
		List<House> houselst = hm.getHouseByCity(city);
		return houselst;
	}

	@Override
	public House findHouseById(int hid) throws Exception {
		// TODO Auto-generated method stub
		return hm.findHouseById(hid);
	}

	@Override
	public City findCityById(int cid) throws Exception {
		// TODO Auto-generated method stub
		
		return cm.findByCid(cid);
	}

	@Override
	public List<House> findAllHouse() throws Exception {
		// TODO Auto-generated method stub
		List<House> houselst = hm.findAllHouse();
		return houselst;
	}

	@Override
	public boolean passHouse(int hid) throws Exception {
		int count = hm.passHouse(hid);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean downHouse(int hid) throws Exception {
		int count = hm.downHouse(hid);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean upHouse(int hid) throws Exception {
		int count = hm.upHouse(hid);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean nopassHouse(int hid) throws Exception {
		int count = hm.nopassHouse(hid);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<House> findArround(double lng, double lat, double size) throws Exception {
		HouseVo hv = new HouseVo();
		hv.setMaxlng(lng+size+"");
		hv.setMaxlat(lat+size+"");
		hv.setMinlng(lng-size+"");
		hv.setMinlat(lat-size+"");
		return hm.findArround(hv);
	}
	
}
