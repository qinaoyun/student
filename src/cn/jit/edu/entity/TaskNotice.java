package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity (name="tasknotice")
public class TaskNotice {
	@Column(name = "tname", nullable = false)
	String tname;								//任务名称
	@Column(name = "tcoursename", nullable = false)
	String tcoursename;							//课程名称
	@Column(name = "tcoursedesc", nullable = false)
	String tcoursedesc;							//分组任务描述信息；其中包括分组的组数和每组人数的描述性信息
	@Column(name = "tcourseimg", nullable = true)
	String tcourseimg;							//课程图片/图标
	
	@Column(name = "tclass", nullable = false)
	String tclass;									//发布人所在班级
	@Column(name = "tcollege", nullable = false)
	String tcollege;								//发布人所在学院；暂时显示插入中文。。后期可能会改
	
	@Column(name = "tcoursenum", nullable = false)
	String tcoursenum;							//课程代码；有10位数字组成，具体根据“教务管理系统”上对应的课程代码，且具有唯一性。
	@Column(name = "ttotalnum", nullable = false)
	String ttotalnum;							//需要分组的总人数
	@Column(name = "tgroupnum", nullable = false)
	String tgroupnum;							//需要分组的组数
	@Column(name = "tmaxsize", nullable = false)
	String tmaxsize;							//每组最大的人数
	

	@Column(name = "tcompletedate", nullable = false)
	String tcompletedate;							//需要完成分组任务的日期；也就是最迟完成日期
	

	@Column(name = "treleasedate", nullable = false)
	Date   treleasedate;						//发布分组任务的日期
	

	@Column(name = "tmodifydate", nullable = false)
	Date   tmodifydate;							//修改分组任务日期
	
	@Column(name = "treleasesno", nullable = false)
	String treleasesno;    						//发布人学号，外键关联到user表
	
	@Column(name = "tcourseteacher", nullable = true)
	String tteachersno;							//老师工号
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;


	public String getTname() {
		return tname;
	}


	public void setTname(String tname) {
		this.tname = tname;
	}


	public String getTcoursename() {
		return tcoursename;
	}


	public void setTcoursename(String tcoursename) {
		this.tcoursename = tcoursename;
	}


	public String getTcoursedesc() {
		return tcoursedesc;
	}


	public void setTcoursedesc(String tcoursedesc) {
		this.tcoursedesc = tcoursedesc;
	}
	
	
	public String getTcourseimg() {
		return tcourseimg;
	}


	public void setTcourseimg(String tcourseimg) {
		this.tcourseimg = tcourseimg;
	}


	public String getTclass() {
		return tclass;
	}


	public void setTclass(String tclass) {
		this.tclass = tclass;
	}


	public String getTcollege() {
		return tcollege;
	}


	public void setTcollege(String tcollege) {
		this.tcollege = tcollege;
	}


	public String getTcoursenum() {
		return tcoursenum;
	}


	public void setTcoursenum(String tcoursenum) {
		this.tcoursenum = tcoursenum;
	}


	public String getTtotalnum() {
		return ttotalnum;
	}


	public void setTtotalnum(String ttotalnum) {
		this.ttotalnum = ttotalnum;
	}


	public String getTgroupnum() {
		return tgroupnum;
	}


	public void setTgroupnum(String tgroupnum) {
		this.tgroupnum = tgroupnum;
	}


	public String getTmaxsize() {
		return tmaxsize;
	}


	public void setTmaxsize(String tmaxsize) {
		this.tmaxsize = tmaxsize;
	}

	public String getTcompletedate() {
		return tcompletedate;
	}


	public void setTcompletedate(String tcompletedate) {
		this.tcompletedate = tcompletedate;
	}


	public Date getTreleasedate() {
		return treleasedate;
	}


	public void setTreleasedate(Date treleasedate) {
		this.treleasedate = treleasedate;
	}


	public Date getTmodifydate() {
		return tmodifydate;
	}


	public void setTmodifydate(Date tmodifydate) {
		this.tmodifydate = tmodifydate;
	}


	public String getTreleasesno() {
		return treleasesno;
	}


	public void setTreleasesno(String treleasesno) {
		this.treleasesno = treleasesno;
	}


	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}	
	
}
