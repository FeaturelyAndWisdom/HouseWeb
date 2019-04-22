package com.tj.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.po.House;
import com.tj.po.Message;
import com.tj.po.Orders;
import com.tj.po.Province;
import com.tj.po.User;
import com.tj.service.IHouseService;
import com.tj.service.IMessageService;
import com.tj.service.IOrderService;
import com.tj.service.IProvService;

@Controller
public class PageController {
	
	@Resource(name="ProvImpl")
	private IProvService ps;
	
	@Resource(name="OrderServiceImpl")
	private IOrderService os;
	
	@Resource(name="MessageServiceImpl")
	private IMessageService ms;
	
	@Resource(name="HouseServiceImpl")
	private IHouseService hs;
	
	@RequestMapping(value = "/pageInit")
	public String initProv(HttpServletRequest request, HttpServletResponse response){
		List<Province> plst = null;
		try {
			plst = ps.getProvAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("provlst", plst);
		return "front/index";
	}
	
	@RequestMapping(value="/sellerpageInit",method=RequestMethod.GET)
	public String sellerInit(HttpServletRequest request, HttpServletResponse response){
		boolean flag = false;
		User user = (User) request.getSession().getAttribute("user");
		int uid = user.getUid();
		List<Orders> olst = null;
		List<Message> mlst = null;
		List<House> hlst = null;
		int item1_num = 0;
		int item2_num = 0;
		int item3_num = 0;
		int item4_num = 0;
		int item5_num = 0;
		int item6_num = 0;
		int item7_num = 0;
		try {
			olst = os.getOrdersBySellid(uid);
			for (Orders o : olst) {
				if(o.getState()==0) item1_num+=1;
				if(o.getState()==1) item2_num+=1;
				if(o.getState()==2) item3_num+=1;
			}
			mlst = ms.sellmessflushByUid(uid);
			for (Message m : mlst) {
				if(m.getState()==0) item4_num+=1;
			}
			hlst = hs.getHouseByUid(uid);
			for (House h : hlst) {
				if(h.getState()==-1) item5_num+=1;
				if(h.getState()==0) item6_num+=1;
				if(h.getState()==1) item7_num+=1;
			}
			user.setSellmess(mlst);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("user", user);
		request.setAttribute("type", " ");
		request.setAttribute("item1_num", item1_num);
		request.setAttribute("item2_num", item2_num);
		request.setAttribute("item3_num", item3_num);
		request.setAttribute("item4_num", item4_num);
		request.setAttribute("item5_num", item5_num);
		request.setAttribute("item6_num", item6_num);
		request.setAttribute("item7_num", item7_num);
		return "front/sellerSys/seller_index";
	}
	
}
