package com.tj.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.tj.po.*;
import com.tj.service.ICommentService;
import com.tj.service.IHouseService;
import com.tj.service.IMessageService;
import com.tj.service.IOrderService;

@Controller
public class OrderController {
	
	@Resource(name="OrderServiceImpl")
	private IOrderService os;
	
	@Resource(name="CommentServiceImpl")
	private ICommentService cs;
	
	@Resource(name="MessageServiceImpl")
	private IMessageService ms;
	
	@Resource(name="HouseServiceImpl")
	private IHouseService hs;
	
	@RequestMapping(value="/saveOrder",method=RequestMethod.POST)
	@ResponseBody
	public String saveOrder(HttpServletRequest request, HttpServletResponse response,@RequestBody Orders order){
		order.setMadedate(new Date());
		boolean flag = false;
		try {
			flag = os.save(order);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			return "success";
		}
		return "fail";
		
	}
	
	@RequestMapping(value="/findOrders",method=RequestMethod.GET)
	public String findCustOrder(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid,@RequestParam("type") int type){
		List<Orders> orderlst = null;
		User user = (User) request.getSession().getAttribute("user");
		try {
			if(type==0){
				orderlst = os.getOrdersByUid(uid);
			}else{
				orderlst = os.getOrdersBySellid(uid);
			}
			user.setCustmess(ms.custmessflushByUid(user.getUid()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("user", user);
		request.setAttribute("olst", orderlst);
		request.setAttribute("type", "∂©µ•π‹¿Ì");
		if(type==0) return "front/userInfo/userinf_order";
		return "front/sellerSys/seller_order";
		
	}
	
	@RequestMapping(value="/findOrderById",method=RequestMethod.GET)
	@ResponseBody
	public Orders findOrderById(HttpServletRequest request, HttpServletResponse response,@RequestParam("oid") int oid){
		Orders o = null;
		try {
			o = os.getOrderByOid(oid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return o;
		
	}
	
	@RequestMapping(value="/accompOrder",method=RequestMethod.POST)
	@ResponseBody
	public String accompOrder(HttpServletRequest request, HttpServletResponse response,@RequestParam("oid") int oid){
		boolean flag = false;
		try {
			flag = os.accompOrder(oid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			return "success";
		}
		return "fail";
		
	}
	
	@RequestMapping(value="/findCommOrder",method=RequestMethod.GET)
	public String findCommOrder(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid){
		List<Orders> nosaylst = null;
		List<Orders> saylst = null;
		try {
			nosaylst = os.getNosayOrdersByUid(uid);
			saylst = os.getsayOrdersByUid(uid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("nosaylst", nosaylst);
		request.setAttribute("saylst", saylst);
		return "front/userInfo/userinf_comment";
	}
	
	@RequestMapping(value="/saveComment",method=RequestMethod.POST)
	@ResponseBody
	public String saveComment(HttpServletRequest request, HttpServletResponse response,@RequestBody Comment comm){
		boolean flag = false;
		try {
			comm.setCommdate(new Date());
			flag = cs.save(comm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) {
			try {
				flag = os.commentOrder(comm.getOid());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(flag) return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value="/findCommByOrder",method=RequestMethod.POST)
	@ResponseBody
	public Comment findCommByOrder(HttpServletRequest request, HttpServletResponse response,@RequestParam("oid") int oid){
		Comment comm = null;
		try {
			comm = cs.findCommsByOid(oid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comm;
	}
	
	@RequestMapping(value="/findSellerOrder",method=RequestMethod.GET)
	public String findSellerOrder(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid){
		List<Orders> ordlst = null;
		List<Orders> lst = new ArrayList<Orders>();
		try {
			ordlst = os.getOrdersBySellid(uid);
			for (Orders o : ordlst) {
				if(o.getState()==0){
					continue;
				}else{
					lst.add(o);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("ordlst", lst);
		return "front/sellerSys/seller_comment";
	}
	
	@RequestMapping(value="/admin/findAllOrder",method=RequestMethod.GET)
	public String findAllOrder(HttpServletRequest request, HttpServletResponse response){
		List<Orders> ordlst = null;
		try {
			ordlst = os.getAllOrder();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("olst", ordlst);
		return "admin/order_manage";
	}
	
	@RequestMapping(value="/admin/findsayOrders",method=RequestMethod.GET)
	public String findsayOrders(HttpServletRequest request, HttpServletResponse response){
		List<Orders> ordlst = null;
		try {
			ordlst = os.getsayOrders();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("ordlst", ordlst);
		return "admin/comment_manage";
	}
	
	@RequestMapping(value="/admin/deleOrder",method=RequestMethod.GET)
	@ResponseBody
	public String deleOrder(HttpServletRequest request, HttpServletResponse response, @RequestParam("oid") int oid){
		boolean flag = false;
		try {
			flag = os.deleOrder(oid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
	
}
