package cn.jit.edu.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

import cn.jit.edu.dao.EntityDao;
import cn.jit.edu.entity.Teacher;
import cn.jit.edu.entity.User;
import cn.jit.edu.util.MD5Util;

@Controller
public class UserAdminController {

	@Autowired
	private EntityDao entityDao;
	
	@RequestMapping(value="/adminlogin.do",method = RequestMethod.POST)
	  public String testLogin(@RequestParam(value="sno")String sno, String spasswd, HttpServletRequest request,ModelMap model) 
			  throws Exception{
		 //md5加密
		 String buf=MD5Util.md5Encode(spasswd);
		 String flag=sno.substring(0,2);
		 if(flag=="00"){
		 System.out.println(flag);
		  List<Object>  objlist1=entityDao.createQuery("from teacher");
		  for(int j=0;j<objlist1.size();j++){
				Teacher cus=(Teacher)objlist1.get(j);
				if(cus.getTeano().equals(sno) &&buf.toString().equals(cus.getTeapasswd())){
					//context.getSession().put("user", username);
					
					switch(Integer.parseInt(cus.getTeastatus())){
					case 0:
						cus.setTeastatus("普通学生");
						break;
					case 1:
						cus.setTeastatus("学委");
						break;
					case 2:
						cus.setTeastatus("班长");
						break;
					case 3:
						cus.setTeastatus("老师");
						break;
				}
					request.getSession().setAttribute("user", cus);
//					model.addAttribute("username", sno);
					if(cus.getTeastatus() == "普通学生"){
						return "error";
					   
					}
					return "admin/Main";
				}
		  }
	        return "error";
		 }
		 else {
			  List<Object>  objlist1=entityDao.createQuery("from user");
			  for(int j=0;j<objlist1.size();j++){
					User cus=(User)objlist1.get(j);
					//System.out.println(cus.getPassword());
					System.out.println(cus.getSno());
					if(cus.getSno().equals(sno) &&buf.toString().equals(cus.getSpasswd())){
						//context.getSession().put("user", username);
						
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
						request.getSession().setAttribute("user", cus);
//						model.addAttribute("username", sno);
						if(cus.getStatus() == "普通学生"){
							return "error";
						   
						}
						return "admin/Main";
					}
			  }
		        return "error";
		 }
	    }
	//注销登录
	@RequestMapping(value = "/adminlogout.do",method = RequestMethod.GET)  
    public String logout(HttpSession httpSession,HttpServletRequest request){  
        httpSession.getAttribute("username"); 
        request.getSession().setAttribute("user", null);
        return "Login";  
    }
	
	//列出用户表的所有数据	
	@RequestMapping("/list.do")
		  public @ResponseBody   JsonLists list(HttpServletRequest req) {
			  System.out.println("coming .........!");
			  User user = (User)req.getSession().getAttribute("user");
			  String page=req.getParameter("page");
			  String rows=req.getParameter("rows");
			  System.out.println("coming .........!"+page+"  "+rows);
			  String flag=req.getParameter("T");
			  System.out.println(flag);
			  JsonLists  jobj=new JsonLists();
			  List<Object> objlist=null;
			  List<Object>  count=null;
			  if(flag.equals("teacher")){
				  objlist=entityDao.findPage("from teacher order by modifydate desc", page, rows);  			 
				  count=entityDao.createQuery("from teacher");
			  }else if(flag.equals("stu")){
				  objlist=entityDao.findPage("from user where status='0' and sclass='" +user.getSclass()+ "' order by smodifydate desc", page, rows);  
				  for(int j=0;j<objlist.size();j++){
						User cus=(User)objlist.get(j);
						switch(Integer.parseInt(cus.getStatus())){
						case 0:
							cus.setStatus("普通学生");
							break;		
					}						
				  }
				  count=entityDao.createQuery("from user where status='0' and sclass='" +user.getSclass()+ "'");
			  }
			  else{
				  objlist=entityDao.findPage("from user where status='1' or status='2' order by smodifydate desc", page, rows);  
				  for(int j=0;j<objlist.size();j++){
						User cus=(User)objlist.get(j);
						switch(Integer.parseInt(cus.getStatus())){
						case 1:
							cus.setStatus("学委");
							break;
						case 2:
							cus.setStatus("班长");
							break;			
					}						
				  }
				  count=entityDao.createQuery("from user where status='1' or status='2'");
			  }
			  
			   jobj.setTotal(count.size());
			   jobj.setRows(objlist);
			   
			  return jobj;
			  
		  }
		//添加老师
		@RequestMapping(value = "/addteacher.do", method = RequestMethod.POST)
		public String add(HttpServletRequest request,HttpServletResponse response,Teacher tea) throws IOException, NoSuchAlgorithmException {
			PrintWriter out = response.getWriter();
			tea.setTeano(request.getParameter("teano"));
			tea.setTeaname(request.getParameter("teaname"));
			String password = request.getParameter("passwd");
			tea.setTeaemail(request.getParameter("teaemail"));
			tea.setTeacontact(request.getParameter("teacontact"));
			tea.setTeacollege(request.getParameter("teacollege"));
			tea.setTeastatus(Integer.toHexString(3));
			
			//md5加密
			MessageDigest md = MessageDigest.getInstance("MD5");  
	        md.update(password.getBytes());//update处理  
	        byte [] encryContext = md.digest();//调用该方法完成计算  
	
	        int i;  
	        StringBuffer buf = new StringBuffer("");  
	        for (int offset = 0; offset < encryContext.length; offset++) {//做相应的转化（十六进制）  
	            i = encryContext[offset];  
	            if (i < 0) i += 256;  
	            if (i < 16) buf.append("0");  
	            buf.append(Integer.toHexString(i));  
	        }
	        tea.setTeapasswd(buf.toString());
			tea.setModifydate(new Date());
			try{
				entityDao.save(tea);
				out.print("yes");
			}catch(Exception e){
				out.print("no");
			}			
			return null;		  
		  }
		//添加班委
		@RequestMapping(value = "/addcommittee.do", method = RequestMethod.POST)
		public String addcommittee(HttpServletRequest request,HttpServletResponse response,User user) throws IOException, NoSuchAlgorithmException {
			System.out.println("upload234234");
			PrintWriter out = response.getWriter();
			user.setSno(request.getParameter("sno"));
			user.setSname(request.getParameter("sname"));
			String password = request.getParameter("spasswd");
			System.out.println( request.getParameter("sname"));
			System.out.println(request.getParameter("sno"));
			System.out.println(request.getParameter("status"));
			user.setSemail(request.getParameter("semail"));
			user.setScontact(request.getParameter("scontact"));
			user.setScollege(request.getParameter("scollege"));
			user.setSclass(request.getParameter("sclass"));
			user.setSheadimg("/headimg/head_01.png");
			user.setStatus(request.getParameter("status"));
			user.setSsex(request.getParameter("ssex"));
			user.setSdesc(request.getParameter("sdesc"));
			//md5加密
			MessageDigest md = MessageDigest.getInstance("MD5");  
	        md.update(password.getBytes());//update处理  
	        byte [] encryContext = md.digest();//调用该方法完成计算  
	
	        int i;  
	        StringBuffer buf = new StringBuffer("");  
	        for (int offset = 0; offset < encryContext.length; offset++) {//做相应的转化（十六进制）  
	            i = encryContext[offset];  
	            if (i < 0) i += 256;  
	            if (i < 16) buf.append("0");  
	            buf.append(Integer.toHexString(i));  
	        }
	        user.setSpasswd("123456");
	        user.setSmodifydate(new Date());
			try{
				entityDao.save(user);
				out.print("yes");
			}catch(Exception e){
				out.print("no");
			}			
			return null;		  
		  }
		
		//添加学生
		@RequestMapping(value = "/addstu.do", method = RequestMethod.POST)
		public String addstu(HttpServletRequest request,HttpServletResponse response,User user) throws IOException, NoSuchAlgorithmException {
			System.out.println("upload234234");
			PrintWriter out = response.getWriter();
			user.setSno(request.getParameter("sno"));
			user.setSname(request.getParameter("sname"));
			String password = request.getParameter("spasswd");
			System.out.println( request.getParameter("sname"));
			System.out.println(request.getParameter("sno"));
			System.out.println(request.getParameter("ssex"));
			user.setSemail(request.getParameter("semail"));
			user.setScontact(request.getParameter("scontact"));
			user.setScollege(request.getParameter("scollege"));
			user.setSclass(request.getParameter("sclass"));
			user.setSheadimg("/headimg/head_01.png");
			user.setStatus(Integer.toString(0));
			user.setSsex(request.getParameter("ssex"));
			user.setSdesc(request.getParameter("sdesc"));
			//md5加密
			MessageDigest md = MessageDigest.getInstance("MD5");  
	        md.update(password.getBytes());//update处理  
	        byte [] encryContext = md.digest();//调用该方法完成计算  
	
	        int i;  
	        StringBuffer buf = new StringBuffer("");  
	        for (int offset = 0; offset < encryContext.length; offset++) {//做相应的转化（十六进制）  
	            i = encryContext[offset];  
	            if (i < 0) i += 256;  
	            if (i < 16) buf.append("0");  
	            buf.append(Integer.toHexString(i));  
	        }
	        user.setSpasswd("123456");
	        user.setSmodifydate(new Date());
			try{
				entityDao.save(user);
				out.print("yes");
			}catch(Exception e){
				out.print("no");
			}			
			return null;		  
		  }
		
		@RequestMapping("/view.do")
		@ResponseBody
		List<Object> list(HttpServletRequest req,HttpServletResponse response){
//			PrintWriter out = response.getWriter();
//			  List<Object>  list=null;
			  String id=req.getParameter("id");
			  String flag=req.getParameter("S");
			  List<Object> objlist=null;
			  
			  if(flag.equals("teacher")){
				  objlist=entityDao.createQuery("from teacher where ID='"+id+"'");
//				  model.addAttribute("obj", list);
//				  out.print("yes");
				  
				  return objlist;
			  }else{
				  objlist=entityDao.createQuery("from user where ID='"+id+"'");
//				  for(int j=0;j<list.size();j++){
//						User cus=(User)list.get(j);
//						switch(Integer.parseInt(cus.getStatus())){
//						case 0:
//							cus.setStatus("普通学生");
//							break;	
//						case 1:
//							cus.setStatus("学委");
//							break;
//						case 2:
//							cus.setStatus("班长");
//							break;	
//						}
//					}
//				  if(flag.equals("committee")){
////					  model.addAttribute("flag", "committee");
//				  }else{
////					  model.addAttribute("flag", "stu");
//				  }
				 return objlist;
			  }
//			  jobj.setTotal(count.size());
//			  jobj.setRows(objlist);
////			  model.addAttribute("obj", list);
//			  return jobj;
		}
		//修改老师
		@RequestMapping(value = "/updateteacher.do", method = RequestMethod.POST)
		public String teacherupdate(HttpServletRequest request,HttpServletResponse response) throws IOException{
			PrintWriter out = response.getWriter();
//			int id = Integer.parseInt(request.getParameter("id"));
//			System.out.println(id);
//			teacher.setID(id);
//			teacher.setTeano(request.getParameter("teano"));
//			teacher.setTeaname(request.getParameter("teaname"));
//			teacher.setTeaemail(request.getParameter("teaemail"));
//			teacher.setTeacontact(request.getParameter("teacontact"));
//			teacher.setTeacollege(request.getParameter("teacollege"));
//			teacher.setTeaheadimg(null);
//			teacher.setModifydate(new Date());
			String ID = request.getParameter("id");
			String teano = request.getParameter("teano");
			String teaname = request.getParameter("teaname");
			String password = request.getParameter("passwd");
			String teaemail = request.getParameter("teaemail");
			String teacontact = request.getParameter("teacontact");
			String teacollege = request.getParameter("teacollege");
			try{
				entityDao.update("update teacher set teaname='"+teaname+"',teano='"+teano+"',teaemail='"+teaemail+
						  "',teacontact='"+teacontact+"',teacollege='"+teacollege+"',modifydate=now() where ID='"+ID+"'");
//				entityDao.update(teacher);
				out.print("yes");
			}catch(Exception e){
				out.print("no");
			}			  
			  return null;		  
		  }
		//修改学生
		@RequestMapping(value="/stuupdate.do", method = RequestMethod.POST)
		  public String stuupdate(HttpServletRequest request,User user,ModelMap model,HttpServletResponse response) throws IOException{
			PrintWriter out = response.getWriter();
			    int  ID = Integer.valueOf(request.getParameter("id"));
				String sname = request.getParameter("sname");
				System.out.println(sname);
				String sno = request.getParameter("sno");
				String semail = request.getParameter("semail");
				String scontact = request.getParameter("scontact");
				String scollege= request.getParameter("scollege");
				String sclass = request.getParameter("sclass");
				String sdesc= request.getParameter("sdesc");
				try{
				  entityDao.update("update user set sname='"+sname+"',sno='"+sno+"',semail='"+semail+
						  "',scontact='"+scontact+"',scollege='"+scollege+"',sclass='"+sclass+"',"
						  		+ "sdesc='"+sdesc+"' where ID='"+ID+"'");
				        out.print("yes");
		}catch(Exception e){
			out.print("no");
		}			  
		  return null;		  
	  }
		@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
		  public String deleteObj(HttpServletRequest req,HttpServletResponse response) throws IOException {
//			System.out.println("asdfasdfasdfasdf");
			 PrintWriter out = response.getWriter();
			  String id=req.getParameter("id");
			  String flag=req.getParameter("F");
			  System.out.println("the flag is:-----------"+flag);
			  
			  if(flag.equals("teacher")){
				  try{
					  entityDao.delete("delete from teacher where ID="+id+"");
				  }catch(Exception e){
					  out.print("no");
				  }
				  
//				  model.addAttribute("flag", "teacher");
			  }else{
				  entityDao.delete("delete from user where ID="+id+"");
				 
			  }
			  out.print("yes");
			  return null;
			  
		  }	
		
}




class  JsonLists
{
	int total;
	List<Object>  rows;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Object> getRows() {
		return rows;
	}
	public void setRows(List<Object> rows) {
		this.rows = rows;
	}
}
