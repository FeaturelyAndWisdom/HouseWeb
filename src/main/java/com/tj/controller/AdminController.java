package com.tj.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.tj.po.Admin;
import com.tj.po.AdminVo;
import com.tj.po.Message;
import com.tj.po.User;
import com.tj.service.IAdminService;
import com.tj.service.IUserService;

@Controller
public class AdminController {
	
	@Resource(name="AdminServiceImpl")
	private IAdminService as;
	
	@Resource(name="UserService")
	private IUserService us;
	
	@RequestMapping(value="/adminlogin",method=RequestMethod.POST)
	@ResponseBody
	public String adminlogin(HttpServletRequest request, HttpServletResponse response, @RequestBody AdminVo av){
		if(!av.getValicode().equals(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY))) return "code error";
		Admin a = null;
		try {
			a = as.login(av.getAdmin());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(a==null) return "fail";
		request.getSession().setAttribute("admin", a);
		return "success";
	}
	
	@RequestMapping(value="/admin/addadmin",method=RequestMethod.POST)
	@ResponseBody
	public String addadmin(HttpServletRequest request, HttpServletResponse response, @RequestBody Admin admin){
		boolean flag = false;
		admin.setCreatedate(new Date());
		try {
			flag = as.add(admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
	
	@RequestMapping(value="/admin/changepwd",method=RequestMethod.POST)
	@ResponseBody
	public String changepwd(HttpServletRequest request, HttpServletResponse response, @RequestBody AdminVo av){
		boolean flag = false;
		Admin temp = null;
		try {
			temp = as.findByAid(av.getAdmin().getAid());
			if(!av.getOldpwd().equals(temp.getPwd())) return "oldpwd error";
			flag = as.changePwd(av.getAdmin());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
	
	@RequestMapping(value="/admin/sendmes",method=RequestMethod.POST)
	@ResponseBody
	public String sendmes(HttpServletRequest request, HttpServletResponse response, @RequestBody Message mes){
		boolean flag = false;
		try {
			User user = us.findById(mes.getUid());
			if(user==null) return "usernull";
			mes.setSenddate(new Date());
			flag = as.sendMes(mes);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
}
