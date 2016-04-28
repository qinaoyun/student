package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity (name="worksubmit")
public class WorkSubmit {
	@Column(name = "wsname", nullable = false)
	String wsname;							//作业名称
	@Column(name = "wssname", nullable = false)
	String wssname;							//上交作业学生姓名
	@Column(name = "wscoursenum", nullable = false)
	String wscoursenum;						//课程代码
	@Column(name = "wsno", nullable = false)
	String wsno;							//上交作业学生学号
	@Column(name = "wsclass", nullable = false)
	String wsclass;									//上交学生所在班级
	@Column(name = "wscollege", nullable = false)
	String wscollege;								//上交学生所在学院；暂时显示插入中文。。后期可能会改
	@Column(name = "wsfilepath", nullable = false)
	String wsfilepath;						//作业上交路径
	

	@Column(name = "wsuploaddate", nullable = false)
	Date wsuploaddate;						//上交作业日期
	

	@Column(name = "wsmodifydate", nullable = false)
	Date wsmodifydate;						//作业修改日期
	
	@Column(name = "wsteachersno", nullable = true)
	String wsteachersno;					//任课老师
	@Column(name = "wsscore", nullable =true)
	String wsscore;							//学生作业的得分情况；此处特别重要，涉及到后面数据分析
	@Column(name = "wsworkid", nullable = false)
	int  wsworkid;						//作业通知表中的ID
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;									//主键id


	public String getWsname() {
		return wsname;
	}


	public void setWsname(String wsname) {
		this.wsname = wsname;
	}


	public String getWscoursenum() {
		return wscoursenum;
	}


	public void setWscoursenum(String wscoursenum) {
		this.wscoursenum = wscoursenum;
	}


	public String getWsno() {
		return wsno;
	}


	public void setWsno(String wsno) {
		this.wsno = wsno;
	}
	

	public String getWsclass() {
		return wsclass;
	}


	public void setWsclass(String wsclass) {
		this.wsclass = wsclass;
	}


	public String getWscollege() {
		return wscollege;
	}


	public String getWssname() {
		return wssname;
	}


	public void setWssname(String wssname) {
		this.wssname = wssname;
	}


	public void setWscollege(String wscollege) {
		this.wscollege = wscollege;
	}


	public String getWsfilepath() {
		return wsfilepath;
	}


	public void setWsfilepath(String wsfilepath) {
		this.wsfilepath = wsfilepath;
	}


	public Date getWsuploaddate() {
		return wsuploaddate;
	}


	public void setWsuploaddate(Date wsuploaddate) {
		this.wsuploaddate = wsuploaddate;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	public Date getWsmodifydate() {
		return wsmodifydate;
	}


	public void setWsmodifydate(Date wsmodifydate) {
		this.wsmodifydate = wsmodifydate;
	}


	public String getWsteachersno() {
		return wsteachersno;
	}


	public void setWsteachersno(String wsteachersno) {
		this.wsteachersno = wsteachersno;
	}


	public String getWsscore() {
		return wsscore;
	}


	public void setWsscore(String wsscore) {
		this.wsscore = wsscore;
	}


	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public int getWsworkid() {
		return wsworkid;
	}


	public void setWsworkid(int wsworkid) {
		this.wsworkid = wsworkid;
	}




	
}
