package cn.jit.edu.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
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
public class WorkAdminController {

	@Autowired
	private EntityDao entityDao;
	
	//列出用户表的所有数据	
	@RequestMapping("/listwork.do")	      
		  public @ResponseBody   JsonLists1 list(HttpServletRequest req) {
			  System.out.println("coming .........!");
			  User user = (User)req.getSession().getAttribute("user");
			  String page=req.getParameter("page");
			  String rows=req.getParameter("rows");
			  System.out.println("coming .........!"+page+"  "+rows);
			  String flag=req.getParameter("T");
			  JsonLists1  jobj=new JsonLists1();
			  List<Object> objlist=null;
			  List<Object>  count=null;
			  if(flag.equals("worknotice")){
				  objlist=entityDao.findPage("from worknotice where wclass='" +user.getSclass()+ "'order by wmodifydate desc", page, rows);  			 
				  count=entityDao.createQuery("from worknotice where wclass='" +user.getSclass()+ "'");
			  }else if(flag.equals("worksubmit")){
				  objlist=entityDao.findPage("from worksubmit  where wsclass='" +user.getSclass()+ "'order by wsmodifydate desc", page, rows);  				  
				  count=entityDao.createQuery("from worksubmit where wsclass='" +user.getSclass()+ "'");
			  }
			  else if(flag.equals("tasknotice")){
				  objlist=entityDao.findPage("from tasknotice where tclass='" +user.getSclass()+ "'order by tmodifydate desc", page, rows);  				  
				  count=entityDao.createQuery("from tasknotice where tclass='" +user.getSclass()+ "'");
			  }
			  else{
				  objlist=entityDao.findPage("from taskcomplete where tcclass='" +user.getSclass()+ "'order by tccompletedate desc", page, rows);  	
				  count=entityDao.createQuery("from taskcomplete where tcclass='" +user.getSclass()+ "'");
			  }
			  
			   jobj.setTotal(count.size());
			   jobj.setRows(objlist);
			   
			  return jobj;
			  
		  }
	
	@RequestMapping("/viewwork.do")
	@ResponseBody
	List<Object> list(HttpServletRequest req,HttpServletResponse response){
//		PrintWriter out = response.getWriter();
//		  List<Object>  list=null;
		  String id=req.getParameter("id");
		  String flag=req.getParameter("S");
		  List<Object> objlist=null;
		  
		  if(flag.equals("worknotice")){
			  objlist=entityDao.createQuery("from worknotice where ID='"+id+"'");
			  return objlist;
		  }
		  else if(flag.equals("worksubmit")){
			  objlist=entityDao.createQuery("from worksubmit where ID='"+id+"'");
			 return objlist;
		  }
		  else if(flag.equals("tasknotice")){
			  objlist=entityDao.createQuery("from tasknotice where ID='"+id+"'");
			 return objlist;
		  }	  
		  else {
			  objlist=entityDao.createQuery("from taskcomplete where ID='"+id+"'");
			 return objlist;
		  }
	}
	
	@RequestMapping(value = "/workdelete.do", method = RequestMethod.GET)
	  public String deleteObj(HttpServletRequest req,HttpServletResponse response) throws IOException {
//		System.out.println("asdfasdfasdfasdf");
		 PrintWriter out = response.getWriter();
		  String id=req.getParameter("id");
		  String flag=req.getParameter("F");
		  System.out.println("the flag is:-----------"+flag);
		  
		  if(flag.equals("worknotice")){
			  try{
				  entityDao.delete("delete from worknotice where ID="+id+"");
			  }catch(Exception e){
				  out.print("no");
			  }			  
//			  model.addAttribute("flag", "teacher");
		  }else if(flag.equals("worksubmit")){
			  try{
				  entityDao.delete("delete from worksubmit where ID="+id+"");
			  }catch(Exception e){
				  out.print("no");
			  }			  	 
		  }
		  else if(flag.equals("tasknotice")){
			  try{
				  entityDao.delete("delete from tasknotice where ID="+id+"");
			  }catch(Exception e){
				  out.print("no");
			  }			  
		  }
		  else {
			  try{
				  entityDao.delete("delete from taskcomplete where ID="+id+"");
			  }catch(Exception e){
				  out.print("no");
			  }			  
		  }
		  
		  out.print("yes");
		  return null;
		  
	  }	

	
	@RequestMapping("/tealistwork.do")	      
	  public @ResponseBody   JsonLists1 teacheck(HttpServletRequest req) {
		  System.out.println("coming .........!");
		  Teacher teacher = (Teacher)req.getSession().getAttribute("teacher");
		  String page=req.getParameter("page");
		  String rows=req.getParameter("rows");
		  String wsclass=req.getParameter("wsclass");
		  System.out.println(URLDecoder.decode(wsclass)+"999999");
		  String wscoursenum=req.getParameter("wscoursenum");
		  System.out.println(URLDecoder.decode(wsclass)+"88888888"+wscoursenum);
		  String flag=req.getParameter("T");
		  JsonLists1  jobj=new JsonLists1();
		  List<Object> objlist=null;
		  List<Object>  count=null;
		  if(flag.equals("worknotice")){
			  objlist=entityDao.findPage("from worknotice where wcourseteacher='" +teacher.getTeaname()+ "'order by wmodifydate desc", page, rows);  			 
			  count=entityDao.createQuery("from worknotice where wcourseteacher='" +teacher.getTeaname()+ "'");
		  }else if(flag.equals("worksubmit")){
			  objlist=entityDao.findPage("from worksubmit  where wsclass='" +URLDecoder.decode(wsclass)+ "'and wscoursenum='"+ wscoursenum+ "'order by wsmodifydate desc", page, rows);  				  
			  count=entityDao.createQuery("from worksubmit where wsclass='" +URLDecoder.decode(wsclass)+ "'and wscoursenum='"+ wscoursenum+ "'");
		  }
		  else if(flag.equals("tasknotice")){
			  objlist=entityDao.findPage("from tasknotice where tcourseteacher='" +teacher.getTeaname()+ "'order by tmodifydate desc", page, rows);  				  
			  count=entityDao.createQuery("from tasknotice where  tcourseteacher='" +teacher.getTeaname()+ "'");
		  }
		  else{
			  objlist=entityDao.findPage("from taskcomplete where tcclass='" +URLDecoder.decode(wsclass)+ "'and tccoursenum='"+ wscoursenum+ "'order by tccompletedate desc", page, rows);  	
			  count=entityDao.createQuery("from taskcomplete where tcclass='" +URLDecoder.decode(wsclass)+ "'and tccoursenum='"+ wscoursenum+ "'");
		  }
		  
		   jobj.setTotal(count.size());
		   jobj.setRows(objlist);
		   
		  return jobj;
		  
	  }
	
	@RequestMapping("/tealistwork1.do")	      
	  public @ResponseBody   JsonLists1 teacheck1(HttpServletRequest req) {
		  System.out.println("coming .........!");
		  Teacher teacher = (Teacher)req.getSession().getAttribute("teacher");
		  String page=req.getParameter("page");
		  String rows=req.getParameter("rows");
		  String flag=req.getParameter("T");
		  JsonLists1  jobj=new JsonLists1();
		  List<Object> objlist=null;
		  List<Object>  count=null;
		  if(flag.equals("worknotice")){
			  objlist=entityDao.findPage("from worknotice where wcourseteacher='" +teacher.getTeaname()+ "'order by wmodifydate desc", page, rows);  			 
			  count=entityDao.createQuery("from worknotice where wcourseteacher='" +teacher.getTeaname()+ "'");
		  }
		  else {
			  objlist=entityDao.findPage("from tasknotice where tcourseteacher='" +teacher.getTeaname()+ "'order by tmodifydate desc", page, rows);  				  
			  count=entityDao.createQuery("from tasknotice where  tcourseteacher='" +teacher.getTeaname()+ "'");
		  }
		  
		   jobj.setTotal(count.size());
		   jobj.setRows(objlist);
		   
		  return jobj;
		  
	  }
	
	

class  JsonLists1
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
}
