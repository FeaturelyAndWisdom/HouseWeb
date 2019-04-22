package com.tj.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.mapper.*;
import com.tj.po.*;
import com.tj.service.IUserService;

@Service("UserService")
@Transactional
public class UserServiceImpl implements IUserService{
	
	@Resource(name="UserMapper")
	private UserMapper um;
	
	@Resource(name="ProvMapper")
	private ProvinceMapper pm;
	
	@Resource(name="CityMapper")
	private CityMapper cm;
	
	@Resource(name="PerMapper")
	private PersonMapper perm;
	
	@Resource(name="MesMapper")
	private MessageMapper mm;
	
	@Resource(name="HouseMapper")
	private HouseMapper hm;

	@Resource(name="FavoriteMapper")
	private FavoriteMapper fm;
	
	@Override
	public User login(User u) throws Exception {
		User user = this.um.login(u);
		Province p = null;
		City c = null;
		p = pm.findByPid(user.getHome_prov());
		user.setHprov(p);
		p = pm.findByPid(user.getLive_prov());
		user.setLprov(p);
		c = cm.findByCid(user.getLive_city());
		user.setLcity(c);
		c = cm.findByCid(user.getHome_city());
		user.setHcity(c);
		user.setPlst(this.perm.findByUid(user.getUid()));
		user.setCustmess(mm.findCustMesByUid(user.getUid()));
		user.setSellmess(mm.findSellerMesByUid(user.getUid()));
		user.setMyhouses(hm.getHouseByUid(u.getUid()));
		return user;
	}

	@Override
	public boolean register(User u) throws Exception {
		u.setRegdate(new Date());
		int count = this.um.add(u);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean vildEmail(String email) throws Exception {
		int count = this.um.vildEmail(email);
		if(count>0) return false;
		return true;
	}

	@Override
	public boolean changeUname(User u) throws Exception {
		int count = this.um.changeUname(u);
		if(count>0) return true;
		return false;
	}

	@Override
	public User findById(int id) throws Exception {
		User user = this.um.findById(id);
		Province p = null;
		City c = null;
		if(user==null) return null;
		p = pm.findByPid(user.getHome_prov());
		user.setHprov(p);
		p = pm.findByPid(user.getLive_prov());
		user.setLprov(p);
		c = cm.findByCid(user.getLive_city());
		user.setLcity(c);
		c = cm.findByCid(user.getHome_city());
		user.setHcity(c);
		user.setPlst(this.perm.findByUid(id));
		user.setCustmess(mm.findCustMesByUid(user.getUid()));
		user.setSellmess(mm.findSellerMesByUid(user.getUid()));
		user.setMyhouses(hm.getHouseByUid(id));
		return user;
	}

	@Override
	public boolean changeEmail(User u) throws Exception {
		int count = this.um.changeEmail(u);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean updateInfo(User u) throws Exception {
		// TODO Auto-generated method stub
		int count = this.um.updateInfo(u);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean changePwd(User u) throws Exception {
		int count = this.um.changePwd(u);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean readMes(int uid,int type) throws Exception {
		// TODO Auto-generated method stub
		int count = 0;
		if(type==0){
			count = mm.readCustMes(uid);
		}else{
			count = mm.readSellMes(uid);
		}
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean changeIcon(User u) throws Exception {
		// TODO Auto-generated method stub
		int count = um.changeIcon(u);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<User> findAllUsers() throws Exception {
		// TODO Auto-generated method stub
		Province p = null;
		City c = null;
		List<User> lst = um.findAllUsers();
		for (User user : lst) {
			p = pm.findByPid(user.getLive_prov());
			user.setLprov(p);
			c = cm.findByCid(user.getLive_city());
			user.setLcity(c);
		}
		return lst;
	}

	@Override
	public boolean banuser(int uid) throws Exception {
		int count = um.banuser(uid);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean reopenuser(int uid) throws Exception {
		int count = um.reopenuser(uid);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<Integer> findFavsByUid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return fm.findFavsByUid(uid);
	}

	@Override
	public boolean addFavorite(Favorite fav) throws Exception {
		int count = fm.add(fav);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean delFavorite(Favorite fav) throws Exception {
		int count = fm.delete(fav);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<House> findFavsHouselist(int uid) throws Exception {
		// TODO Auto-generated method stub
		return fm.findFavsHouselist(uid);
	}  
	
}
