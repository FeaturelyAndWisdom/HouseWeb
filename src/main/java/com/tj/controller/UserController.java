package com.tj.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;

import com.google.code.kaptcha.Constants;
import com.tj.po.City;
import com.tj.po.Favorite;
import com.tj.po.House;
import com.tj.po.Person;
import com.tj.po.Province;
import com.tj.po.User;
import com.tj.po.UserVo;
import com.tj.service.*;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource(name="UserService")
	private IUserService us;
	
	@Resource(name="ProvImpl")
	private IProvService ps;
	
	@RequestMapping(value = "/userlogin", method = RequestMethod.POST)
	@ResponseBody
	public String userLogin(HttpServletRequest request, HttpServletResponse response, @RequestBody UserVo u) {
		if(!u.getCode().equals(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY))) return "code error";
		User user = null;
		try {
			user = us.login(u.getUser());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(user==null) return "fail";
		if(user.getIsdel()==1) return "userban";
		request.getSession().setAttribute("user", user);
		return "success";
	}
	
	@RequestMapping(value = "/userlogout")
	public String userLogin(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("user");
		return "front/index";
	}
	
	@RequestMapping(value = "/userreg", method = RequestMethod.POST)
	@ResponseBody
	public String userRegist(HttpServletRequest request, HttpServletResponse response, @RequestBody UserVo u){
		boolean emailflag = true;
		try {
			emailflag = us.vildEmail(u.getUser().getEmail());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!emailflag) return "email repeat";
		boolean flag = false;
		try {
			flag = us.register(u.getUser());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!u.getCode().equals(request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY))) return "code error";
		if(flag) return "success";
		return "fail";
	}
	
	@RequestMapping(value = "/changeuname", method = RequestMethod.POST)
	@ResponseBody
	public String changeUname(HttpServletRequest request, HttpServletResponse response, @RequestBody User u){
		User user = (User) request.getSession().getAttribute("user");
		if(!user.getPwd().equals(u.getPwd())) return "pwd error";
		boolean flag=false;
		try {
			flag = us.changeUname(u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			try {
				request.getSession().setAttribute("user", us.findById(u.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/changeemail", method = RequestMethod.POST)
	@ResponseBody
	public String changeEmail(HttpServletRequest request, HttpServletResponse response, @RequestBody User u){
		User user = (User) request.getSession().getAttribute("user");
		if(!user.getPwd().equals(u.getPwd())) return "pwd error";
		boolean flag = false;
		try {
			flag = us.changeEmail(u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			try {
				request.getSession().setAttribute("user", us.findById(u.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	@ResponseBody
	public String updateInfo(HttpServletRequest request, HttpServletResponse response,@RequestBody UserVo uv){
		boolean flag = false;
		User u = uv.getUser();
		Date bir = null;
		try {
			bir = new SimpleDateFormat("yyyy-MM-dd").parse(uv.getYear()+"-"+uv.getMonth()+"-"+uv.getDay());
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			bir = new Date();
			e1.printStackTrace();
		}
		u.setBirthday(bir); 
		try {
			flag = us.updateInfo(u);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			try {
				request.getSession().setAttribute("user", us.findById(u.getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/provInit")
	@ResponseBody
	public List<Province> initProv(HttpServletRequest request, HttpServletResponse response){
		List<Province> plst = null;
		try {
			plst = ps.getProvAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return plst;
	}
	
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	@ResponseBody
	public String changePwd(HttpServletRequest request, HttpServletResponse response, @RequestBody UserVo uv){
		User user = (User) request.getSession().getAttribute("user");
		if(!user.getPwd().equals(uv.getOldpwd())) return "oldpwd error";
		boolean flag = false;
		try {
			flag = us.changePwd(uv.getUser());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			try {
				request.getSession().setAttribute("user", us.findById(uv.getUser().getUid()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/readmes")
	public String readmes(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid, @RequestParam("type") int type){
		boolean flag = false;
		try {
			flag = us.readMes(uid,type);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			try {
				request.getSession().setAttribute("user", us.findById(uid));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(type==0){
			return "front/userInfo/userinf_mess";
		}
		return "front/sellerSys/seller_message";
	}
	
	@RequestMapping(value = "/changeIcon", method = RequestMethod.POST)
	@ResponseBody
	public String changeIcon(HttpServletRequest request, HttpServletResponse response,@RequestParam("uicon") MultipartFile file) {
		String path = request.getSession().getServletContext().getRealPath("/userIcon");
		User user = (User) request.getSession().getAttribute("user");
		user.setUimg(file.getOriginalFilename());
	    boolean flag = false;
	    
		try {
			flag = us.changeIcon(user);
			if(flag){
				flag = saveFile(file,path);
				if(flag){
					request.getSession().setAttribute("user", us.findById(user.getUid()));
					return "success";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "fail";
	}
	
	private boolean saveFile(MultipartFile file, String path) {  
        // �ж��ļ��Ƿ�Ϊ��  
        if (!file.isEmpty()) {  
            try {  
                File filepath = new File(path);
                if (!filepath.exists()) 
                    filepath.mkdirs();
                // �ļ�����·��  
                String savePath = path +"\\"+ file.getOriginalFilename();  
                // ת���ļ�  
                file.transferTo(new File(savePath));  
                return true;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        return false;  
    }
	
	@RequestMapping(value="/admin/findAllUsers",method=RequestMethod.GET)
	public String findAllUsers(HttpServletRequest request, HttpServletResponse response){
		List<User> userlst = null;
		try {
			userlst = us.findAllUsers();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("userlst", userlst);
		return "admin/user_manage";
	}
	
	@RequestMapping(value="/admin/operuser",method=RequestMethod.GET)
	@ResponseBody
	public String operuser(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid, @RequestParam("type") int type){
		boolean flag = false;
		try {
			if(type==0){
				flag = us.banuser(uid);
			}else if(type==1){
				flag = us.reopenuser(uid);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
	
	@RequestMapping(value="/operfav",method=RequestMethod.GET)
	@ResponseBody
	public String operfav(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid,@RequestParam("hid") int hid, @RequestParam("type") int type){
		boolean flag = false;
		User u = (User)request.getSession().getAttribute("user");
		if(u==null) return "pleaselogin";
		try {
			if(type==0){
				flag = us.addFavorite(new Favorite(uid, hid));
			}else if(type==1){
				flag = us.delFavorite(new Favorite(uid, hid));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
	
	@RequestMapping(value="/findfavhouse",method=RequestMethod.GET)
	public String findfavhouse(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid){
		List<House> houselst = null;
		try {
			houselst = us.findFavsHouselist(uid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("houselst", houselst);
		return "front/userInfo/userinf_mycoll";
	}
}
