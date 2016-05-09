package cn.jit.edu.controller.front;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jit.edu.dao.EntityDao;
import cn.jit.edu.entity.User;
@Controller
public class CourseController {
	@Autowired
	private EntityDao entityDao;
	
	//发布作业时根据学院查询课程名称
	
	@RequestMapping(value = "/querycourse.do")
	public String querycollege(HttpServletRequest request, ModelMap model) {
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object>  courselist=entityDao.createQuery("from course where college='" + user.getScollege()+ "'");
		model.addAttribute("obj", courselist);
		return "front/worknotice";
	}
	   //发布分组时根据学院查询课程名称
	@RequestMapping(value = "/querycourse1.do")
	public String querycollege1(HttpServletRequest request, ModelMap model) {
		User user = (User)request.getSession().getAttribute("frontnumber");
		List<Object>  courselist=entityDao.createQuery("from course where college='" + user.getScollege()+ "'");
		model.addAttribute("obj", courselist);
		return "front/tasknotice";
	}
  //ajax根据学院查询班级
	@RequestMapping(value = "/queryteaname.do")
		@ResponseBody
     	List<Object> list(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
			String courseid= request.getParameter("courseid");
			List<Object> tea = entityDao.createQuery("from course where ID='" + courseid+ "'");
//			PrintWriter out = response.getWriter();
//			out.print(collegeid);
			return tea;
	}

}
