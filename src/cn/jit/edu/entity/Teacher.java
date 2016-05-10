package cn.jit.edu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity (name="teacher")
public class Teacher {
	@Column(name = "teaheadimg", nullable = true)
	String teaheadimg;								//用户头像
	@Column(name = "teaname", nullable = false) 
	String teaname;									//用户名
	@Column(name = "teano", nullable = false, unique = true)
	String teano;										//工号
	@Column(name = "teapasswd", nullable = false)
	String teapasswd;									//密码		
//	@Column(name = "teadesc", nullable = true)
//	String teadesc;									//个性签名

	@Column(name = "teacollege", nullable = false)
	String teacollege;								//所属学院；暂时显示插入中文。。
	
	@Column(name = "teastatus", nullable = false)
	String teastatus;	
	
	public String getTeastatus() {
		return teastatus;
	}

	public void setTeastatus(String teastatus) {
		this.teastatus = teastatus;
	}

	@Column(name = "teaemail", nullable = false)
	String teaemail;									//电子邮箱
	
	@Column(name = "teacontact", nullable = false)
	String teacontact;								//联系方式
	@Column(name = "modifydate", nullable = false)
	Date   modifydate;								//修改日期
//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "oneId")//指向多的那方的pojo的关联外键字段   
//	Collection manyCollection;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	int ID;											//主键id

	public String getTeaheadimg() {
		return teaheadimg;
	}

	public void setTeaheadimg(String teaheadimg) {
		this.teaheadimg = teaheadimg;
	}

	public String getTeaname() {
		return teaname;
	}

	public void setTeaname(String teaname) {
		this.teaname = teaname;
	}

	public String getTeano() {
		return teano;
	}

	public void setTeano(String teano) {
		this.teano = teano;
	}

	public String getTeapasswd() {
		return teapasswd;
	}

	public void setTeapasswd(String teapasswd) {
		this.teapasswd = teapasswd;
	}

	public String getTeacollege() {
		return teacollege;
	}

	public void setTeacollege(String teacollege) {
		this.teacollege = teacollege;
	}

	public String getTeaemail() {
		return teaemail;
	}

	public void setTeaemail(String teaemail) {
		this.teaemail = teaemail;
	}

	public String getTeacontact() {
		return teacontact;
	}

	public void setTeacontact(String teacontact) {
		this.teacontact = teacontact;
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