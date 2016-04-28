package cn.jit.edu.controller.front;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.jit.edu.dao.EntityDao;
import cn.jit.edu.entity.TaskComplete;
import cn.jit.edu.entity.TaskNotice;
import cn.jit.edu.entity.User;
import cn.jit.edu.entity.WorkNotice;
import cn.jit.edu.entity.WorkSubmit;
import freemarker.template.SimpleDate;

@Controller
public class TaskNoticeController {
	
	@Autowired
	private EntityDao entityDao;
	
	//分组任务发布的后台处理
	@RequestMapping(value = "/tasknotice.do", method = RequestMethod.POST)
	public String tasknotice(HttpServletRequest request,HttpServletResponse response,TaskNotice task,ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		Date nowDate = new Date();
		int totalnum = Integer.parseInt(task.getTtotalnum());
		int groupnum = Integer.parseInt(task.getTgroupnum());
		int tmaxsize = 0;
		
		task.setTclass(user.getSclass());
		task.setTcollege(user.getScollege());
		task.setTreleasesno(user.getSno());
		task.setTreleasedate(nowDate);
		task.setTmodifydate(nowDate);
		
		if(totalnum%groupnum == 0){
			tmaxsize = totalnum/groupnum;
		}else{
			tmaxsize = totalnum/groupnum+1;
		}
		task.setTmaxsize(tmaxsize+"");
		
		entityDao.save(task);
		
		return "front/loading2";
	}
	
	@RequestMapping(value = "/tasknoticeModify.do", method = RequestMethod.GET)
	public String tasknoticeModify(HttpServletRequest request,HttpServletResponse response,TaskNotice task,ModelMap model){
		int tasktag = Integer.parseInt(request.getParameter("tasktag"));
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object> tasklist = entityDao.createQuery("from tasknotice where ID='"+tasktag+"'");
		TaskNotice tasknotice = (TaskNotice)tasklist.get(0);		
		model.addAttribute("task",tasknotice);
		List<Object>  courselist=entityDao.createQuery("from course where college='" + user.getScollege()+ "'");
		model.addAttribute("obj", courselist);
		return "front/tasknoticeModify";
	}
	
	//分组任务修改的后台处理
	@RequestMapping(value = "/tasknoticeModifySubmit.do", method = RequestMethod.POST)
	public String tasknoticeModifySubmit(HttpServletRequest request,HttpServletResponse response,TaskNotice task,ModelMap model){
		Date nowDate = new Date();
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(nowDate);
		int ID = Integer.parseInt(request.getParameter("ID"));
		int totalnum = Integer.parseInt(task.getTtotalnum());
		int groupnum = Integer.parseInt(task.getTgroupnum());
		int tmaxsize = 0;
		
		if(totalnum%groupnum == 0){
			tmaxsize = totalnum/groupnum;
		}else{
			tmaxsize = totalnum/groupnum+1;
		}
		task.setTmaxsize(tmaxsize+"");
		
		entityDao.update("update tasknotice set tname='"+task.getTname()+"',tcoursename='"
				+task.getTcoursename()+"',tcoursenum='"+task.getTcoursenum()+"',tcoursedesc='"+task.getTcoursedesc()+"',ttotalnum='"
				+task.getTtotalnum()+"',tgroupnum='"+task.getTgroupnum()+"',tmaxsize='"+tmaxsize+"',tcompletedate='"
				+task.getTcompletedate()+"',tmodifydate='"+nowTime+"'  where ID='"+ID+"'");
		return "front/loading2";
	}
	
	//分组任务删除的后台处理
	@RequestMapping(value = "/tasknoticeDelete.do", method = RequestMethod.GET)
	public String tasknoticeDelete(HttpServletRequest request,HttpServletResponse response,TaskNotice task,ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		int tasktag = Integer.parseInt(request.getParameter("tasktag"));
		List<Object> tasklist = entityDao.createQuery("from tasknotice where ID='"+tasktag+"'");
		TaskNotice tasknotice = (TaskNotice)tasklist.get(0);
		
		entityDao.delete("delete from tasknotice where ID='"+tasknotice.getID()+"'");
		entityDao.delete("delete from taskcomplete where wstaskid='"+tasknotice.getID()+"'");
		
		toMain(model,user);
		
		return "front/loading2";
	}
	
	//分组任务重置的后台处理，即重新分组
	@RequestMapping(value = "/tasknoticeReset.do", method = RequestMethod.GET)
	public String tasknoticeReset(HttpServletRequest request,HttpServletResponse response,TaskNotice task,ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		int tasktag = Integer.parseInt(request.getParameter("tasktag"));
		List<Object> tasklist = entityDao.createQuery("from tasknotice where ID='"+tasktag+"'");
		TaskNotice tasknotice = (TaskNotice)tasklist.get(0);
		
		entityDao.delete("delete from taskcomplete where wstaskid='"+tasknotice.getID()+"'");
		
		toMain(model,user);
		
		return "front/loading2";
	}
	
	//每一次跳转到main界面都要经过这个路由
	@RequestMapping(value = "/tasknoticeMain.do", method = RequestMethod.GET)
	public String tasknoticeMain(HttpServletRequest request,HttpServletResponse response,TaskNotice task,ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		toMain(model,user);
		
		return "front/main";
	}
	
	//从数据库拉取main界面的主要信息
		public void toMain(ModelMap model,User user){
			List<Object> worklist = entityDao.createQuery("from worknotice where wclass='" + user.getSclass() + "' order by wmodifydate desc");
			model.addAttribute("obj", worklist);
			List<Object> tasklist = entityDao.createQuery("from tasknotice where tclass='" + user.getSclass() + "' order by tmodifydate desc");
			model.addAttribute("tasklist",tasklist);
			
			List<Object> numtasklist = new ArrayList();//用于存储每个分组已选人数的集合
			List<Object> taskeach = entityDao.createQuery("from taskcomplete");
			List<Object> wnoticelist = entityDao.createQuery("from worknotice where wclass='"+user.getSclass()+"' order by wuploaddate desc");
			model.addAttribute("wnoticelist",wnoticelist);
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