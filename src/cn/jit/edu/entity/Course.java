package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity (name="course")
public class Course {
	@Column(name = "coursename", nullable = false)
	String coursename;								//课程名称
	@Column(name = "courseno", nullable = false) 
	String courseno;								//课程代号
	@Column(name = "teano", nullable = false)
	String teano;									//任课老师工号
	@Column(name = "teaname", nullable = false)
	String teaname;									//任课老师名字		
	@Column(name = "college", nullable = false)
	String college;									//所属院系
	
//	@Column(name = "scontact", nullable = false)
//	String scontact;								//联系方式
	@Column(name = "modifydate", nullable = false)
	Date   modifydate;								//修改日期
//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "oneId")//指向多的那方的pojo的关联外键字段   
//	Collection manyCollection;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;											//主键id

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getCourseno() {
		return courseno;
	}

	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}

	public String getTeano() {
		return teano;
	}

	public void setTeano(String teano) {
		this.teano = teano;
	}

	public String getTeaname() {
		return teaname;
	}

	public void setTeaname(String teaname) {
		this.teaname = teaname;
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
