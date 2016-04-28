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

@Controller
public class UserAdminController {

	@Autowired
	private EntityDao entityDao;
	
	@RequestMapping(value="/adminlogin.do",method = RequestMethod.POST)
	  public String testLogin(@RequestParam(value="sno")String sno, String spasswd, HttpServletRequest request,ModelMap model) 
			  throws NoSuchAlgorithmException{
		 //md5加密
		System.out.println(sno);
		  MessageDigest md = MessageDigest.getInstance("MD5");  
        md.update(spasswd.getBytes());//update处理  
        byte [] encryContext = md.digest();//调用该方法完成计算  

        int i;  
        StringBuffer buf = new StringBuffer("");  
        for (int offset = 0; offset < encryContext.length; offset++) {//做相应的转化（十六进制）  
            i = encryContext[offset];  
            if (i < 0) i += 256;  
            if (i < 16) buf.append("0");  
            buf.append(Integer.toHexString(i));  
       } 
        //---
        System.out.println(buf);
		  List<Object>  objlist1=entityDao.createQuery("from user");
		  for(int j=0;j<objlist1.size();j++){
				User cus=(User)objlist1.get(j);
				//System.out.println(cus.getPassword());
				System.out.println(cus.getSno());
				System.out.println(sno);
				if(Integer.parseInt(cus.getStatus()) == 0){
					return "error";
				}
				if(cus.getSno().equals(sno) &&buf.toString().equals(cus.getSpasswd())){
					//context.getSession().put("user", username);
					request.getSession().setAttribute("user", cus);
//					model.addAttribute("username", sno);
					return "admin/Main";
				}
		  }
	        return "error";
	    }
	
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
				  objlist=entityDao.findPage("from user where status='0' order by smodifydate desc", page, rows);  
				  for(int j=0;j<objlist.size();j++){
						User cus=(User)objlist.get(j);
						switch(Integer.parseInt(cus.getStatus())){
						case 0:
							cus.setStatus("普通学生");
							break;		
					}						
				  }
				  count=entityDao.createQuery("from user where status='0'");
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
		
		@RequestMapping(value = "/addteacher.do", method = RequestMethod.POST)
		public String add(HttpServletRequest request,HttpServletResponse response,Teacher tea) throws IOException, NoSuchAlgorithmException {
			PrintWriter out = response.getWriter();
			tea.setTeano(request.getParameter("teano"));
			tea.setTeaname(request.getParameter("teaname"));
			String password = request.getParameter("passwd");
			tea.setTeaemail(request.getParameter("teaemail"));
			tea.setTeacontact(request.getParameter("teacontact"));
			tea.setTeacollege(request.getParameter("teacollege"));
			
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
		@RequestMapping("/stuupdate.do")
		  public String stuupdate(HttpServletRequest req,User user,ModelMap model){
			  System.out.println("upload234234");
			  System.out.println("开始"); 
			  int ID=user.getID();
			  String flag=req.getParameter("F");
			  String sname=user.getSname();
			  String sno=user.getSno();
			  String status=user.getStatus();
			  String semail=user.getSemail();
			  String scontact=user.getScontact();
			  String scollege=user.getScollege();
			  String sclass=user.getSclass();
			  String sdesc=user.getSdesc(); 
				  
				  entityDao.update("update user set sname='"+sname+"',sno='"+sno+"',status='"+status+"',semail='"+semail+
						  "',scontact='"+scontact+"',scollege='"+scollege+"',sclass='"+sclass+"',"
						  		+ "sdesc='"+sdesc+"' where ID='"+ID+"'");
			  if(flag.equals("committee")){
				  model.addAttribute("flag", "committee");
			  }else{
				  model.addAttribute("flag", "stu");  
			  }
			  return "admin/success";		  
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