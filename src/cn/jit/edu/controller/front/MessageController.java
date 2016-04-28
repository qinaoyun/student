package cn.jit.edu.controller.front;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.jit.edu.dao.EntityDao;

import cn.jit.edu.entity.MessageLy;
import cn.jit.edu.entity.User;
import cn.jit.edu.entity.WorkNotice;

@Controller
public class MessageController {

	@Autowired
	private EntityDao entityDao;

	@RequestMapping(value = "/messagely.do", method = RequestMethod.POST)
	public String worknotice(ModelMap model,HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("frontnumber");
	   String content = request.getParameter("message");
	   String wnoticeid=request.getParameter("wsworkid");  
		MessageLy messageLy = new MessageLy();
	   messageLy.setMdate(new Date());
	   messageLy.setMcontent(content);
	   messageLy.setMname(user.getSname());
	   messageLy.setMsworkid(Integer.parseInt(wnoticeid.trim()));
	   
	   
//	   System.out.println(messageLy.getMcontent());
//	   System.out.println(messageLy.getMname());
//	   System.out.println(messageLy.getClass());
//	   System.out.println(messageLy.getMdate());
	   
		entityDao.save(messageLy);
		model.addAttribute("wnoticeid", wnoticeid);
		return "front/loading1";
	}

}
