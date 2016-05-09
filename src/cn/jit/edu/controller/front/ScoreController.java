package cn.jit.edu.controller.front;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.jit.edu.dao.EntityDao;

import cn.jit.edu.entity.MessageLy;
import cn.jit.edu.entity.User;
import cn.jit.edu.entity.WorkNotice;

@Controller
public class ScoreController {
  //主界面查询分数
	@Autowired
	private EntityDao entityDao;
	@RequestMapping(value = "/queryscore.do")
	@ResponseBody
 	List<Object> queryscore(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object> worksubmit = entityDao.createQuery("from worksubmit where wsscore !=null and wsno='" + user.getSno()+ "'");
	return worksubmit;
}     
	//作业分析图查询所有作业
	@RequestMapping(value = "/querywsname.do")
	public String querywsname(HttpServletRequest request, ModelMap model) {
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object>  wsname=entityDao.createQuery("select distinct wsname from worksubmit where wsno='" + user.getSno()+ "'");
		model.addAttribute("obj", wsname);
		return "front/score";
}
	//作业分析界面查询分数
	@RequestMapping(value = "/querysscore.do")
	@ResponseBody
 	List<Object> querysscore(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
	String wscorename= request.getParameter("wscorename");
	User user = (User)request.getSession().getAttribute("frontnumber");
	List<Object> wsubmit = entityDao.createQuery("from worksubmit where wsscore !=null and wsname='" + wscorename+ "'"+"and wsno='"+ user.getSno()+ "'");
	return wsubmit;
}     
	 
}
