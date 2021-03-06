package cn.jit.edu.controller.front;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.jit.edu.dao.EntityDao;
import cn.jit.edu.entity.Collegeinfo;
import cn.jit.edu.entity.TaskComplete;
import cn.jit.edu.entity.TaskNotice;
import cn.jit.edu.entity.User;
import cn.jit.edu.entity.WorkNotice;
import cn.jit.edu.entity.WorkSubmit;
import cn.jit.edu.util.LogonUtils;
import cn.jit.edu.util.MD5Util;

@Controller
public class UserController {

	@Autowired
	private EntityDao entityDao;
	
	//登录
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String testLogin(@RequestParam(value = "number") String number,String password, HttpServletRequest request,HttpServletResponse response, ModelMap model)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		boolean flag = LogonUtils.checkNumber(request);
		List<Object> objlist1 = null;	
		if (!flag) {
			return "front/error";
		}
	
		
		objlist1 = entityDao.createQuery("from user");
		for (int j = 0; j < objlist1.size(); j++) {
			User cus = (User) objlist1.get(j);
			// System.out.println(cus.getPassword());
			if (cus.getSno().equals(number) && MD5Util.md5Encode(password).equals(cus.getSpasswd())) {
				// context.getSession().put("user", number);
				switch(Integer.parseInt(cus.getStatus())){
					case 0:
						cus.setStatus("普通学生");
						break;
					case 1:
						cus.setStatus("学委");
						break;
					case 2:
						cus.setStatus("班长");
						break;
					case 3:
						cus.setStatus("老师");
						break;
				}
				request.getSession().setAttribute("frontnumber", cus);
				request.getSession().setAttribute("sdesc",cus.getSdesc());
				model.addAttribute("username", cus.getSname());
				// LogonUtils.remeberMeByCookie(request,response);
				
				toMain(model,cus);
				
				return "front/main";
			}
		}

		return "front/error";
	}
	
	//退出登录

    @RequestMapping(value = "/logout.do",method = RequestMethod.GET)  
	    public String logout(HttpSession httpSession,HttpServletRequest request){  
	        httpSession.getAttribute("frontnumber"); 
	        request.getSession().setAttribute("frontnumber", null);
	        return "index";  
	    }
//   注册
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(User user) throws NoSuchAlgorithmException{
		String pwd = user.getSpasswd();
//		System.out.println(user.getSname());
		
		String college=user.getScollege();
		List<Object> collegename = entityDao.createQuery("from collegeinfo where ID='" + college + "'"); 
		for(int a=0;a< collegename.size();a++){
			Collegeinfo  mmsg=(Collegeinfo) collegename .get(a);
			  user.setScollege(mmsg.getCollegeinfo());
		  }
		user.setSpasswd(MD5Util.md5Encode(pwd));
		
		user.setSmodifydate(new Date());
		user.setSheadimg("/headimg/head_01.png");
		user.setStatus(Integer.toString(0));
		entityDao.save(user);
		return "index";
	}

	//查询学院
		@RequestMapping(value = "/querycollege.do")
		public String querycollege(HttpServletRequest request, ModelMap model) {
			List<Object>  collegelist=entityDao.createQuery("from collegeinfo");
			model.addAttribute("obj", collegelist);
			return "register";
		}
	  //根据学院查询班级
		@RequestMapping(value = "/queryclass.do")
			@ResponseBody
	     	List<Object> list(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
				String collegeid= request.getParameter("collegeid");
				List<Object> sclass = entityDao.createQuery("from classinfo where collegeID='" + collegeid+ "'");
//				PrintWriter out = response.getWriter();
//				out.print(collegeid);
				return sclass;
		}
	
	//用于修改个人信息
		@RequestMapping(value = "/personInfoModify.do", method = RequestMethod.POST)
		public String personInfoModify(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException{
			PrintWriter out = response.getWriter();
			String scontact = request.getParameter("scontact");
			String sdesc = request.getParameter("sdesc");
			String ssex = request.getParameter("ssex");
			
			
			User user = (User)request.getSession().getAttribute("frontnumber");
			List<Object> userObject = null;
			User cus = null;
			
			String hql = "update user set scontact='"+scontact+"',sdesc='"+sdesc+"',ssex='"+ssex+"' where ID='"+user.getID()+"'";
//			System.out.println(hql);
			
			entityDao.update(hql);
			
			userObject = entityDao.createQuery("from user where ID='"+user.getID()+"'");
			cus = (User)userObject.get(0);
			request.getSession().setAttribute("frontnumber", cus);//对当前session对象进行更新
			
			out.print("yes");
		
			return null;
		}
		

		
		//用于对密码的修改(需要存入数据库)
		@RequestMapping(value = "/passwordModify.do", method = RequestMethod.POST)
		public String passwordModify(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException, NoSuchAlgorithmException{
			PrintWriter out = response.getWriter();
			
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			User user = (User)request.getSession().getAttribute("frontnumber");
			
			List<Object> userObject = null;
			User cus = new User();

			userObject = entityDao.createQuery("from user where ID='"+user.getID()+"'");
			cus = (User)userObject.get(0);
			if(MD5Util.md5Encode(oldPassword).equals(cus.getSpasswd())){
//				System.out.println(newPassword);

				entityDao.update("update user set spasswd='"+MD5Util.md5Encode(newPassword)+"' where ID='"+user.getID()+"'");

				
				out.print("success");
			}else{
				out.print("error");
			}
			
			
			return null;
		}
		//用于对头像的修改
		@RequestMapping(value = "/headModify.do", method = RequestMethod.POST)
		public String headModify(@RequestParam(value = "head_upload", required = false)MultipartFile file,HttpServletRequest request,HttpServletResponse response,ModelMap model){
			User user = (User)request.getSession().getAttribute("frontnumber");

			
			if(!file.isEmpty() ){
				String path = request.getSession().getServletContext().getRealPath("headimg");  
				String fileName = user.getSno()+"headimg.png";
				
//				String prefix = fileName.substring(fileName.lastIndexOf(".")+1);
				
					File targetFile = new File(path,fileName);
			        if(!targetFile.exists()){  
			            targetFile.mkdirs();  
			        }
			        try {
						file.transferTo(targetFile);
						request.getSession().invalidate();
						user.setSheadimg("/headimg/"+fileName);
						request.getSession().setAttribute("frontnumber", user);
						entityDao.update("update user set sheadimg='/headimg/"+fileName+"' where ID="+user.getID()+"");
					} catch (IOException e) {
						return "front/error";
					}
			}
			
			
			return "front/filesuccess";
		}

		
		//从数据库拉取main界面的主要信息
		public void toMain(ModelMap model,User user){
//			User user = (User)request.getSession().getAttribute("frontnumber");
			List<Object> worklist=entityDao.createQuery("from worknotice where wclass='"+user.getSclass()+"' order by wuploaddate desc");
			model.addAttribute("obj", worklist);
			model.addAttribute("listsize",worklist.size());
			List<Object> tasklist = entityDao.createQuery("from tasknotice where tclass='"+user.getSclass()+"' order by tmodifydate desc");
			model.addAttribute("tasklist",tasklist);
//			查找离上交日期最近的四条数据  SELECT TOP 2 * FROM table_name ORDER BY datetime desc
			
			
			
			List<Object> numtasklist = new ArrayList();//用于存储每个分组已选人数的集合
			List<Object> taskeach = entityDao.createQuery("from taskcomplete");
			for(int i=0;i<tasklist.size();i++){
				int count = 0;//用于计算每一个分组的人数
				TaskNotice tasknoticeTmp = (TaskNotice)tasklist.get(i);
				
				for(int j=0;j<taskeach.size();j++){
					TaskComplete taskCompTmp = (TaskComplete)taskeach.get(j);
					if(tasknoticeTmp.getID() == taskCompTmp.getWstaskid()){
						count++;
					}
				}
				numtasklist.add(count);
			}
			
			int[] sumtasklist = new int[numtasklist.size()];
			for(int i=0;i<numtasklist.size();i++){
				sumtasklist[i] = (Integer)numtasklist.get(i);
			}
			
			
			List<Object> numworklist = new ArrayList();//用于存储每个作业已经上交人数的集合
			List<Object> workeach = entityDao.createQuery("from worksubmit");
			for(int i=0;i<worklist.size();i++){
				int count = 0;//用于计算每一个作业的上交人数
				WorkNotice worknoticeTemp = (WorkNotice)worklist.get(i);
				
				for(int j=0;j<workeach.size();j++){
					WorkSubmit workSubTmp = (WorkSubmit)workeach.get(j);
					if(worknoticeTemp.getID() == workSubTmp.getWsworkid()){
						count++;
					}
				}
				numworklist.add(count);
			}
			int[] sumworklist = new int[numworklist.size()];
			for(int i=0;i<numworklist.size();i++){
				sumworklist[i] = (Integer)numworklist.get(i);
			}
			
			model.addAttribute("sumworklist",sumworklist);
			model.addAttribute("sumtasklist",sumtasklist); 
		}
		
}
