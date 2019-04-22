package com.tj.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.google.code.kaptcha.Constants;
import com.tj.po.City;
import com.tj.po.House;
import com.tj.po.HouseVo;
import com.tj.po.Province;
import com.tj.po.User;
import com.tj.po.UserVo;
import com.tj.service.ICommentService;
import com.tj.service.IHouseService;
import com.tj.service.IProvService;
import com.tj.service.IUserService;

@Controller
public class HouseController {
	
	@Resource(name="HouseServiceImpl")
	private IHouseService hs;
	
	@Resource(name="UserService")
	private IUserService us;
	
	@Resource(name="CommentServiceImpl")
	private ICommentService cs;
	
	@Resource(name="ProvImpl")
	private IProvService ps;
	
	@RequestMapping(value = "/savehouse", method = RequestMethod.POST)
	@ResponseBody
	public String savehouse(HttpServletRequest request, HttpServletResponse response,@RequestBody HouseVo hv) {
		House house = hv.getHouse();
		User user = (User) request.getSession().getAttribute("user");
		house.setSenddate(new Date());
		house.setUid(user.getUid());
		boolean flag = false;
		try {
			house = hs.save(house);
			hv.setHouse(house);
			if(house.getHid()!=0){
				if(!hv.getExtracosts().isEmpty()){
					for (Integer ec : hv.getExtracosts()) {
						hv.setTempcost(ec);
						hs.saveExtcostInfo(hv);
					}
				}
				if(!hv.getNotices().isEmpty()){
					for (Integer ln : hv.getNotices()) {
						hv.setTempnotice(ln);
						hs.saveLivenoticeInfo(hv);
					}
				}
				if(!hv.getSitems().isEmpty()){
					for (Integer si : hv.getSitems()) {
						hv.setTempitem(si);
						hs.saveServItemInfo(hv);
					}
				}
				if(hv.getPhotos().length>0){
					for (String path : hv.getPhotos()) {
						hv.setFilename(path);
						hs.saveFileInfo(hv);
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(house.getHid()!=0){
			try {
				request.getSession().setAttribute("user", us.findById(user.getUid()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping(value = "/uploadimg", method = RequestMethod.POST)
	@ResponseBody
	public String uploadimg(HttpServletRequest request, HttpServletResponse response,@RequestParam("files") MultipartFile[] files) {
		String path = request.getSession().getServletContext().getRealPath("/houseImg");
		if(files!=null&&files.length>0){
			for(int i = 0;i<files.length;i++){  
	            MultipartFile file = files[i];  
	            //�����ļ�  
	            saveFile(file, path); 
			}
		}
		
		return "success";
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
	
	@RequestMapping(value = "/gethousebycity")
	public String gethousebycity(HttpServletRequest request, HttpServletResponse response,@RequestParam("nowpage") int nowpage, @RequestParam("cityid") int cityid){
		List<House> hlst = null;
		City city = null;
		try {
			hlst = hs.getHouseByCity(nowpage,9,cityid);
			city = hs.findCityById(cityid);
			for (House house : hlst) {
				house.setCommlst(cs.findCommsByHid(house.getHid()));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageInfo<House> pageinfo = new PageInfo<House>(hlst);
		request.setAttribute("houselst", pageinfo);
		request.setAttribute("city", city);
		return "front/listHouse";
	}
	
	@RequestMapping(value = "/findHouseById")
	public String findHouseById(HttpServletRequest request, HttpServletResponse response,@RequestParam("hid") int hid, @RequestParam("gopage") int gopage){
		House house = null;
		User u = (User)request.getSession().getAttribute("user");
		try {
			house = hs.findHouseById(hid);
			house.setCommlst(cs.findCommsByHid(hid));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("house", house);
		if(gopage==1) {
			int flag = 0;
			if(u!=null){
				List<Integer> lst = null;
				try {
					lst = us.findFavsByUid(u.getUid());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(lst.contains(hid)){
					flag = 1;
				}
			}
			request.setAttribute("flag", flag);
			return "front/houseShow";
		}
		if(u==null) return "redirect:front/login.jsp";
		return "front/order";
	}
	
	@RequestMapping(value = "/admin/findHouseByIdJson")
	@ResponseBody
	public House findHouseByIdJson(HttpServletRequest request, HttpServletResponse response,@RequestParam("hid") int hid){
		House house = null;
		try {
			house = hs.findHouseById(hid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return house;
	}
	
	@RequestMapping(value = "/admin/findAllHouse")
	public String findAllHouse(HttpServletRequest request, HttpServletResponse response){
		List<House> hlst = null;
		try {
			hlst = hs.findAllHouse();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("houselst", hlst);
		return "admin/house_manage";
	}
	
	@RequestMapping(value = "/admin/operhouse")
	@ResponseBody
	public String operhouse(HttpServletRequest request, HttpServletResponse response,@RequestParam("hid") int hid,@RequestParam("type") int type){
		boolean flag = false;
		try {
			if(type==0){
				flag = hs.passHouse(hid);
			}else if(type==1){
				flag = hs.downHouse(hid);
			}else if(type==2){
				flag = hs.upHouse(hid);
			}else if(type==-1){
				flag = hs.nopassHouse(hid);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag) return "success";
		return "fail";
	}
	
	@RequestMapping(value = "/findHousesByuid")
	public String findHousesByuid(HttpServletRequest request, HttpServletResponse response,@RequestParam("uid") int uid){
		List<House> hlst = null;
		try {
			hlst = hs.getHouseByUid(uid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("houselst", hlst);
		return "front/sellerSys/seller_homeMan";
	}
	
	@RequestMapping(value="/findArroundHouse")
	@ResponseBody
	public List<House> findArroundHouse(HttpServletRequest request, HttpServletResponse response,@RequestParam("lng") double lng,@RequestParam("lat") double lat,@RequestParam("size") int size){
		List<House> houselst = null;
		double mile = 0.009159;
		try {
			houselst = hs.findArround(lng, lat, size*mile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return houselst;
	}
	
	@RequestMapping(value = "/indexsearch")
	public String indexsearch(HttpServletRequest request, HttpServletResponse response,@RequestParam("nowpage") int nowpage, @RequestParam("cityid") int cityid,@RequestParam("peonum") int peonum){
		List<House> hlst = null;
		City city = null;
		List<Province> plst = null;
		try {
			hlst = hs.getHouseByCity(nowpage,9,cityid);
			city = hs.findCityById(cityid);
			plst = ps.getProvAll();
			for (House house : hlst) {
				house.setCommlst(cs.findCommsByHid(house.getHid()));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageInfo<House> pageinfo = new PageInfo<House>(hlst);
		request.setAttribute("houselst", pageinfo);
		request.setAttribute("city", city);
		request.setAttribute("peonum", peonum);
		request.setAttribute("provlst", plst);
		return "front/listHouse";
	}
}
