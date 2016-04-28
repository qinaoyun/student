package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity (name="taskcomplete")
public class TaskComplete {
	@Column(name = "tcname", nullable = false)
	String tcname;							//任务名称
	@Column(name = "tccoursenum", nullable = false)
	String tccoursenum;						//课程代码
	@Column(name = "tcsno", nullable = false)
	String tcsno;							//完成分组任务学生学号
	@Column(name = "tcsname", nullable = false)
	String tcsname;                         //完成分组任务的学生姓名
	@Column(name = "tcclass", nullable = false)
	String tcclass;									//完成分组任务学生所在班级
	@Column(name = "tccollege", nullable = false)
	String tccollege;								//完成分组任务学生所在学院；暂时显示插入中文。。后期可能会改
	
	@Column(name = "tcgroupnum", nullable = false)
	String tcgroupnum;								//组号
	@Column(name = "tcleader", nullable = false)
	String tcleader;								//小组组长;0表示普通学生，1表示组长
	@Column(name = "tcdesc", nullable = false)
	String tcdesc;									//小组主题或描述信息
//	@Column(name = "filepath", nullable = false)
//	String wsfilepath;						//作业上交路径
	
	
	@Column(name = "tccompletedate", nullable = false)
	Date tccompletedate;						//上交作业日期
	
//	@Temporal(TemporalType.DATE)
//	@Column(name = "tcmodifydate", nullable = false)
//	Date tcmodifydate;						//修改日期
	
	@Column(name = "wsteachersno", nullable = false)
	String wsteachersno;					//任课老师工号  待定（在发布任务的表中暂未添加）
	@Column(name = "wstaskid", nullable = false)
	int    wstaskid;						//分组任务通知表中的ID
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;									//主键id


	public String getTcname() {
		return tcname;
	}


	public void setTcname(String tcname) {
		this.tcname = tcname;
	}


	public String getTccoursenum() {
		return tccoursenum;
	}


	public void setTccoursenum(String tccoursenum) {
		this.tccoursenum = tccoursenum;
	}


	public String getTcsno() {
		return tcsno;
	}


	public void setTcsno(String tcsno) {
		this.tcsno = tcsno;
	}


	public String getTcclass() {
		return tcclass;
	}


	public void setTcclass(String tcclass) {
		this.tcclass = tcclass;
	}


	public String getTccollege() {
		return tccollege;
	}


	public void setTccollege(String tccollege) {
		this.tccollege = tccollege;
	}


	public String getTcgroupnum() {
		return tcgroupnum;
	}


	public void setTcgroupnum(String tcgroupnum) {
		this.tcgroupnum = tcgroupnum;
	}


	public String getTcleader() {
		return tcleader;
	}


	public void setTcleader(String tcleader) {
		this.tcleader = tcleader;
	}


	public String getTcdesc() {
		return tcdesc;
	}


	public void setTcdesc(String tcdesc) {
		this.tcdesc = tcdesc;
	}


	public Date getTccompletedate() {
		return tccompletedate;
	}


	public void setTccompletedate(Date tccompletedate) {
		this.tccompletedate = tccompletedate;
	}


	public String getWsteachersno() {
		return wsteachersno;
	}


	public void setWsteachersno(String wsteachersno) {
		this.wsteachersno = wsteachersno;
	}


	public int getWstaskid() {
		return wstaskid;
	}


	public void setWstaskid(int wstaskid) {
		this.wstaskid = wstaskid;
	}


	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public String getTcsname() {
		return tcsname;
	}


	public void setTcsname(String tcsname) {
		this.tcsname = tcsname;
	}
	
	
}
