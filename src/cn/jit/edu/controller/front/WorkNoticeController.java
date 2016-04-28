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
public class WorkNoticeController {

	@Autowired	private EntityDao entityDao;
    //作业信息的发布
	@RequestMapping(value = "/worknotice.do", method = RequestMethod.POST)
	public String worknotice(WorkNotice workNotice,ModelMap model,HttpServletRequest request) {
		workNotice.setWmodifydate(new Date());
		User user = (User)request.getSession().getAttribute("frontnumber");
		workNotice.setWreleasedate(new Date());
		workNotice.setWclass(user.getSclass());
		workNotice.setWcollege(user.getScollege());
		workNotice.setWreleasesno(user.getSno());
		workNotice.setWreleasename(user.getSname());
		entityDao.save(workNotice);
		return "front/loading";

	}
	//作业信息的删除
	@RequestMapping(value = "/worknoticedelete.do")
	public String worknoticedelete(ModelMap model,HttpServletRequest request) {
		String wnoticeid = request.getParameter("worknoticeid");
		List<Object> msg = entityDao.createQuery("from messagely where msworkid='" + wnoticeid + "'"); 
		for(int a=0;a<msg.size();a++){
			  MessageLy mmsg=(MessageLy)msg.get(a);
			  entityDao.delete("delete from replayly  where messageid ="+mmsg.getID()+"");
		  }
		entityDao.delete("delete from worknotice where ID="+wnoticeid+"");
		entityDao.delete("delete from messagely  where msworkid ="+wnoticeid+"");
		List<Object>  list=entityDao.createQuery("from worknotice");
		model.addAttribute("obj", list);
		
		return "front/main";
	}
	//作业信息的修改	
	@RequestMapping(value = "/worknoticemodify.do", method = RequestMethod.POST)
	public String worknoticeModify(WorkNotice workNotice,ModelMap model,HttpServletRequest request) {
		String wnoticeid=request.getParameter("wsworkid");
		System.out.println(wnoticeid);
		User user = (User)request.getSession().getAttribute("frontnumber");
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//这边改变格式
	    Date d = new Date();
		String ss = s.format(d);
		String wcoursenum = request.getParameter("wcoursenum");
		String wtotalnum = request.getParameter("wtotalnum");
		String wname = request.getParameter("wname");
		String wcoursename = request.getParameter("wcoursename");
		String wcoursedesc = request.getParameter("wcoursedesc");
		String wcourseteacher = request.getParameter("wcourseteacher");
		String wuploaddate = request.getParameter("wuploaddate");
		String hql = "update worknotice  set wname='"+wname+"',wcoursename='"+wcoursename+"',wcoursedesc='"+wcoursedesc+"' ,wcoursenum='"+wcoursenum+"',wtotalnum='"+wtotalnum+"',wmodifydate='"+ss+"',wcourseteacher='"+wcourseteacher+"',wreleasesno='"+user.getSno()+"',wreleasename='"+user.getSclass()+"',wreleasename='"+user.getSname()+"',wuploaddate='"+wuploaddate+"'where ID='"+wnoticeid+"'";
		System.out.println(hql);
		
		entityDao.update(hql);
		return "front/loading";
	}
		
}

