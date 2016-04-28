package cn.jit.edu.controller.front;

import java.io.*;
import java.security.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import cn.jit.edu.dao.*;
import cn.jit.edu.entity.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import cn.jit.edu.util.LogonUtils;

@Controller
public class TimeProcessController {

	@Autowired
	private EntityDao entityDao;
	
	@RequestMapping(value = "/getTimeProcess.do", method = RequestMethod.GET)
	public String getTimeProcess(HttpServletRequest request,HttpServletResponse response, ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");//获取年份工具
		
		List<Object> workcompList = entityDao.createQuery("from worksubmit where wsno='"+user.getSno()+"' order by wsuploaddate desc");
		List<Object> workDiffyearList = new ArrayList();//用于存储作业不同的年份
		String[] workEachYear = new String[workcompList.size()];//用于一一对应taskcompList中各个数据的年份，方便前台
		
		List<Object> taskcompList = entityDao.createQuery("from taskcomplete where tcsno='"+user.getSno()+"' order by tccompletedate desc");
		List<Object> taskDiffyearList = new ArrayList();//用于存储任务不同的年份
		String[] taskEachYear = new String[taskcompList.size()];//用于一一对应taskcompList中各个数据的年份，方便前台
		
		for(int i=0;i<workcompList.size();i++){
			Date date = ((WorkSubmit)workcompList.get(i)).getWsuploaddate();
			workEachYear[i] = sdf.format(date);
			workDiffyearList = setDiffYear(workDiffyearList,sdf.format(date));
		}
		
		for(int i=0;i<taskcompList.size();i++){
			Date date = ((TaskComplete)taskcompList.get(i)).getTccompletedate();
			taskEachYear[i] = sdf.format(date);
			taskDiffyearList = setDiffYear(taskDiffyearList,sdf.format(date));
//			System.out.println(sdf.format(date));
		}
		
		model.addAttribute("workEachYear",workEachYear);
		model.addAttribute("workDiffyearList",workDiffyearList);
		model.addAttribute("workcompList",workcompList);
		
		model.addAttribute("taskEachYear",taskEachYear);
		model.addAttribute("taskDiffyearList",taskDiffyearList);
		model.addAttribute("taskcompList",taskcompList);
		
		if(!user.getStatus().equals("普通学生")){
			List<Object> worknoticeList = entityDao.createQuery("from worknotice where wreleasesno='"+user.getSno()+"' order by wreleasedate desc");
			List<Object> worknoticeDiffyearList = new ArrayList();//用于作业发布不同的年份
			String[] worknoticeEachYear = new String[worknoticeList.size()];//用于一一对应worknoticeList中各个数据的年份，方便前台
			
			List<Object> tasknoticeList = entityDao.createQuery("from tasknotice where treleasesno='"+user.getSno()+"' order by treleasedate desc");
			List<Object> tasknoticeDiffyearList = new ArrayList();//用于作业发布不同的年份
			String[] tasknoticeEachYear = new String[tasknoticeList.size()];//用于一一对应tasknoticeList中各个数据的年份，方便前台
			
			for(int i=0;i<worknoticeList.size();i++){
				Date date = ((WorkNotice)worknoticeList.get(i)).getWreleasedate();
				worknoticeEachYear[i] = sdf.format(date);
				worknoticeDiffyearList = setDiffYear(worknoticeDiffyearList,sdf.format(date));
			}
			
			for(int i=0;i<tasknoticeList.size();i++){
				Date date = ((TaskNotice)tasknoticeList.get(i)).getTreleasedate();
				tasknoticeEachYear[i] = sdf.format(date);
				tasknoticeDiffyearList = setDiffYear(tasknoticeDiffyearList,sdf.format(date));
			}
			
			model.addAttribute("worknoticeEachYear",worknoticeEachYear);
			model.addAttribute("worknoticeDiffyearList",worknoticeDiffyearList);
			model.addAttribute("worknoticeList",worknoticeList);
			
			model.addAttribute("tasknoticeEachYear",tasknoticeEachYear);
			model.addAttribute("tasknoticeDiffyearList",tasknoticeDiffyearList);
			model.addAttribute("tasknoticeList",tasknoticeList);
		}
		
		return "front/timeProcess";
	}
	
	@RequestMapping(value = "/downloadFile.do", method = RequestMethod.GET)
	public String downloadFile(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception{
		User user = (User)request.getSession().getAttribute("frontnumber");
		String path=user.getSno().substring(0,2);
		
		int ID = Integer.parseInt(request.getParameter("ID"));
		List<Object> list = entityDao.createQuery("from worksubmit where ID='"+ID+"'");
		WorkSubmit worksubmit = (WorkSubmit)(list.get(0));
		String filename = worksubmit.getWsfilepath();
		
		//设置文件MIME类型
		response.setContentType(request.getServletContext().getMimeType(filename));
		//设置Content-Disposition 
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		
		//读取目标文件，通过response将目标文件写到客户端
		//获取目标文件的绝对路径 
		String fullFileName = request.getServletContext().getRealPath("/"+path+"级/" + filename);
		
		InputStream in = new FileInputStream(fullFileName); 
		OutputStream out = response.getOutputStream(); 
		
		//写文件
		int flag;
		while((flag = in.read())!=-1){
			out.write(flag);
		}
		
		in.close();
		out.close();
		
		return "front/downloadResult";
	}
	
	//用于向list中添加不同的年份
	public List<Object> setDiffYear(List<Object> diffyearList,String year){
		if(diffyearList.size() == 0){
			diffyearList.add(year);
		}else{
			for(int i=0;i<diffyearList.size();i++){
				if(((String)diffyearList.get(i)).equals(year))
					return diffyearList;
			}
			diffyearList.add(year);
		}
		return diffyearList;
	}
	
}
