package cn.jit.edu.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity (name="classfiles")
public class ClassFiles {
	@Column(name = "cfilename", nullable = false)
	String cfilename;                            //文件名
	@Column(name = "cfilepath", nullable = false)
	String cfilepath;                            //文件路径即文件夹
	@Column(name = "csno", nullable = false)
	String csno;								 //上传文件人的学号
	@Column(name = "csname", nullable = false)
	String csname;								 //上传文件人的姓名
	@Column(name = "cclass", nullable = false)
	String cclass;								 //文件所属班级
	@Column(name = "cuploaddate", nullable = false)
	Date cuploaddate;							 //文件上传时间
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;									//主键id

	public Date getCuploaddate() {
		return cuploaddate;
	}

	public void setCuploaddate(Date cuploaddate) {
		this.cuploaddate = cuploaddate;
	}

	public String getCfilename() {
		return cfilename;
	}

	public void setCfilename(String cfilename) {
		this.cfilename = cfilename;
	}

	public String getCfilepath() {
		return cfilepath;
	}

	public void setCfilepath(String cfilepath) {
		this.cfilepath = cfilepath;
	}

	public String getCsno() {
		return csno;
	}

	public void setCsno(String csno) {
		this.csno = csno;
	}

	public String getCsname() {
		return csname;
	}

	public void setCsname(String csname) {
		this.csname = csname;
	}

	public String getCclass() {
		return cclass;
	}

	public void setCclass(String cclass) {
		this.cclass = cclass;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}
}
