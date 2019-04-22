package com.tj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.po.Person;
import com.tj.po.PersonVo;
import com.tj.po.User;
import com.tj.service.IPersonService;
import com.tj.service.IUserService;

@Controller
@RequestMapping("/person")
public class PersonController {
	
	@Resource(name="PerService")
	private IPersonService ps;
	
	@Resource(name="UserService")
	private IUserService us;
	
	@RequestMapping(value = "/findPerByPid")
	@ResponseBody
	public Person findPerByPid(HttpServletRequest request, HttpServletResponse response,int pid){
		Person p = null;
		try {
			p = ps.findByPid(pid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	
	@RequestMapping(value = "/batchDel")
	@ResponseBody
	public String batchDel(HttpServletRequest request, HttpServletResponse response,@RequestBody Integer[] dels){
		boolean flag = true;
		User user = (User) request.getSession().getAttribute("user");
		try {
			for (Integer pid : dels) {
				flag = ps.deleteByPid(pid);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) {
			try {
				request.getSession().setAttribute("user", us.findById(user.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/deleteByPid")
	@ResponseBody
	public String deleteByPid(HttpServletRequest request, HttpServletResponse response,String pid){
		boolean flag = false;
		User user = (User) request.getSession().getAttribute("user");
		try {
			flag = ps.deleteByPid(Integer.parseInt(pid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) {
			try {
				request.getSession().setAttribute("user", us.findById(user.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/addPer")
	@ResponseBody
	public String addPer(HttpServletRequest request, HttpServletResponse response,@RequestBody PersonVo pv){
		User user = (User) request.getSession().getAttribute("user");
		boolean flag = false;
		Date birth = null;
		try {
			birth = new SimpleDateFormat("yyyy/MM/dd").parse(pv.getBir());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Person p = pv.getPerson();
		p.setBirthday(birth);
		try {
			flag = ps.addPerson(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) {
			try {
				request.getSession().setAttribute("user", us.findById(user.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/updatePer")
	@ResponseBody
	public String updatePer(HttpServletRequest request, HttpServletResponse response,@RequestBody PersonVo pv){
		User user = (User) request.getSession().getAttribute("user");
		boolean flag = false;
		Date birth = null;
		try {
			birth = new SimpleDateFormat("yyyy/MM/dd").parse(pv.getBir());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Person p = pv.getPerson();
		p.setBirthday(birth);
		try {
			flag = ps.updatePer(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) {
			try {
				request.getSession().setAttribute("user", us.findById(user.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
}
