package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "worknotice")
public class WorkNotice {
	@Column(name = "wname", nullable = false)
	String wname; // 作业名称
	@Column(name = "wcoursename", nullable = false)
	String wcoursename; // 课程名称
	@Column(name = "wcoursedesc", nullable = false)
	String wcoursedesc; // 作业描述信息

	@Column(name = "wclass", nullable = false)
	String wclass; // 发布人所在班级

	@Column(name = "wreleasename", nullable = false)
	String wreleasename; // 发布人姓名

	@Column(name = "wcollege", nullable = false)
	String wcollege; // 发布人所在学院；暂时显示插入中文。。后期可能会改

	@Column(name = "wcoursenum", nullable = false)
	String wcoursenum; // 课程代码；有10位数字组成，具体根据“教务管理系统”上对应的课程代码，且具有唯一性。
	@Column(name = "wtotalnum", nullable = false)
	String wtotalnum; // 需要上交的学生总人数

	@Column(name = "wuploaddate", nullable = false)
	String wuploaddate; // 需要上交的日期；也就是最迟上交日期

	@Column(name = "wreleasedate", nullable = false)
	Date wreleasedate; // 发布作业的日期

	@Column(name = "wmodifydate", nullable = false)
	Date wmodifydate; // 修改日期

	@Column(name = "wreleasesno", nullable = false)
	String wreleasesno; // 发布人学号，外键关联到user表
	@Column(name = "wcourseteacher", nullable = false)
	String wcourseteacher; // 任课老师的 sno 即老师工号。

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID; // 主键id

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getWcoursename() {
		return wcoursename;
	}

	public void setWcoursename(String wcoursename) {
		this.wcoursename = wcoursename;
	}

	public String getWreleasename() {
		return wreleasename;
	}

	public void setWreleasename(String wreleasename) {
		this.wreleasename = wreleasename;
	}
	
	public String getWcoursedesc() {
		return wcoursedesc;
	}

	public void setWcoursedesc(String wcoursedesc) {
		this.wcoursedesc = wcoursedesc;
	}

	public String getWclass() {
		return wclass;
	}

	public void setWclass(String wclass) {
		this.wclass = wclass;
	}

	public String getWcollege() {
		return wcollege;
	}

	public void setWcollege(String wcollege) {
		this.wcollege = wcollege;
	}

	public String getWcoursenum() {
		return wcoursenum;
	}

	public void setWcoursenum(String wcoursenum) {
		this.wcoursenum = wcoursenum;
	}

	public String getWtotalnum() {
		return wtotalnum;
	}

	public void setWtotalnum(String wtotalnum) {
		this.wtotalnum = wtotalnum;
	}

	public String getWuploaddate() {
		return wuploaddate;
	}

	public void setWuploaddate(String wuploaddate) {
		this.wuploaddate = wuploaddate;
	}

	public Date getWreleasedate() {
		return wreleasedate;
	}

	public void setWreleasedate(Date wreleasedate) {
		this.wreleasedate = wreleasedate;
	}

	public Date getWmodifydate() {
		return wmodifydate;
	}

	public void setWmodifydate(Date wmodifydate) {
		this.wmodifydate = wmodifydate;
	}

	public String getWreleasesno() {
		return wreleasesno;
	}

	public void setWreleasesno(String wreleasesno) {
		this.wreleasesno = wreleasesno;
	}

	public String getWcourseteacher() {
		return wcourseteacher;
	}

	public void setWcourseteacher(String wcourseteacher) {
		this.wcourseteacher = wcourseteacher;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

}
