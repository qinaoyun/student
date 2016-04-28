package cn.jit.edu.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.jit.edu.dao.EntityDao;

import cn.jit.edu.entity.MessageLy;
import cn.jit.edu.entity.TaskComplete;
import cn.jit.edu.entity.TaskNotice;
import cn.jit.edu.entity.User;
import cn.jit.edu.entity.WorkNotice;
import cn.jit.edu.entity.WorkSubmit;

@Controller
public class WorkController {

	@Autowired
	private EntityDao entityDao;
	
    //作业提交前查询数据库
	@RequestMapping(value = "/workcontrol.do")
	public String work(HttpServletRequest request, ModelMap model) {
		int flag;
		String wnoticeid = request.getParameter("worknoticeid");
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object> worknotice = entityDao.createQuery("from worknotice where ID='" + wnoticeid + "'");
		model.addAttribute("worknotice", worknotice);
		List<Object> msg = entityDao.createQuery("from messagely where msworkid='" + wnoticeid + "'");
		model.addAttribute("msg", msg);
		List<Object>  rpy=entityDao.createQuery("from replayly");
		model.addAttribute("rpy", rpy);
		List<Object>  worksubmit1=entityDao.createQuery("from worksubmit where wsworkid='"+wnoticeid+"'"+"and wsno='"+ user.getSno()+ "'");
		if(worksubmit1.isEmpty())
		 {
			flag=0;
			
		 }
		else{
			flag=1;
			for(int a=0;a<worksubmit1.size();a++){
				  WorkSubmit wsubmit=(WorkSubmit)worksubmit1.get(a);
				  model.addAttribute("filename",wsubmit.getWsfilepath());
			}
		
		}
		model.addAttribute("flag",flag);
		return "/front/worksubmit";
	}
	//作业修改时查询数据库
	@RequestMapping(value = "/workmodify.do")
	public String work1(HttpServletRequest request, ModelMap model) {
		String wnoticeid = request.getParameter("worknoticeid");
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object> worknotice = entityDao.createQuery("from worknotice where ID='" + wnoticeid + "'");
		model.addAttribute("worknotice", worknotice);
		List<Object>  courselist=entityDao.createQuery("from course where college='" + user.getScollege()+ "'");
		model.addAttribute("obj", courselist);
		return "/front/worknoticeModify";
	}
	//主界面查询
	@RequestMapping(value = "/querymain.do")
	public String query(HttpServletRequest request, ModelMap model) {
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object> worklist=entityDao.createQuery("from worknotice where wclass='"+user.getSclass()+"' order by wmodifydate desc");
		model.addAttribute("obj", worklist);
		List<Object> tasklist = entityDao.createQuery("from tasknotice where tclass='"+user.getSclass()+"' order by tmodifydate desc");
		model.addAttribute("tasklist",tasklist);
//		查找离上交日期最近的四条数据  SELECT TOP 2 * FROM table_name ORDER BY datetime desc
		
		List<Object> wnoticelist = entityDao.createQuery("from worknotice where wclass='"+user.getSclass()+"' order by wuploaddate desc");
		model.addAttribute("wnoticelist",wnoticelist);
//	    查找到这四条数据后，与当前进行比较
		
		
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
		    
		    return "front/main";
	}

}
