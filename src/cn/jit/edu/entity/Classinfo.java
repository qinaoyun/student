package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity (name="classinfo")
public class  Classinfo{
	@Column(name = "collegeID", nullable = false)
	String collegeID;							//学院
	@Column(name = "classinfo", nullable = false)
	String classinfo;						//班级
	
	@Column(name = "joindate", nullable = false)
	Date joindate;									//写入数据表时间
	@Column(name = "modifydate", nullable = false)
	Date modifydate;								//修改数据表时间
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;									//主键id

	public String getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(String collegeID) {
		this.collegeID = collegeID;
	}

	public String getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(String classinfo) {
		this.classinfo = classinfo;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}
	
	
}
