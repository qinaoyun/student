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

import cn.jit.edu.entity.User;
import cn.jit.edu.entity.WorkNotice;
import cn.jit.edu.entity.WorkSubmit;

@Controller
public class WorkSubmitController{

	@Autowired
	private EntityDao entityDao;

		@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST)
		public String file(@RequestParam(value = "file", required = false) MultipartFile file,
				HttpServletRequest request) {
			System.out.println("upload开始");
			if (!file.isEmpty()) {
				User user = (User)request.getSession().getAttribute("frontnumber");
				String Path=user.getSno().substring(0,2);
				String path = request.getSession().getServletContext().getRealPath(Path+"级");
				String fileName1 = file.getOriginalFilename();
				String fileName = user.getSno()+user.getSname() + fileName1;
				 String wnoticeid=request.getParameter("wsworkid");  
				 WorkSubmit  wsubmit=new WorkSubmit();
				 List<Object>  worknotice=entityDao.createQuery("from worknotice where ID='"+wnoticeid+"'");
				 List<Object>  worksubmit1=entityDao.createQuery("from worksubmit where wsworkid='"+wnoticeid+"'"+"and wsno='"+ user.getSno()+ "'");
				 
				 if(worksubmit1.isEmpty())
				 {
				 for(int a=0;a<worknotice.size();a++){
					  WorkNotice wnotice=(WorkNotice)worknotice.get(a);
					  wsubmit.setWsname(wnotice.getWname());
					  wsubmit.setWscoursenum(wnotice.getWcoursenum());
				  }
				  wsubmit.setWsno(user.getSno());
				  wsubmit.setWssname(user.getSname());
				  wsubmit.setWsclass(user.getSclass());
				  wsubmit.setWscollege(user.getScollege());
				  wsubmit.setWsuploaddate(new Date());
				  wsubmit.setWsmodifydate(new Date());
				  wsubmit.setWsworkid(Integer.parseInt(wnoticeid.trim()));
				 //user.setSheadimg("/headimg/"+fileName);
				  wsubmit.setWsfilepath(fileName);
				  
					System.out.println(wsubmit.getWsclass());
					System.out.println(wsubmit.getWscollege());
					System.out.println(wsubmit.getWscoursenum());
					System.out.println(wsubmit.getWsfilepath());
					System.out.println(wsubmit.getWsname());
					System.out.println(wsubmit.getWsno());
					System.out.println(wsubmit.getWsworkid());
					System.out.println(wsubmit.getWsmodifydate());
					System.out.println(wsubmit.getWsuploaddate());

				    entityDao.save(wsubmit);
				 }
				 else
				 {  SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//这边改变格式
				   Date d = new Date();
				   String ss = s.format(d);
				   String hql = "update worksubmit set wsuploaddate='"+ss+"',wsmodifydate='"+ss+"' where wsworkid='"+wnoticeid+"'";
//						System.out.println(hql);
						System.out.println(ss);
						entityDao.update(hql);
				 }
				  
				System.out.println(path);
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				// 保存
				try {
					file.transferTo(targetFile);
//					user.setSheadimg("upload//" + fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return "front/filesuccess";
		
	}

}
