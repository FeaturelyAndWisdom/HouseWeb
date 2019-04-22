package com.tj.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.tj.po.ServiceType;
import com.tj.po.User;
import com.tj.po.UserVo;
import com.tj.service.IServiceTypeServiceImpl;

@Controller
public class ServiceController {
	
	@Resource(name="ServiceTypeService")
	private IServiceTypeServiceImpl sts;
	
	@RequestMapping(value = "/serviceInit")
	public String serviceInit(HttpServletRequest request, HttpServletResponse response) {
		List<ServiceType> stplst = null;
		try {
			stplst = sts.getServiceTypeAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("stplst", stplst);
		return "front/sellerSys/add_house";
	}
}
