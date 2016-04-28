package cn.jit.edu.controller.front;

import java.io.*;
import java.security.*;
import java.util.*;
import javax.servlet.http.*;
import org.springframework.web.bind.annotation.*;
import cn.jit.edu.dao.*;
import cn.jit.edu.entity.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import cn.jit.edu.util.LogonUtils;

@Controller
public class TaskDetailedController {
	
	@Autowired
	private EntityDao entityDao;
	
	@RequestMapping(value = "/taskdetailed.do", method = RequestMethod.GET)
	public String taskDetailed(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException{
		int tasktag = Integer.parseInt(request.getParameter("tasktag"));
		List<Object> tasklist = entityDao.createQuery("from tasknotice where ID='"+tasktag+"'");
		TaskNotice task = (TaskNotice)tasklist.get(0);
		
		List<Object> numUserlist = new ArrayList<Object>();//存储每组多少人
		List<Object> userlist = new ArrayList<Object>();//存储每组有什么人
		int numTotal = Integer.parseInt(task.getTtotalnum());//分组的总人数
		int numGroup = Integer.parseInt(task.getTgroupnum());//小组数目
		int numMaxEveryGroup = Integer.parseInt(task.getTmaxsize());//每组最大人数
		int[] numEveryGroup = getGroupNum(numTotal,numGroup,numMaxEveryGroup);//每组人数，存放在数组中
		
		//将每组有多少人存储起来
		for(int i=0;i<numGroup;i++){
			numUserlist.add(numEveryGroup[i]);
		}
		
		//将每组有哪些人存储起来
		List<Object> allUserList = entityDao.createQuery("from taskcomplete where wstaskid='"+task.getID()+"'");
		for(int i=0;i<numGroup;i++){
			String nameplus = "";
			
			//将分在这一组的人的姓名连接起来
			for(int j=0;j<allUserList.size();j++){
				TaskComplete user = (TaskComplete)allUserList.get(j);
				if(user.getTcgroupnum().equals((i+1)+"")){
//					System.out.print(user.getTcsname());
					nameplus += user.getTcsname()+" ";
				}
			}
			userlist.add(nameplus);
		}
		
		model.addAttribute("task",task);
		model.addAttribute("tasktag",tasktag);
		model.addAttribute("numUserlist",numUserlist);
		model.addAttribute("userlist",userlist);
		
		return "front/taskdetailed";
	}
	
	@RequestMapping(value = "/taskdetailedSubmit.do", method = RequestMethod.POST)
	public String taskDetailedSubmit(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException{
		User userself = (User)request.getSession().getAttribute("frontnumber");
		PrintWriter out = response.getWriter();
		int data = 0;//data代表返回状态  0表示默认  1为人数已满  2为已经分过 3为成功
		
		int groupNum = Integer.parseInt(request.getParameter("groupNum"));
		int tasktag = Integer.parseInt(request.getParameter("tasktag"));
		List<Object> tasklist = entityDao.createQuery("from tasknotice where ID='"+tasktag+"'");
		TaskNotice task = (TaskNotice)tasklist.get(0);
		
		List<Object> numUserlist = new ArrayList<Object>();//存储每组多少人
		List<Object> userlist = new ArrayList<Object>();//存储每组有什么人
		int numTotal = Integer.parseInt(task.getTtotalnum());//分组的总人数
		int numGroup = Integer.parseInt(task.getTgroupnum());//小组数目
		int numMaxEveryGroup = Integer.parseInt(task.getTmaxsize());//每组最大人数
		int[] numEveryGroup = getGroupNum(numTotal,numGroup,numMaxEveryGroup);//每组人数，存放在数组中
		
		List<Object> allUserList = entityDao.createQuery("from taskcomplete where wstaskid='"+task.getID()+"'");
		if(allUserList.size() >= numEveryGroup[groupNum]){
			System.out.println("人数已经满了");
			data = 1;
		}else{
			boolean flag = false;//标记用户是否已经分过组
			for(int i=0;i<allUserList.size();i++){
				String no = ((TaskComplete)allUserList.get(i)).getTcsno();
				
				if(no.equals(userself.getSno())){
					i = allUserList.size();
					flag = true;
					System.out.println("此用户已经分完组");
					data = 2;
				}
			}
			
			//若是人数未满并且也还未进行存储中  进行存储
			if(!flag){
				TaskComplete taskcomp = new TaskComplete();
				taskcomp.setTcname(task.getTname());
				taskcomp.setTccoursenum(task.getTcoursenum());
				taskcomp.setTcsno(userself.getSno());
				taskcomp.setTcsname(userself.getSname());
				taskcomp.setTcclass(userself.getSclass());
				taskcomp.setTccollege(userself.getScollege());
				taskcomp.setTcgroupnum(groupNum+"");
				taskcomp.setTcleader("0");
				taskcomp.setTcdesc("");
				taskcomp.setTccompletedate(new Date());
				taskcomp.setWsteachersno("001");//教师工号  待定
				taskcomp.setWstaskid(task.getID());
				
				entityDao.save(taskcomp);
				System.out.println("存储成功");
				data = 3;
			}
		}
		
		//将每组有多少人存储起来
		for(int i=0;i<numGroup;i++){
			numUserlist.add(numEveryGroup[i]);
		}
		
		//将每组有哪些人存储起来
		for(int i=0;i<numGroup;i++){
			String nameplus = "";
			
			//将分在这一组的人的姓名连接起来
			for(int j=0;j<allUserList.size();j++){
				TaskComplete user = (TaskComplete)allUserList.get(j);
				if(user.getTcgroupnum().equals((i+1)+"")){
//					System.out.print(user.getTcsname());
					nameplus += user.getTcsname()+" ";
				}
			}
			userlist.add(nameplus);
		}
		
		model.addAttribute("task",task);
		model.addAttribute("tasktag",tasktag);
		model.addAttribute("numUserlist",numUserlist);
		model.addAttribute("userlist",userlist);	
		
		out.print(data);
		return null;
	}
	
	
	
	//获取每一组的人数
	public int[] getGroupNum(int numTotal,int numGroup,int numMaxEveryGroup){
		int[] num = new int[numGroup];//小组数目
		int i = 0,j = 0;//i = 非最大人数小组个数-1
		
		while((numTotal-(numTotal/numMaxEveryGroup-i)*numMaxEveryGroup)/(i+1)<(numMaxEveryGroup-1)){
			i++;
		}
		
		for(j=0;j<numGroup-(i+1);j++){
			num[j] = numMaxEveryGroup;
		}
		
		for(;j<numGroup;j++){
			num[j] = (numTotal-(numGroup-i-1)*numMaxEveryGroup)/(i+1);//非最大人数
		}
		
		return num;
	}
}
