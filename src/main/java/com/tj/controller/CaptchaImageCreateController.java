package com.tj.controller;
import java.awt.image.BufferedImage;  

import javax.imageio.ImageIO;  
import javax.servlet.ServletOutputStream;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;  
  
import com.google.code.kaptcha.Constants;  
import com.google.code.kaptcha.Producer;

@Controller
public class CaptchaImageCreateController {
	
	@Autowired
	private Producer captchaProducer;


	@RequestMapping(value = "/kaptcha")
	public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

        response.setDateHeader("Expires", 0);  
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
        response.setHeader("Pragma", "no-cache");  
        response.setContentType("image/jpeg"); 

        String capText = captchaProducer.createText();  
        request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        BufferedImage bi = captchaProducer.createImage(capText);  
        ServletOutputStream out = response.getOutputStream();  
        ImageIO.write(bi, "jpg", out);  

        try {  
            out.flush();  
        } catch (Exception e) {
            e.printStackTrace();
        } finally {  
            try {
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }  
        }  
	}
}
