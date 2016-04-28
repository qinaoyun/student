package cn.jit.edu.controller.front;

import java.io.*;
import java.security.*;
import java.util.*;
import javax.servlet.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import cn.jit.edu.dao.*;
import cn.jit.edu.entity.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

@Controller
public class ClassfileController {
	
	@Autowired
	private EntityDao entityDao;
	
	//用于班级文件上传
	@RequestMapping(value = "/classfileUpload.do", method = RequestMethod.POST)
	public String classfileUpload(@RequestParam(value = "classfile", required = false) MultipartFile file,HttpServletRequest request,HttpServletResponse response,ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		String  className = user.getSclass();
		if(!file.isEmpty() ){
			String path = request.getSession().getServletContext().getRealPath("资料库\\"+className+"资料库");  
			String fileName = file.getOriginalFilename();
			
			File targetFile = new File(path,fileName);
			if(!targetFile.exists()){
				targetFile.mkdirs();
			}
			
			try{
				file.transferTo(targetFile);
			}catch(Exception e){
				return "front/error";
			}
			
			//存入数据库
			ClassFiles classfile = new ClassFiles();
			classfile.setCfilename(fileName);
			classfile.setCfilepath("/资料库/"+className+"资料库");
			classfile.setCsno(user.getSno());
			classfile.setCsname(user.getSname());
			classfile.setCclass(user.getSclass());
			classfile.setCuploaddate(new Date());
			entityDao.save(classfile);
		}
		
		return getClassfiles(request,response,model);
	}
	
	@RequestMapping(value = "/classfileDownload.do", method = RequestMethod.GET)
	public String classfileDownload(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws Exception{
		int ID = Integer.parseInt(request.getParameter("ID"));
		List<Object> filelist = entityDao.createQuery("from classfiles where ID="+ID);
		ClassFiles file = (ClassFiles)filelist.get(0);
		String filename = file.getCfilename();
		
		//设置文件MIME类型
		response.setContentType(request.getServletContext().getMimeType(filename));
		//设置Content-Disposition 
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		
		//读取目标文件，通过response将目标文件写到客户端
		//获取目标文件的绝对路径 
		String fullFileName = request.getServletContext().getRealPath(file.getCfilepath()+"/"+filename);
		
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
	
	//用于查看班级库文件的跳转
	@RequestMapping(value = "/getClassfiles.do", method = RequestMethod.GET)
	public String getClassfiles(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		User user = (User)request.getSession().getAttribute("frontnumber");
		
		List<Object> filelist = entityDao.createQuery("from classfiles where cclass='"+user.getSclass()+"'");
		
		model.addAttribute("filelist",filelist);
		
		for(int i=0;i<filelist.size();i++){
			ClassFiles file = (ClassFiles)filelist.get(i);
		}
		
		return "front/datafocus";
	}
	
}
